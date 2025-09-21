import 'package:c_pos/common/configs/box.dart';
import 'package:c_pos/common/extensions/extension.dart';
import 'package:c_pos/presentation/theme/themes.dart';
import 'package:c_pos/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A custom widget designed to display a voucher with a unique visual style.
class BasicVoucherCard extends StatelessWidget {
  final Function()? onSelectVoucher;

  final String voucherName;
  final String voucherCode;
  final double voucherValue;
  final double maxValue;
  final int usable;

  const BasicVoucherCard({
    this.onSelectVoucher,
    required this.voucherName,
    required this.voucherCode,
    required this.voucherValue,
    required this.maxValue,
    required this.usable,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Define layout constants for the voucher card
    double discountSectionWidth = 80.sp;
    double cutoutRadius = 10.sp;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
      // Add a subtle shadow to the card for depth
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: Offset(0, 4.sp),
          ),
        ],
      ),
      // Use CustomPaint to draw the complex background shape with cutouts and colors
      child: CustomPaint(
        painter: _VoucherBackgroundPainter(
          discountSectionWidth: discountSectionWidth,
          cutoutRadius: cutoutRadius,
          discountColor: AppColors.primaryColor,
          cardColor: Colors.white,
          borderColor: Colors.grey.shade300,
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _renderLeftSection(discountSectionWidth),
              // Right section: Contains the voucher details and apply button
              _renderRightSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderRightSection() {
    double contentHorizontalPadding = 16.sp;
    double contentVerticalPadding = 12.sp;
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: contentHorizontalPadding,
          vertical: contentVerticalPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    voucherName,
                    style: AppFont.t.s(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            BoxSpacer.s4,
            Text.rich(
              TextSpan(
                text: 'Giá trị: ',
                style: AppFont.t.s(),
                children: [
                  TextSpan(
                    text: voucherValue.formatCurrency,
                    style: AppFont.t.s().w700.primaryColor,
                  ),
                ],
              ),
            ),
            if (maxValue > 0) ...[
              BoxSpacer.s4,
              Text.rich(
                TextSpan(
                  text: 'Giảm tối đa: ',
                  style: AppFont.t.s(),
                  children: [
                    TextSpan(
                      text: maxValue.formatCurrency,
                      style: AppFont.t.s().w700.primaryColor,
                    ),
                  ],
                ),
              ),
            ],
            if (usable > 0) ...[
              BoxSpacer.s4,
              Text.rich(
                TextSpan(
                  text: 'SL còn lại: ',
                  style: AppFont.t.s(),
                  children: [
                    TextSpan(
                      text: usable.formatNumber,
                      style: AppFont.t.s().w700.primaryColor,
                    ),
                  ],
                ),
              ),
            ],
            BoxSpacer.s16,
            Center(
              child: XBaseButton(
                onPressed: () => onSelectVoucher?.call(),
                child: Text('Áp dụng', style: AppFont.t.s().w700),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _renderLeftSection(double discountSectionWidth) {
    return SizedBox(
      width: discountSectionWidth,
      child: Center(
        child: RotatedBox(
          quarterTurns: 3,
          child: Text(
            voucherCode,
            style: AppFont.t.s(13).w600.white,
          ),
        ),
      ),
    );
  }
}

/// A custom painter to draw the background of the voucher card,
/// including rounded corners, two color sections, cutouts, and a dashed border.
class _VoucherBackgroundPainter extends CustomPainter {
  final double discountSectionWidth;
  final double cutoutRadius;
  final Color discountColor;
  final Color cardColor;
  final Color borderColor;

  _VoucherBackgroundPainter({
    required this.discountSectionWidth,
    required this.cutoutRadius,
    required this.discountColor,
    required this.cardColor,
    required this.borderColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Define the overall rounded rectangle for the card
    final double borderRadius = 16.sp;
    final RRect overallRRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(borderRadius),
    );

    // X-coordinate of the seam between the discount and main content sections
    final double seamX = discountSectionWidth;

    // Y-coordinates for the cutouts, positioned at 25% and 75% of the card height
    final double cutoutYOffset = size.height * 0.25;
    final double centerCutoutY1 = cutoutYOffset;
    final double centerCutoutY2 = size.height - cutoutYOffset;
    final double leftEdgeCutoutY =
        size.height / 2; // Y-coordinate for the left edge cutout

    // Create paths for the circular cutouts
    final Path cutoutPath = Path()
      ..addOval(Rect.fromCircle(
          center: Offset(seamX, centerCutoutY1), radius: cutoutRadius))
      ..addOval(Rect.fromCircle(
          center: Offset(seamX, centerCutoutY2), radius: cutoutRadius))
      // The cutout on the very left edge, its center is at x=0.
      // When clipped by the overallRRect, it will appear as a half-circle.
      ..addOval(Rect.fromCircle(
          center: Offset(0, leftEdgeCutoutY), radius: cutoutRadius));

    // Create the final outline path for the entire card by subtracting the cutouts
    Path cardOutlinePath = Path()..addRRect(overallRRect);
    cardOutlinePath =
        Path.combine(PathOperation.difference, cardOutlinePath, cutoutPath);

    // Paint for the card's border
    final Paint borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.sp;
    canvas.drawPath(cardOutlinePath, borderPaint);

    // Save the current canvas state before clipping
    canvas.save();
    // Clip the drawing area to the complex card outline path (with holes)
    canvas.clipPath(cardOutlinePath);

    // Fill the left (discount) section with its color
    final Paint discountFillPaint = Paint()..color = discountColor;
    canvas.drawRect(Rect.fromLTWH(0, 0, seamX, size.height), discountFillPaint);

    // Fill the right (main content) section with its color
    final Paint cardFillPaint = Paint()..color = cardColor;
    canvas.drawRect(Rect.fromLTWH(seamX, 0, size.width - seamX, size.height),
        cardFillPaint);

    // Restore the canvas to its state before clipping
    canvas.restore();

    // Draw the dashed line along the seam
    final Paint dashPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.sp;

    double dashLength = 4.sp;
    double dashSpace = 4.sp;
    double currentY = 0;

    // Loop to draw dashes, skipping over the cutout areas
    while (currentY < size.height) {
      // Check if the current dash segment overlaps with any cutout
      bool isInsideCutout1 =
          (currentY + dashLength > centerCutoutY1 - cutoutRadius &&
              currentY < centerCutoutY1 + cutoutRadius);
      bool isInsideCutout2 =
          (currentY + dashLength > centerCutoutY2 - cutoutRadius &&
              currentY < centerCutoutY2 + cutoutRadius);

      if (!isInsideCutout1 && !isInsideCutout2) {
        // Draw a dash segment
        canvas.drawLine(
          Offset(seamX, currentY),
          Offset(seamX, (currentY + dashLength).clamp(0.0, size.height)),
          dashPaint,
        );
      }
      currentY += dashLength + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant _VoucherBackgroundPainter oldDelegate) {
    // Only repaint if any of the properties that affect the drawing have changed
    return oldDelegate.discountSectionWidth != discountSectionWidth ||
        oldDelegate.cutoutRadius != cutoutRadius ||
        oldDelegate.discountColor != discountColor ||
        oldDelegate.cardColor != cardColor ||
        oldDelegate.borderColor != borderColor;
  }
}
