import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';

import '../../../../../common/enum/enum.dart';
import '../../../../widgets/widgets.dart';
import '../bloc/scan_bloc.dart';

class CameraScan extends StatefulWidget {
  const CameraScan({
    super.key,
    required this.scanBloc,
    this.onResult,
    this.scanMode = XScanMode.defaultMode,
  });

  final ScanBloc scanBloc;
  final XScanMode scanMode;
  final Function({String? code, List<String>? codes})? onResult;

  @override
  State<CameraScan> createState() => _CameraScanState();
}

class _CameraScanState extends State<CameraScan> {
  CameraController? _cameraController;
  late BarcodeScanner _barcodeScanner;
  bool _isScanning = false;

  // final _orientations = {
  //   DeviceOrientation.portraitUp: 0,
  //   DeviceOrientation.landscapeLeft: 90,
  //   DeviceOrientation.portraitDown: 180,
  //   DeviceOrientation.landscapeRight: 270,
  // };

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _barcodeScanner = BarcodeScanner();
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    _barcodeScanner.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_cameraController != null && _cameraController!.value.isInitialized) {
      final double aspectRatio = _cameraController!.value.aspectRatio;

      return AspectRatio(
        aspectRatio: aspectRatio,
        child: CameraPreview(_cameraController!),
      );
    }
    return const Center(child: XLoading());
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final camera = cameras.first;

    _cameraController = CameraController(
      camera,
      ResolutionPreset.max,
      enableAudio: false,
      imageFormatGroup: Platform.isAndroid
          ? ImageFormatGroup.nv21 // for Android
          : ImageFormatGroup.bgra8888, // for iOS
    );

    _cameraController!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});

      _startImageStream();
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  void _startImageStream() {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }
    _cameraController!.startImageStream((CameraImage image) async {
      if (_isScanning) return;

      if (image.planes.isEmpty || image.planes.first.bytes.isEmpty) {
        debugPrint('Invalid CameraImage data.');
        return;
      }

      _isScanning = true;

      try {
        final plane = image.planes.first;
        Uint8List newImg;
        InputImageFormat inputImageFormat;

        if (image.format.group == ImageFormatGroup.yuv420) {
          inputImageFormat = InputImageFormat.yuv420;
          newImg = _yuv420ToNV21(image);
        } else if (image.format.group == ImageFormatGroup.bgra8888) {
          inputImageFormat = InputImageFormat.bgra8888;
          newImg = plane.bytes;
        } else if (image.format.group == ImageFormatGroup.nv21) {
          newImg = plane.bytes;
          inputImageFormat = InputImageFormat.nv21;
        } else {
          debugPrint('Unsupported image format: ${image.format}');
          return;
        }

        final inputImage = InputImage.fromBytes(
          bytes: newImg,
          metadata: InputImageMetadata(
            size: Size(image.width.toDouble(), image.height.toDouble()),
            rotation: InputImageRotation.rotation0deg, // used only in Android
            format: inputImageFormat, // used only in iOS
            bytesPerRow: plane.bytesPerRow, // used only in iOS
          ),
        );

        // Phân tích mã bằng ML Kit
        final barcodes = await _barcodeScanner.processImage(inputImage);

        if (barcodes.isNotEmpty) {
          debugPrint('Barcode detected: ${barcodes.first.rawValue}');
          if (widget.scanMode == XScanMode.inventory &&
              widget.onResult != null) {
            await _cameraController!.stopImageStream();
            XToast.loading();
            await widget.onResult!(code: barcodes.first.rawValue);
            XToast.closeAllLoading();
            if (!_cameraController!.value.isStreamingImages) {
              await Future.delayed(
                  const Duration(milliseconds: 500), () => _startImageStream());
            }
            return;
          }
          widget.scanBloc.add(UpdateScanValueEvent(barcodes));
        }
      } catch (e) {
        debugPrint('Error scanning barcode: $e');
      } finally {
        _isScanning = false;
      }
    });
  }

  Uint8List _yuv420ToNV21(CameraImage image) {
    var nv21 = Uint8List(image.planes[0].bytes.length +
        image.planes[1].bytes.length +
        image.planes[2].bytes.length);

    var yBuffer = image.planes[0].bytes;
    var uBuffer = image.planes[1].bytes;
    var vBuffer = image.planes[2].bytes;

    nv21.setRange(0, yBuffer.length, yBuffer);

    int i = 0;
    while (i < uBuffer.length) {
      nv21[yBuffer.length + i] = vBuffer[i];
      nv21[yBuffer.length + i + 1] = uBuffer[i];
      i += 2;
    }

    return nv21;
  }
}
