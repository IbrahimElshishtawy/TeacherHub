import 'dart:async';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScannerWidget extends StatefulWidget {
  final Function(String) onQRScan;

  const QRScannerWidget({super.key, required this.onQRScan});

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

  void _onQRViewCreated(QRViewController controller) {
    _controller = controller;

    _scanSubscription = controller.scannedDataStream.listen((scanData) {
      // Guard against duplicate/rapid scans
      if (scanData.code != null && !_isProcessing) {
        _isProcessing = true;
        widget.onQRScan(scanData.code!);

        // Reset after a short delay to allow re-scanning if needed
        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) setState(() => _isProcessing = false);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // QRView renders immediately — no conditional rendering needed
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

        // Loading indicator shown until controller is ready
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

        // Scan status indicator
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
                  '✓ تم مسح الرمز',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
