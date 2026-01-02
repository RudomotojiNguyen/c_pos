#!/usr/bin/env python3
"""
Script để tìm các file Dart không được sử dụng trong project
"""
import os
import re
from pathlib import Path
from collections import defaultdict

def get_all_dart_files(root_dir):
    """Lấy tất cả các file .dart trong thư mục lib"""
    dart_files = []
    for root, dirs, files in os.walk(root_dir):
        # Bỏ qua thư mục build và .dart_tool
        dirs[:] = [d for d in dirs if d not in ['build', '.dart_tool', 'test']]
        for file in files:
            if file.endswith('.dart'):
                full_path = os.path.join(root, file)
                dart_files.append(full_path)
    return dart_files

def resolve_import_path(import_path, current_file):
    """Chuyển đổi import path thành đường dẫn file thực tế"""
    # Bỏ qua dart: và package: imports (chỉ xử lý package:c_pos)
    if import_path.startswith('dart:'):
        return None
    
    if import_path.startswith('package:'):
        if 'c_pos/' in import_path:
            relative_path = import_path.split('c_pos/')[1]
            return os.path.join('lib', relative_path) + '.dart'
        return None
    
    # Relative imports
    current_dir = os.path.dirname(current_file)
    if import_path.startswith('./') or import_path.startswith('../'):
        # Explicit relative path
        resolved = os.path.normpath(os.path.join(current_dir, import_path))
    else:
        # Implicit relative path (relative từ thư mục chứa file hiện tại)
        # Ví dụ: từ widgets.dart export 'button/x_button.dart' 
        # => lib/presentation/widgets/button/x_button.dart
        resolved = os.path.normpath(os.path.join(current_dir, import_path))
    
    if not resolved.endswith('.dart'):
        resolved += '.dart'
    
    return os.path.normpath(resolved)

def extract_imports_and_exports(content, current_file):
    """Trích xuất tất cả imports, exports, parts và part of từ nội dung file"""
    imports = []
    exports = []
    parts = []  # part 'file.dart'
    part_of = None  # part of 'file.dart' (chỉ có 1)
    
    # Pattern cho import, export, part và part of
    for line in content.split('\n'):
        # Import
        match = re.search(r"import\s+['\"](.*?)['\"]", line)
        if match:
            import_path = match.group(1).strip("'\"")
            resolved = resolve_import_path(import_path, current_file)
            if resolved:
                imports.append(resolved)
        
        # Export
        match = re.search(r"export\s+['\"](.*?)['\"]", line)
        if match:
            export_path = match.group(1).strip("'\"")
            resolved = resolve_import_path(export_path, current_file)
            if resolved:
                exports.append(resolved)
        
        # Part (file chính khai báo part)
        match = re.search(r"part\s+['\"](.*?)['\"]", line)
        if match:
            part_path = match.group(1).strip("'\"")
            resolved = resolve_import_path(part_path, current_file)
            if resolved:
                parts.append(resolved)
        
        # Part of (file part khai báo part of)
        match = re.search(r"part\s+of\s+['\"](.*?)['\"]", line)
        if match:
            part_of_path = match.group(1).strip("'\"")
            resolved = resolve_import_path(part_of_path, current_file)
            if resolved:
                part_of = resolved
    
    return imports, exports, parts, part_of

def analyze_unused_files():
    """Phân tích và tìm các file không được sử dụng"""
    root_dir = 'lib'
    
    # Lấy tất cả file Dart
    all_files = get_all_dart_files(root_dir)
    print(f"Tìm thấy {len(all_files)} file Dart trong {root_dir}/")
    
    # Map: file -> set of files that import it directly
    direct_imports = defaultdict(set)
    
    # Map: barrel file -> set of files it exports
    barrel_exports = defaultdict(set)
    
    # Map: main file -> set of part files
    main_file_parts = defaultdict(set)
    
    # Map: part file -> main file (part of)
    part_file_main = {}
    
    # Phân tích tất cả các file
    for file_path in all_files:
        try:
            with open(file_path, 'r', encoding='utf-8') as f:
                content = f.read()
                
                imports, exports, parts, part_of = extract_imports_and_exports(content, file_path)
                
                normalized_file = os.path.normpath(file_path)
                
                # Ghi nhận các file được import trực tiếp
                for imported_path in imports:
                    normalized_imported = os.path.normpath(imported_path)
                    direct_imports[normalized_imported].add(normalized_file)
                
                # Ghi nhận các file được export (barrel file)
                for exported_path in exports:
                    normalized_exported = os.path.normpath(exported_path)
                    barrel_exports[normalized_file].add(normalized_exported)
                
                # Ghi nhận các file part (file chính khai báo part)
                for part_path in parts:
                    normalized_part = os.path.normpath(part_path)
                    main_file_parts[normalized_file].add(normalized_part)
                
                # Ghi nhận part of (file part khai báo part of)
                if part_of:
                    normalized_part_of = os.path.normpath(part_of)
                    part_file_main[normalized_file] = normalized_part_of
                    
        except Exception as e:
            print(f"Lỗi khi đọc {file_path}: {e}")
    
    # Tạo set normalized paths của tất cả files để kiểm tra
    all_files_normalized = {os.path.normpath(f) for f in all_files}
    
    # Tìm tất cả các file được sử dụng (trực tiếp hoặc qua barrel file hoặc part)
    used_files = set()
    
    # Bước 1: Thêm các file được import trực tiếp
    used_files.update(direct_imports.keys())
    
    # Bước 2: Thêm các file chính nếu file part của chúng được sử dụng
    # (Nếu một file part được sử dụng, thì file chính cũng được sử dụng)
    for part_file, main_file in part_file_main.items():
        if part_file in used_files:
            used_files.add(main_file)
    
    # Bước 3: Propagate - nếu barrel file được import, thì các file nó export cũng được sử dụng
    # Và nếu file chính được sử dụng, thì các file part của nó cũng được sử dụng
    # Sử dụng BFS để propagate qua nhiều tầng
    queue = list(used_files)
    visited = set()
    
    while queue:
        current_file = queue.pop(0)
        if current_file in visited:
            continue
        visited.add(current_file)
        
        # Nếu file này là barrel file và được sử dụng, thì các file nó export cũng được sử dụng
        if current_file in barrel_exports:
            for exported_file in barrel_exports[current_file]:
                normalized_exported = os.path.normpath(exported_file)
                if normalized_exported in all_files_normalized:
                    if normalized_exported not in used_files:
                        used_files.add(normalized_exported)
                        queue.append(normalized_exported)
        
        # Nếu file này là file chính và được sử dụng, thì các file part của nó cũng được sử dụng
        if current_file in main_file_parts:
            for part_file in main_file_parts[current_file]:
                normalized_part = os.path.normpath(part_file)
                if normalized_part in all_files_normalized:
                    if normalized_part not in used_files:
                        used_files.add(normalized_part)
                        queue.append(normalized_part)
        
        # Nếu file này là file part và được sử dụng, thì file chính của nó cũng được sử dụng
        if current_file in part_file_main:
            main_file = part_file_main[current_file]
            if main_file in all_files_normalized:
                if main_file not in used_files:
                    used_files.add(main_file)
                    queue.append(main_file)
    
    # Tìm các file không được sử dụng
    unused_files = []
    
    for file_path in all_files:
        normalized = os.path.normpath(file_path)
        filename = os.path.basename(file_path)
        
        # Bỏ qua các file đặc biệt
        if filename == 'main.dart':
            continue
        
        # Bỏ qua các file generated (.g.dart)
        if filename.endswith('.g.dart'):
            continue
        
        # Bỏ qua các file firebase_options (có thể được dùng động)
        if 'firebase_options' in filename:
            continue
        
        # Kiểm tra xem file có được sử dụng không
        if normalized not in used_files:
            unused_files.append(file_path)
    
    return unused_files, direct_imports

if __name__ == '__main__':
    unused, references_map = analyze_unused_files()
    
    print(f"\n{'='*60}")
    print(f"Tìm thấy {len(unused)} file có thể không được sử dụng:")
    print(f"{'='*60}\n")
    
    if unused:
        # Nhóm theo thư mục
        by_dir = defaultdict(list)
        for file in unused:
            rel_path = os.path.relpath(file, 'lib')
            dir_name = os.path.dirname(rel_path)
            by_dir[dir_name].append(rel_path)
        
        for dir_name in sorted(by_dir.keys()):
            print(f"\n📁 {dir_name}/")
            for file in sorted(by_dir[dir_name]):
                print(f"  - {file}")
    else:
        print("  Không tìm thấy file nào không được sử dụng!")
    
    print(f"\n{'='*60}")
    print("Lưu ý: Một số file có thể được sử dụng thông qua:")
    print("  - Dynamic imports")
    print("  - Code generation")
    print("  - Reflection")
    print("  - Export từ barrel files")
    print("Hãy kiểm tra kỹ trước khi xóa!")
