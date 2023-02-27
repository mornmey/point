import 'dart:async';
import 'dart:io';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:horpao_point/config/colors.dart';
import 'package:horpao_point/main.dart';
import 'package:horpao_point/routes.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodeScannerWidget extends StatefulWidget {
  const QRCodeScannerWidget({Key? key}) : super(key: key);

  @override
  State<QRCodeScannerWidget> createState() => _QRCodeScannerWidgetState();
}

class _QRCodeScannerWidgetState extends State<QRCodeScannerWidget> {
  bool _hide = true;
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(milliseconds: 2500),
      () => router.navigateTo(
        context,
        AppRoutes.transaction,
        replace: true,
        transition: TransitionType.cupertino,
      ),
    );
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                  overlay: QrScannerOverlayShape(
                    borderColor: AppColorSets.backgroundBlueColor,
                    borderRadius: 10,
                    borderLength: 25,
                    borderWidth: 10,
                  ),
                  onPermissionSet: (ctrl, p) {
                    _onPermissionSet(context, ctrl, p);
                  },
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 30),
                  alignment: Alignment.bottomCenter,
                  child: IconButton(
                    onPressed: () async {
                      await controller?.toggleFlash();
                      setState(() {
                        _hide = !_hide;
                      });
                    },
                    color: AppColorSets.backgroundWhiteColor,
                    icon: FaIcon(
                      _hide
                          ? Icons.flashlight_on_rounded
                          : Icons.flashlight_off_rounded,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 5),
                  child: IconButton(
                    onPressed: () {
                      router.pop(context);
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.arrowLeft,
                      size: 20,
                      color: AppColorSets.backgroundWhiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        print("Result: ${result!.code}");
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
