#!/usr/bin/env python3
"""
Script để tìm các hàm, biến, class và các thành phần không được sử dụng trong Dart code
"""
import os
import re
from collections import defaultdict
from pathlib import Path

def get_all_dart_files(root_dir):
    """Lấy tất cả các file .dart trong thư mục lib"""
    dart_files = []
    for root, dirs, files in os.walk(root_dir):
        dirs[:] = [d for d in dirs if d not in ['build', '.dart_tool', 'test']]
        for file in files:
            if file.endswith('.dart') and not file.endswith('.g.dart'):
                full_path = os.path.join(root, file)
                dart_files.append(full_path)
    return dart_files

def extract_class_declarations(content, file_path):
    """Trích xuất các class declarations"""
    classes = []
    # Pattern: class ClassName { hoặc class ClassName extends/implements
    pattern = r'class\s+(\w+)(?:\s+extends|\s+implements|\s+with|\s*\{)'
    for match in re.finditer(pattern, content):
        class_name = match.group(1)
        # Bỏ qua các class đặc biệt
        if class_name not in ['State', 'Widget', 'StatelessWidget', 'StatefulWidget']:
            classes.append({
                'name': class_name,
                'line': content[:match.start()].count('\n') + 1,
                'file': file_path
            })
    return classes

def extract_function_declarations(content, file_path):
    """Trích xuất các function/method declarations"""
    functions = []
    
    # Pattern cho functions và methods
    # Cải thiện pattern để bắt được nhiều trường hợp hơn
    # void functionName() hoặc ReturnType functionName() hoặc Future<void> functionName()
    pattern = r'(?:^|\s+)(?:static\s+)?(?:void|Future<void>|Future<[^>]+>|FutureOr<[^>]+>|\w+\??)\s+(\w+)\s*\([^)]*\)\s*(?:async\s*)?(?:=>|{)'
    
    for match in re.finditer(pattern, content, re.MULTILINE):
        func_name = match.group(1)
        # Bỏ qua các method đặc biệt và keywords
        skip_names = ['main', 'build', 'initState', 'dispose', 'createState', 'setState', 
                     'super', 'this', 'return', 'if', 'for', 'while', 'switch', 'case']
        if func_name in skip_names:
            continue
        
        # Kiểm tra không phải là constructor (constructor có tên trùng với class)
        # Kiểm tra context xung quanh để tránh false positives
        start_pos = match.start()
        # Lấy một đoạn code trước đó để kiểm tra
        context_start = max(0, start_pos - 50)
        context = content[context_start:start_pos]
        
        # Bỏ qua nếu là constructor hoặc getter/setter
        if re.search(r'^\s*' + func_name + r'\s*\(', context, re.MULTILINE):
            continue
        if re.search(r'get\s+' + func_name + r'\s*\{', context):
            continue
        if re.search(r'set\s+' + func_name + r'\s*\(', context):
            continue
        
        functions.append({
            'name': func_name,
            'line': content[:start_pos].count('\n') + 1,
            'file': file_path
        })
    
    return functions

def extract_variable_declarations(content, file_path):
    """Trích xuất các variable declarations"""
    variables = []
    
    # Pattern cho các biến - cải thiện để bắt được nhiều trường hợp hơn
    # final/var/const Type variableName hoặc Type? variableName
    # Hoặc final variableName = ...
    pattern = r'(?:^|\s+)(?:static\s+)?(?:final|var|const)\s+(?:late\s+)?(?:\w+\??\s+)?(\w+)\s*(?:=|;|,)'
    
    for match in re.finditer(pattern, content, re.MULTILINE):
        var_name = match.group(1)
        # Bỏ qua các biến/keywords đặc biệt
        skip_names = ['key', 'super', 'this', 'context', 'null', 'true', 'false', 
                     'void', 'int', 'String', 'bool', 'double', 'List', 'Map']
        if var_name in skip_names:
            continue
        
        # Kiểm tra context để tránh false positives
        start_pos = match.start()
        context_start = max(0, start_pos - 30)
        context = content[context_start:start_pos]
        
        # Bỏ qua nếu là type annotation trong function parameter
        if re.search(r'\([^)]*' + var_name + r'\s*[,)]', context):
            continue
        
        variables.append({
            'name': var_name,
            'line': content[:start_pos].count('\n') + 1,
            'file': file_path
        })
    
    return variables

def extract_enum_declarations(content, file_path):
    """Trích xuất các enum declarations"""
    enums = []
    # Pattern: enum EnumName {
    pattern = r'enum\s+(\w+)\s*\{'
    for match in re.finditer(pattern, content):
        enum_name = match.group(1)
        enums.append({
            'name': enum_name,
            'line': content[:match.start()].count('\n') + 1,
            'file': file_path
        })
    return enums

def extract_extension_declarations(content, file_path):
    """Trích xuất các extension declarations"""
    extensions = []
    # Pattern: extension ExtensionName on Type
    pattern = r'extension\s+(\w+)\s+on\s+\w+'
    for match in re.finditer(pattern, content):
        ext_name = match.group(1)
        extensions.append({
            'name': ext_name,
            'line': content[:match.start()].count('\n') + 1,
            'file': file_path
        })
    return extensions

def find_usages(name, all_files, declaring_file):
    """Tìm các nơi sử dụng một tên (class, function, variable)"""
    usages = []
    normalized_name = name
    is_private = name.startswith('_')
    
    for file_path in all_files:
        try:
            with open(file_path, 'r', encoding='utf-8') as f:
                content = f.read()
            
            # Nếu là private member, chỉ tìm trong cùng file
            if is_private:
                if file_path != declaring_file:
                    continue
            
            # Tìm vị trí declaration để bỏ qua khi tìm usage
            declaration_patterns = [
                rf'class\s+{re.escape(normalized_name)}\s*(?:extends|implements|with|\{{)',
                rf'enum\s+{re.escape(normalized_name)}\s*\{{',
                rf'extension\s+{re.escape(normalized_name)}\s+on',
                rf'(?:void|Future<void>|Future<[^>]+>|FutureOr<[^>]+>|\w+\??)\s+{re.escape(normalized_name)}\s*\(',
                rf'(?:static\s+)?(?:final|var|const)\s+(?:late\s+)?(?:\w+\??\s+)?{re.escape(normalized_name)}\s*[=;,]',
            ]
            
            declaration_pos = -1
            for pattern in declaration_patterns:
                match = re.search(pattern, content)
                if match:
                    declaration_pos = match.start()
                    break
            
            # Tìm usage - cải thiện patterns để bắt được nhiều trường hợp hơn
            patterns = [
                # Class usage patterns
                rf'\bextends\s+{re.escape(normalized_name)}\b',  # extends ClassName
                rf'\bimplements\s+{re.escape(normalized_name)}\b',  # implements ClassName
                rf'\bwith\s+{re.escape(normalized_name)}\b',  # with ClassName
                rf'\bis\s+{re.escape(normalized_name)}\b',  # is ClassName
                rf'\bas\s+{re.escape(normalized_name)}\b',  # as ClassName
                rf':\s*{re.escape(normalized_name)}\b',  # : ClassName (type annotation)
                rf'<\s*{re.escape(normalized_name)}\b',  # <ClassName (generic)
                rf'{re.escape(normalized_name)}\s*<',  # ClassName< (generic usage)
                rf'{re.escape(normalized_name)}\s*\(',  # ClassName( (constructor call)
                rf'new\s+{re.escape(normalized_name)}\s*\(',  # new ClassName(
                rf'const\s+{re.escape(normalized_name)}\s*\(',  # const ClassName(
                rf'@\s*{re.escape(normalized_name)}\b',  # @ClassName (annotation)
                
                # Function/Method usage patterns
                rf'\b{re.escape(normalized_name)}\s*\(',  # functionName(
                rf'\.{re.escape(normalized_name)}\s*\(',  # .methodName(
                rf'\.{re.escape(normalized_name)}\b',  # .methodName (getter/property)
                rf'\?\.{re.escape(normalized_name)}\s*\(',  # ?.methodName(
                rf'\?\.{re.escape(normalized_name)}\b',  # ?.methodName
                
                # Variable usage patterns
                rf'\b{re.escape(normalized_name)}\s*=',  # variableName =
                rf'\b{re.escape(normalized_name)}\s*\.',  # variableName.
                rf'\b{re.escape(normalized_name)}\s*\[',  # variableName[
                rf'\b{re.escape(normalized_name)}\s*;',  # variableName;
                rf'\b{re.escape(normalized_name)}\s*,',  # variableName,
                rf'\b{re.escape(normalized_name)}\s*\)',  # variableName)
                rf'\b{re.escape(normalized_name)}\s*\}}',  # variableName}
                rf'\b{re.escape(normalized_name)}\s*\+',  # variableName +
                rf'\b{re.escape(normalized_name)}\s*-',  # variableName -
                rf'\b{re.escape(normalized_name)}\s*\*',  # variableName *
                rf'\b{re.escape(normalized_name)}\s*/',  # variableName /
                rf'\b{re.escape(normalized_name)}\s*==',  # variableName ==
                rf'\b{re.escape(normalized_name)}\s*!=',  # variableName !=
                rf'\b{re.escape(normalized_name)}\s*&&',  # variableName &&
                rf'\b{re.escape(normalized_name)}\s*\|\|',  # variableName ||
                rf'\b{re.escape(normalized_name)}\s*\?',  # variableName ?
                rf'\b{re.escape(normalized_name)}\s*:',  # variableName :
                rf'return\s+{re.escape(normalized_name)}\b',  # return variableName
                rf'await\s+{re.escape(normalized_name)}\b',  # await variableName
                
                # Enum usage
                rf'{re.escape(normalized_name)}\.',  # EnumName.value
                rf'\.{re.escape(normalized_name)}\b',  # .EnumValue
            ]
            
            # Tìm usage (bỏ qua phần declaration nếu có)
            search_content = content
            if declaration_pos >= 0:
                # Tìm dòng chứa declaration
                lines_before = content[:declaration_pos].split('\n')
                declaration_line = len(lines_before) - 1
                
                # Bỏ qua dòng declaration và 2 dòng sau đó (để tránh false positive)
                all_lines = content.split('\n')
                if declaration_line + 3 < len(all_lines):
                    search_content = '\n'.join(all_lines[declaration_line + 3:])
                else:
                    search_content = ''  # Nếu file quá ngắn, không tìm
            
            # Kiểm tra từng pattern
            found_usage = False
            for pattern in patterns:
                if re.search(pattern, search_content):
                    found_usage = True
                    break
            
            # Đặc biệt: nếu là private member và trong cùng file, kiểm tra kỹ hơn
            if is_private and file_path == declaring_file:
                # Tìm tất cả occurrences (trừ declaration)
                all_matches = list(re.finditer(rf'\b{re.escape(normalized_name)}\b', search_content))
                if len(all_matches) > 0:
                    found_usage = True
            
            if found_usage:
                if file_path not in usages:
                    usages.append(file_path)
        except Exception as e:
            pass
    
    return usages

def analyze_unused_code():
    """Phân tích và tìm các thành phần không được sử dụng"""
    root_dir = 'lib'
    
    all_files = get_all_dart_files(root_dir)
    print(f"Tìm thấy {len(all_files)} file Dart trong {root_dir}/")
    print("Đang phân tích...\n")
    
    all_classes = []
    all_functions = []
    all_variables = []
    all_enums = []
    all_extensions = []
    
    # Thu thập tất cả declarations
    for file_path in all_files:
        try:
            with open(file_path, 'r', encoding='utf-8') as f:
                content = f.read()
                
                all_classes.extend(extract_class_declarations(content, file_path))
                all_functions.extend(extract_function_declarations(content, file_path))
                all_variables.extend(extract_variable_declarations(content, file_path))
                all_enums.extend(extract_enum_declarations(content, file_path))
                all_extensions.extend(extract_extension_declarations(content, file_path))
        except Exception as e:
            print(f"Lỗi khi đọc {file_path}: {e}")
    
    print(f"Tìm thấy:")
    print(f"  - {len(all_classes)} classes")
    print(f"  - {len(all_functions)} functions")
    print(f"  - {len(all_variables)} variables")
    print(f"  - {len(all_enums)} enums")
    print(f"  - {len(all_extensions)} extensions")
    print("\nĐang kiểm tra usage...\n")
    
    # Tìm các thành phần không được sử dụng
    unused_classes = []
    unused_functions = []
    unused_variables = []
    unused_enums = []
    unused_extensions = []
    
    # Kiểm tra classes
    for cls in all_classes:
        usages = find_usages(cls['name'], all_files, cls['file'])
        if not usages:
            unused_classes.append(cls)
    
    # Kiểm tra functions
    for func in all_functions:
        usages = find_usages(func['name'], all_files, func['file'])
        if not usages:
            unused_functions.append(func)
    
    # Kiểm tra variables
    for var_item in all_variables:
        usages = find_usages(var_item['name'], all_files, var_item['file'])
        if not usages:
            unused_variables.append(var_item)
    
    # Kiểm tra enums
    for enum_item in all_enums:
        usages = find_usages(enum_item['name'], all_files, enum_item['file'])
        if not usages:
            unused_enums.append(enum_item)
    
    # Kiểm tra extensions
    for ext in all_extensions:
        usages = find_usages(ext['name'], all_files, ext['file'])
        if not usages:
            unused_extensions.append(ext)
    
    return {
        'classes': unused_classes,
        'functions': unused_functions,
        'variables': unused_variables,
        'enums': unused_enums,
        'extensions': unused_extensions
    }

if __name__ == '__main__':
    results = analyze_unused_code()
    
    print(f"\n{'='*60}")
    print("KẾT QUẢ PHÂN TÍCH")
    print(f"{'='*60}\n")
    
    total_unused = (len(results['classes']) + len(results['functions']) + 
                    len(results['variables']) + len(results['enums']) + 
                    len(results['extensions']))
    
    print(f"Tổng cộng: {total_unused} thành phần có thể không được sử dụng\n")
    
    # Classes
    if results['classes']:
        print(f"📦 CLASSES ({len(results['classes'])}):")
        for cls in results['classes'][:20]:  # Hiển thị tối đa 20
            rel_path = os.path.relpath(cls['file'], 'lib')
            print(f"  - {cls['name']} (line {cls['line']}) in {rel_path}")
        if len(results['classes']) > 20:
            print(f"  ... và {len(results['classes']) - 20} class khác")
        print()
    
    # Functions
    if results['functions']:
        print(f"🔧 FUNCTIONS ({len(results['functions'])}):")
        for func in results['functions'][:20]:
            rel_path = os.path.relpath(func['file'], 'lib')
            print(f"  - {func['name']}() (line {func['line']}) in {rel_path}")
        if len(results['functions']) > 20:
            print(f"  ... và {len(results['functions']) - 20} function khác")
        print()
    
    # Variables
    if results['variables']:
        print(f"📝 VARIABLES ({len(results['variables'])}):")
        for var_item in results['variables'][:20]:
            rel_path = os.path.relpath(var_item['file'], 'lib')
            print(f"  - {var_item['name']} (line {var_item['line']}) in {rel_path}")
        if len(results['variables']) > 20:
            print(f"  ... và {len(results['variables']) - 20} variable khác")
        print()
    
    # Enums
    if results['enums']:
        print(f"🔢 ENUMS ({len(results['enums'])}):")
        for enum_item in results['enums'][:20]:
            rel_path = os.path.relpath(enum_item['file'], 'lib')
            print(f"  - {enum_item['name']} (line {enum_item['line']}) in {rel_path}")
        if len(results['enums']) > 20:
            print(f"  ... và {len(results['enums']) - 20} enum khác")
        print()
    
    # Extensions
    if results['extensions']:
        print(f"🔌 EXTENSIONS ({len(results['extensions'])}):")
        for ext in results['extensions'][:20]:
            rel_path = os.path.relpath(ext['file'], 'lib')
            print(f"  - {ext['name']} (line {ext['line']}) in {rel_path}")
        if len(results['extensions']) > 20:
            print(f"  ... và {len(results['extensions']) - 20} extension khác")
        print()
    
    if total_unused == 0:
        print("✅ Không tìm thấy thành phần nào không được sử dụng!")
    
    print(f"\n{'='*60}")
    print("Lưu ý:")
    print("  - Một số thành phần có thể được sử dụng thông qua:")
    print("    * Dynamic calls (reflection)")
    print("    * Code generation")
    print("    * External libraries")
    print("    * Override methods (build, initState, etc.)")
    print("  - Hãy kiểm tra kỹ trước khi xóa!")

