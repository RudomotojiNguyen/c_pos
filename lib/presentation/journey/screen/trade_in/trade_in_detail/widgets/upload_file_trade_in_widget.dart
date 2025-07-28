import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../common/configs/box.dart';
import '../../../../../../common/di/injection/injection.dart';
import '../../../../../../common/extensions/extension.dart';
import 'package:c_pos/data/models/models.dart';
import '../../../../../../gen/gen.dart';
import '../../../../../mixins/mixins.dart';
import '../../../../../theme/themes.dart';
import '../../../../../widgets/loading/image_verify_loading.dart';
import '../../../../../widgets/widgets.dart';
import '../../../../router.dart';
import '../../bloc/trade_in_bloc.dart';

class UploadFileTradeInWidget extends StatefulWidget {
  const UploadFileTradeInWidget({super.key, required this.id});

  final int id;

  @override
  State<UploadFileTradeInWidget> createState() =>
      _UploadFileTradeInWidgetState();
}

class _UploadFileTradeInWidgetState extends State<UploadFileTradeInWidget> {
  final TradeInBloc _tradeInBloc = getIt.get<TradeInBloc>();

  @override
  void initState() {
    super.initState();
    _tradeInBloc.add(GetImagesTradeInEvent(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return XContainer(
      margin: EdgeInsets.only(top: 16.sp),
      iconTitle: Assets.svg.idCard.svg(
        width: 28.sp,
        height: 28.sp,
      ),
      title: 'File đính kèm',
      child: BlocBuilder<TradeInBloc, TradeInState>(
        bloc: _tradeInBloc,
        builder: (context, state) {
          if (state is IsCriteriaLoading) {
            return const ImageVerifyLoading();
          }

          List<ImageDetailModel> images =
              state is GetImageVerifySuccess ? state.images : [];

          List<GalleryItemModel> convertGalleries = images
              .map((e) => e.convertGalleryItemModel)
              .toList()
              .where((element) => element.checkHasData)
              .toList();

          return GridView.count(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 20.sp,
            mainAxisSpacing: 20.sp,
            childAspectRatio: 3 / 3,
            children: List.generate(images.length, (index) {
              final ImageDetailModel image = images[index];
              return ImageVerifyItem(
                image: image,
                onPreviewImage: () => _onPreviewImage(index, convertGalleries),
                callback: (value, files) =>
                    _onSelectImage(value ?? files?.first, index, image),
                onRemove: () => _onRemoveImage(index, image),
                onUpload: () => _onUploadImage(index, image),
              );
            }),
          );
        },
      ),
    );
  }

  // chuyển trới trang preview
  _onPreviewImage(int index, List<GalleryItemModel> galleries) {
    MainRouter.instance.navigateToPreviewAssets(
      context,
      galleries: galleries,
      initialIndex: index,
    );
  }

  // chọn hình
  _onSelectImage(XFile? value, int index, ImageDetailModel image) {
    if (value == null) {
      return;
    }
    _tradeInBloc.add(
      UpdateImageTradeInEvent(index: index, value: value, uuid: image.uuid),
    );
  }

  // xóa hình
  _onRemoveImage(int index, ImageDetailModel image) {
    _tradeInBloc.add(RemoveImageTradeInEvent(index: index, uuid: image.uuid));
  }

  // upload hình
  _onUploadImage(int index, ImageDetailModel image) {
    if (image.imageLocal != null) {
      _tradeInBloc.add(
        UploadImageTradeInEvent(
          tradeInBillId: widget.id,
          file: image.imageLocal!,
          index: index,
        ),
      );
    }
  }
}

/// nếu như đã upload hình rồi thì không select đc, chỉ có thể xem detail
/// muốn đổi mới cần phải xóa đi thêm lại
class ImageVerifyItem extends StatefulWidget {
  const ImageVerifyItem({
    super.key,
    required this.image,
    required this.callback,
    required this.onRemove,
    required this.onUpload,
    required this.onPreviewImage,
  });

  final ImageDetailModel image;
  final Function(XFile?, List<XFile>?) callback;
  final Function() onRemove;
  final Function() onUpload;
  final Function() onPreviewImage;

  @override
  State<ImageVerifyItem> createState() => _ImageVerifyItemState();
}

class _ImageVerifyItemState extends State<ImageVerifyItem> with DialogHelper {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _imageRender(
          data: widget.image.data,
          localImage: widget.image.imageLocal,
        ),
        if (widget.image.checkHasData || widget.image.isSelectImage) ...[
          BoxSpacer.s8,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!widget.image.checkHasData) ...[
                // nếu không có data từ server thì cho gửi đi
                XBaseButton(
                  padding: EdgeInsets.symmetric(
                    vertical: 4.sp,
                    horizontal: 4.sp,
                  ),
                  onPressed: widget.onUpload,
                  child: Text(
                    'Xong',
                    style: AppFont.t.s(),
                  ),
                ),
                BoxSpacer.s16,
              ],
              XBaseButton(
                padding: EdgeInsets.symmetric(vertical: 4.sp, horizontal: 4.sp),
                onPressed: () {
                  if (widget.image.id != null) {
                    showConfirmDialog(
                      context,
                      contentWarning: 'Bạn có muốn xóa hình đã lưu!!!',
                      onAccept: () {
                        widget.onRemove();
                      },
                    );
                  } else {
                    widget.onRemove();
                  }
                },
                child: Text(
                  'Xóa',
                  style: AppFont.t.s(),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _imageRender({Uint8List? data, XFile? localImage}) {
    final double width = 100.sp;
    final double height = 100.sp;
    final Radius border = AppRadius.l;

    if (data != null) {
      return XBaseButton(
        onPressed: widget.onPreviewImage,
        child: ClipRRect(
          borderRadius: BorderRadius.all(border),
          child: Image.memory(
            data,
            fit: BoxFit.cover,
            width: width,
            height: height,
          ),
        ),
      );
    }
    if (localImage != null) {
      return XBaseButton(
        onPressed: widget.onPreviewImage,
        child: XImage(
          imagePath: localImage.path,
          fit: BoxFit.cover,
          borderRadius: BorderRadius.all(border),
          width: width,
          height: height,
        ),
      );
    }

    return XBaseButton(
      onPressed: _onSelectImage,
      child: Assets.svg.cloudUpload.svg(
        width: 115.sp,
        height: 115.sp,
      ),
    );
  }

  ///
  /// METHOD
  ///
  _onSelectImage() {
    // showModalSelectImage(context, callback: widget.callback);
  }
}
