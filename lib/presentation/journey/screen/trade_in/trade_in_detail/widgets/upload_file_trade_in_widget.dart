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
  const UploadFileTradeInWidget(
      {super.key, required this.id, this.isCanAction = true});

  final int id;
  final bool isCanAction;

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

          Map<String, ImageDetailModel> images =
              state is GetImageVerifySuccess ? state.images : {};

          int count = images.length;
          final List<String> keys = images.keys.toList();
          final List<GalleryItemModel> convertGalleries = keys
              .map((e) => images[e]!.convertGalleryItemModel)
              .toList()
              .where((element) => element.checkHasData)
              .toList();

          return Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 16.sp,
            runSpacing: 16.sp,
            children: [
              ...List.generate(count, (index) {
                final ImageDetailModel image = images[keys[index]]!;
                return ImageVerifyItem(
                  image: image,
                  onPreviewImage: () =>
                      _onPreviewImage(index, convertGalleries),
                  callback: !widget.isCanAction
                      ? null
                      : (value) => _onSelectImage(value, index, image),
                  onRemove:
                      widget.isCanAction ? () => _onRemoveImage(image) : null,
                  onUpload:
                      widget.isCanAction ? () => _onUploadImage(image) : null,
                );
              }),
              if (widget.isCanAction) ...[
                XButtonUploadImage(
                  callback: (XFile? result) {
                    _onSelectImage(result, count + 1, ImageDetailModel());
                  },
                ),
              ],
            ],
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
  _onRemoveImage(ImageDetailModel image) {
    _tradeInBloc
        .add(RemoveImageTradeInEvent(uuid: image.uuid!, tradeInId: widget.id));
  }

  // upload hình
  _onUploadImage(ImageDetailModel image) {
    if (image.imageLocal != null) {
      _tradeInBloc.add(
        UploadImageTradeInEvent(
          tradeInBillId: widget.id,
          file: image.imageLocal!,
          uuid: image.uuid!,
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
    this.callback,
    this.onRemove,
    this.onUpload,
    required this.onPreviewImage,
  });

  final ImageDetailModel image;
  final Function(XFile?)? callback;
  final Function()? onRemove;
  final Function()? onUpload;
  final Function() onPreviewImage;

  @override
  State<ImageVerifyItem> createState() => _ImageVerifyItemState();
}

class _ImageVerifyItemState extends State<ImageVerifyItem> with DialogHelper {
  final double width = 64.sp;
  final double height = 64.sp;

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
        if (widget.image.checkHasData ||
            widget.image.isSelectImage ||
            widget.image.id != null) ...[
          BoxSpacer.s8,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
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
                        widget.onRemove?.call();
                      },
                    );
                  } else {
                    widget.onRemove?.call();
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
      child: Assets.svg.upload.svg(
        width: width,
        height: height,
      ),
    );
  }

  ///
  /// METHOD
  ///
  _onSelectImage() {
    if (widget.callback != null) {
      showModalSelectImage(context, callback: widget.callback!);
    }
  }
}
