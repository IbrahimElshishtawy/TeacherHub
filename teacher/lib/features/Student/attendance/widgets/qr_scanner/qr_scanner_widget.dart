import 'dart:async';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

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
  bool _isProcessing = false; // Prevent duplicate scans

  @override
  void dispose() {
    _scanSubscription?.cancel(); // Cancel stream to prevent memory leaks
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant QRScannerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.scanEnabled == widget.scanEnabled) return;
    if (widget.scanEnabled) {
      _controller?.resumeCamera();
    } else {
      _controller?.pauseCamera();
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    _controller = controller;
    if (mounted) {
      setState(() {});
    }

    if (!widget.scanEnabled) {
      _controller?.pauseCamera();
    }

    _scanSubscription = controller.scannedDataStream.listen((scanData) {
      // Guard against duplicate/rapid scans and disabled scanning state.
      if (!widget.scanEnabled) return;
      if (scanData.code != null && !_isProcessing) {
        _isProcessing = true;
        _controller?.pauseCamera();
        widget.onQRScan(scanData.code!);

        if (mounted) {
          setState(() {});
        }
      }
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

        if (_controller == null)
          const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(color: Colors.white),
                SizedBox(height: 12),
                Text(
                  'جارٍ تحميل الكاميرا...',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),

        if (_isProcessing)
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'تم مسح الرمز',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
