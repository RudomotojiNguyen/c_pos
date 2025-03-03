import 'dart:io';

import 'package:c_pos/common/extensions/extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import '../../common/utils/validation_utils.dart';
import 'widgets.dart';

class XImage extends StatelessWidget with ValidationHelper {
  const XImage({
    super.key,
    required this.imagePath,
    this.size = const Size(100.0, 100.0),
    this.borderRadius = BorderRadius.zero,
    this.svgIconColor,
    this.fit,
    this.animationController,
    this.onLoaded,
    this.errorWidget,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  final Size size;
  final String imagePath;
  final BorderRadius? borderRadius;
  final Color? svgIconColor;
  final BoxFit? fit;
  final AnimationController? animationController;
  final Function(LottieComposition)? onLoaded;
  final Widget Function(BuildContext, String, Object)? errorWidget;

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;
    if (imagePath.endsWith('.svg')) {
      imageWidget = _buildSvgImage(context);
    } else if (imagePath.endsWith('.json')) {
      imageWidget = _buildLottieAnimation(context);
    } else if (imagePath.startsWith('res/')) {
      imageWidget = _buildAssetImage(context);
    } else if (imagePath.startsWith('file://') ||
        imagePath.startsWith('/data/') ||
        imagePath.startsWith('/Users/') ||
        imagePath.startsWith('/private/var/mobile')) {
      imageWidget = _buildImageFromFile(context);
    } else if (ValidationHelper.checkIsImageNetWork(imagePath)) {
      imageWidget = _buildImageNetwork(context);
    } else {
      imageWidget = _buildEmptyImage(context);
    }

    return borderRadius != null
        ? ClipRRect(
            borderRadius: borderRadius!,
            child: imageWidget,
          )
        : imageWidget;
  }

  Widget _buildImageNetwork(BuildContext context) {
    return CachedNetworkImage(
      fit: fit ?? BoxFit.cover,
      imageUrl: imagePath,
      width: width ?? size.width,
      height: height ?? size.height,
      placeholder: (_, __) => XPlaceHolder(
        width: size.width,
        height: size.height,
      ),
      errorWidget: errorWidget,
    );
  }

  Widget _buildLottieAnimation(BuildContext context) {
    return Lottie.asset(
      imagePath,
      width: size.width,
      height: size.height,
      fit: fit ?? BoxFit.cover,
      controller: animationController,
      onLoaded: onLoaded,
    );
  }

  Widget _buildAssetImage(BuildContext context) {
    return Image.asset(
      imagePath,
      fit: fit ?? BoxFit.cover,
      width: size.width,
      height: size.height,
    );
  }

  Widget _buildImageFromFile(BuildContext context) {
    return Image.file(
      File(imagePath),
      width: size.width,
      height: size.height,
      fit: fit ?? BoxFit.cover,
    );
  }

  Widget _buildSvgImage(BuildContext context) {
    return SvgPicture.asset(
      imagePath,
      fit: fit ?? BoxFit.cover,
      width: size.width,
      height: size.height,
      // color: svgIconColor,
      colorFilter: svgIconColor?.changeColorFilterSVGImage(),
    );
  }

  Widget _buildEmptyImage(BuildContext context) {
    return const SizedBox();
    // return Image.asset(
    //   GraphicConstants.imgPlaceHolder,
    //   fit: fit ?? BoxFit.cover,
    //   width: size.width,
    //   height: size.height,
    // );
  }
}
