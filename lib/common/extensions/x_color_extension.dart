import 'package:flutter/material.dart';

extension XColorExtension on Color {
  ColorFilter changeColorFilterSVGImage({BlendMode mode = BlendMode.srcIn}) {
    return ColorFilter.mode(this, mode);
  }

  Color get getContrastColor {
    // Tính toán độ sáng theo tiêu chuẩn WCAG
    final luminance = (0.299 * red + 0.587 * green + 0.114 * blue) / 255;

    // Nếu độ sáng lớn hơn 0.5, trả về màu tối (đen), ngược lại trả về màu sáng (trắng)
    return luminance > 0.5 ? Colors.black : Colors.white;
  }
}
