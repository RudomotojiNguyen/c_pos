import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

import '../../../../../common/enum/enum.dart';
import '../../../../theme/colors.dart';

class CameraScan extends StatefulWidget {
  const CameraScan({
    super.key,
    this.onResult,
    this.scanMode = XScanMode.defaultMode,
  });

  final XScanMode scanMode;
  final Function({String? code, List<String>? codes})? onResult;

  @override
  State<CameraScan> createState() => _CameraScanState();
}

class _CameraScanState extends State<CameraScan> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? cameraController;
  bool _isProcessing = false;

  final ValueNotifier<bool> flashOn = ValueNotifier(false);
  final ValueNotifier<bool> cameraInitialized = ValueNotifier(false);

  Timer? _timer;

  @override
  void dispose() {
    flashOn.dispose();
    cameraInitialized.dispose();
    cameraController?.dispose();
    _timer?.cancel();
    super.dispose();
  }

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      cameraController?.pauseCamera();
    } else if (Platform.isIOS) {
      cameraController?.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    var scanArea = 300.sp;

    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: AppColors.primaryColor,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: scanArea,
      ),
      formatsAllowed: const [
        BarcodeFormat.qrcode,
        BarcodeFormat.ean13,
        BarcodeFormat.code128,
      ],
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    try {
      cameraController ??= controller;
      cameraInitialized.value = true;

      cameraController!.scannedDataStream.listen((scanData) {
        if (widget.onResult == null || scanData.code == null || _isProcessing) {
          return;
        }

        _isProcessing = true;

        if (widget.scanMode == XScanMode.defaultMode) {
          widget.onResult!(code: scanData.code);
          Navigator.pop(context);
        }
        if (widget.scanMode == XScanMode.inventory) {
          widget.onResult!(code: scanData.code);
          _timer?.cancel();
          _timer = Timer(const Duration(seconds: 1), () {
            _isProcessing = false;
          });
        }
      });
    } catch (e) {
      debugPrint('Error onQRViewCreated: $e');
    }
  }
}
