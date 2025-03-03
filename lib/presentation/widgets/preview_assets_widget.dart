import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../common/extensions/extension.dart';
import '../../data/models/image_detail_model.dart';
import '../journey/router.dart';
import '../theme/themes.dart';
import 'widgets.dart';

class PreviewAssetsWidget extends StatefulWidget {
  PreviewAssetsWidget(
      {super.key,
      this.galleries = const [],
      this.initialIndex = 0,
      this.scrollDirection = Axis.horizontal,
      this.loadingBuilder,
      this.backgroundDecoration,
      this.minScale,
      this.maxScale,
      this.gallery})
      : pageController = PageController(initialPage: initialIndex);

  final GalleryItemModel? gallery;
  final LoadingBuilder? loadingBuilder;
  final BoxDecoration? backgroundDecoration;
  final List<GalleryItemModel> galleries;
  final int initialIndex;
  final Axis scrollDirection;
  final PageController pageController;
  final dynamic minScale;
  final dynamic maxScale;

  @override
  State<PreviewAssetsWidget> createState() => _PreviewAssetsWidgetState();
}

class _PreviewAssetsWidgetState extends State<PreviewAssetsWidget> {
  late ValueNotifier<int> currentIndexController;

  // final ManageFileServices manageFileServices = ManageFileServices();

  @override
  void initState() {
    super.initState();
    currentIndexController = ValueNotifier(widget.initialIndex + 1);
  }

  void onPageChanged(int index) {
    currentIndexController.value = index + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          widget.gallery != null ? _onlyGallery() : _listGallery(),
          _header(),
        ],
      ),
    );
  }

  Widget _header() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).viewPadding.top,
        bottom: 8.sp,
        left: 16.sp,
        right: 16.sp,
      ),
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.1),
      ),
      child: Row(
        children: [
          XBaseButton(
            onPressed: () {
              MainRouter.instance.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              size: 24.sp,
              color: AppColors.white,
            ),
          ),
          const Spacer(),
          ValueListenableBuilder(
              valueListenable: currentIndexController,
              builder: (context, value, _) {
                return Text(
                  widget.gallery != null
                      ? '1/1'
                      : '$value/${widget.galleries.length}',
                  style: AppFont.t.s(12).w500.white,
                );
              }),
        ],
      ),
    );
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    final GalleryItemModel item = widget.galleries[index];
    return PhotoViewGalleryPageOptions(
      imageProvider: item.getImageProvider,
      initialScale: PhotoViewComputedScale.contained,
      minScale: PhotoViewComputedScale.contained * (0.5 + index / 10),
      maxScale: PhotoViewComputedScale.covered * 4.1,
      heroAttributes: PhotoViewHeroAttributes(tag: item.id),
    );
  }

  Widget _onlyGallery() {
    return PhotoView(
      heroAttributes: PhotoViewHeroAttributes(tag: widget.gallery!.id),
      initialScale: PhotoViewComputedScale.contained,
      minScale: PhotoViewComputedScale.contained * (0.5 + 0 / 10),
      maxScale: PhotoViewComputedScale.covered * 4.1,
      imageProvider: widget.gallery!.getImageProvider,
      enableRotation: true,
    );
  }

  Widget _listGallery() {
    return PhotoViewGallery.builder(
      scrollPhysics: const BouncingScrollPhysics(),
      builder: _buildItem,
      itemCount: widget.galleries.length,
      loadingBuilder: widget.loadingBuilder,
      backgroundDecoration: widget.backgroundDecoration,
      pageController: widget.pageController,
      onPageChanged: onPageChanged,
      scrollDirection: widget.scrollDirection,
      enableRotation: true,
    );
  }
}
