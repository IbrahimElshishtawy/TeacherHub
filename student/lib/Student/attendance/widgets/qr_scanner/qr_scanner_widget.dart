import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'qr_scanner_loading.dart';
import 'qr_scanner_processed_badge.dart';

class QRScannerWidget extends StatefulWidget {
  final Function(String) onQRScan;
  final bool scanEnabled;

  const QRScannerWidget({
    super.key,
    required this.onQRScan,
    this.scanEnabled = true,
  });

  @override
  State<QRScannerWidget> createState() => _QRScannerWidgetState();
}

class _QRScannerWidgetState extends State<QRScannerWidget> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  QRViewController? _controller;
  StreamSubscription? _scanSubscription;
  bool _isProcessing = false;

  @override
  void dispose() {
    _scanSubscription?.cancel();
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant QRScannerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.scanEnabled == widget.scanEnabled) return;
    widget.scanEnabled ? _controller?.resumeCamera() : _controller?.pauseCamera();
  }

  void _onQRViewCreated(QRViewController controller) {
    _controller = controller;
    if (mounted) setState(() {});

    if (!widget.scanEnabled) {
      _controller?.pauseCamera();
    }

    _scanSubscription = controller.scannedDataStream.listen((scanData) {
      if (!widget.scanEnabled || _isProcessing) return;
      if (scanData.code == null) return;

      _isProcessing = true;
      _controller?.pauseCamera();
      widget.onQRScan(scanData.code!);

      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        QRView(
          key: qrKey,
          onQRViewCreated: _onQRViewCreated,
          overlay: QrScannerOverlayShape(
            borderColor: Colors.amber,
            borderRadius: 12,
            borderLength: 30,
            borderWidth: 8,
            cutOutSize: MediaQuery.of(context).size.width * 0.75,
          ),
        ),
        if (_controller == null) const QrScannerLoading(),
        if (_isProcessing) const QrScannerProcessedBadge(),
      ],
    );
  }
}
