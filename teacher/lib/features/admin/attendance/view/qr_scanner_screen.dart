import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/attendance_controller.dart';
import '../state/attendance_state.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({super.key});

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen>
    with TickerProviderStateMixin {
  late AttendanceController _controller;
  late AnimationController _scanLineController;
  late Animation<double> _scanLineAnimation;
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  bool _isProcessing = false;
  String _statusMessage = 'قم بتوجيه الكاميرا نحو QR الخاص بالطالب';

  @override
  void initState() {
    super.initState();
    _controller = Get.find<AttendanceController>();

    _scanLineController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _scanLineAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
          parent: _scanLineController, curve: Curves.easeInOut),
    );

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _scanLineController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  Future<void> _processScan(AttendanceScanResult Function() scanFn) async {
    if (_isProcessing) return;
    setState(() {
      _isProcessing = true;
      _statusMessage = 'جاري المعالجة...';
    });

    await Future.delayed(const Duration(milliseconds: 400));

    final result = scanFn();
    final st = _controller.state.value;

    if (!mounted) return;

    switch (result) {
      case AttendanceScanResult.success:
        await _showSuccessSheet(st.lastScannedRecord!);
        break;
      case AttendanceScanResult.duplicate:
        await _showDuplicateDialog();
        break;
      case AttendanceScanResult.wrongBatch:
        await _showWrongBatchDialog();
        break;
      case AttendanceScanResult.unknownQr:
        await _showUnknownDialog();
        break;
    }

    if (mounted) {
      setState(() {
        _isProcessing = false;
        _statusMessage = 'قم بتوجيه الكاميرا نحو QR الخاص بالطالب';
      });
    }
  }

  Future<void> _showSuccessSheet(AttendanceRecord record) async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      builder: (_) => _SuccessSheet(record: record),
    );
  }

  Future<void> _showDuplicateDialog() async {
    final existing = _controller.state.value.records.isNotEmpty
        ? _controller.state.value.records.first
        : null;
    await showDialog(
      context: context,
      builder: (_) => _ScanResultDialog(
        icon: '⚠️',
        title: 'تم التسجيل مسبقاً',
        message: 'تم تسجيل حضور هذا الطالب بالفعل',
        color: const Color(0xFFF59E0B),
        details: existing != null
            ? [
                _DetailRow(
                    label: 'وقت أول تسجيل',
                    value: _formatTime(existing.time)),
                _DetailRow(
                    label: 'حالة الحضور',
                    value: _statusLabel(existing.status)),
              ]
            : [],
      ),
    );
  }

  Future<void> _showWrongBatchDialog() async {
    final session = _controller.state.value.activeSession;
    await showDialog(
      context: context,
      builder: (_) => _ScanResultDialog(
        icon: '❌',
        title: 'دفعة خاطئة',
        message: 'هذا الطالب لا ينتمي لهذه الدفعة',
        color: const Color(0xFFEF4444),
        details: session != null
            ? [
                _DetailRow(
                    label: 'دفعة الطالب',
                    value: 'الدفعة الثانية 2026'),
                _DetailRow(
                    label: 'الدفعة الحالية', value: session.batch),
              ]
            : [],
      ),
    );
  }

  Future<void> _showUnknownDialog() async {
    await showDialog(
      context: context,
      builder: (_) => const _ScanResultDialog(
        icon: '🚫',
        title: 'QR غير معروف',
        message: 'QR غير صالح أو غير مسجل بالنظام',
        color: Color(0xFF64748B),
        details: [],
      ),
    );
  }

  String _formatTime(DateTime t) {
    final h = t.hour.toString().padLeft(2, '0');
    final m = t.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }

  String _statusLabel(AttendanceStatus s) {
    switch (s) {
      case AttendanceStatus.present:
        return 'حاضر';
      case AttendanceStatus.absent:
        return 'غائب';
      case AttendanceStatus.late:
        return 'متأخر';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Obx(() {
          final st = _controller.state.value;
          final session = st.activeSession;
          return Stack(
            children: [
              // Background gradient (simulating camera)
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF0F1117), Color(0xFF1A1F2E)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),

              Column(
                children: [
                  // Top Bar
                  _buildTopBar(session),

                  // Scanner Area
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildScannerFrame(),
                        const SizedBox(height: 20),
                        Text(
                          _isProcessing
                              ? 'جاري المعالجة...'
                              : _statusMessage,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: _isProcessing
                                ? const Color(0xFFF59E0B)
                                : Colors.white.withOpacity(0.8),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Simulator Panel
                  _buildSimulatorPanel(),

                  // Bottom Live Info
                  _buildBottomInfo(st),
                ],
              ),

              // Processing Overlay
              if (_isProcessing)
                Container(
                  color: Colors.black.withOpacity(0.4),
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Color(0xFF2563EB),
                      strokeWidth: 3,
                    ),
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildTopBar(QrSessionInfo? session) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 12,
        left: 16,
        right: 16,
        bottom: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        border: Border(
          bottom: BorderSide(
              color: Colors.white.withOpacity(0.1), width: 1),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.arrow_back_ios_new_rounded,
                      color: Colors.white, size: 18),
                ),
              ),
              const Expanded(
                child: Text(
                  'ماسح QR الحضور',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color(0xFF22C55E).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: const Color(0xFF22C55E).withOpacity(0.5)),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.fiber_manual_record,
                        color: Color(0xFF22C55E), size: 8),
                    SizedBox(width: 4),
                    Text(
                      'نشط',
                      style: TextStyle(
                        color: Color(0xFF22C55E),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (session != null) ...[
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _SessionChip(
                      icon: Icons.class_rounded,
                      text: session.sessionName),
                  const SizedBox(width: 8),
                  _SessionChip(icon: Icons.book_rounded, text: session.subject),
                  const SizedBox(width: 8),
                  _SessionChip(
                      icon: Icons.group_rounded, text: session.batch),
                  const SizedBox(width: 8),
                  _SessionChip(
                      icon: Icons.calendar_today_rounded,
                      text:
                          '${session.date.day}/${session.date.month}/${session.date.year}'),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildScannerFrame() {
    return AnimatedBuilder(
      animation: _pulseAnimation,
      builder: (_, __) => Transform.scale(
        scale: _isProcessing ? 1.0 : _pulseAnimation.value,
        child: SizedBox(
          width: 260,
          height: 260,
          child: Stack(
            children: [
              // Outer border with corner brackets
              CustomPaint(
                size: const Size(260, 260),
                painter: _QrFramePainter(
                  color: _isProcessing
                      ? const Color(0xFFF59E0B)
                      : const Color(0xFF2563EB),
                ),
              ),
              // Scan line
              if (!_isProcessing)
                AnimatedBuilder(
                  animation: _scanLineAnimation,
                  builder: (_, __) {
                    return Positioned(
                      top: _scanLineAnimation.value * 240 + 10,
                      left: 10,
                      right: 10,
                      child: Container(
                        height: 2.5,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              const Color(0xFF2563EB),
                              Colors.transparent,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    );
                  },
                ),
              // Center grid lines
              Center(
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.white.withOpacity(0.04)),
                  ),
                  child: const Icon(
                    Icons.qr_code_rounded,
                    size: 60,
                    color: Colors.white12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSimulatorPanel() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.science_rounded,
                  color: Colors.white54, size: 14),
              const SizedBox(width: 5),
              Text(
                'لوحة المحاكاة — اختبر حالات المسح',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 11.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _SimBtn(
                  label: 'نجاح',
                  icon: Icons.check_circle_rounded,
                  color: const Color(0xFF22C55E),
                  onTap: _isProcessing
                      ? null
                      : () => _processScan(
                          _controller.simulateSuccessScan),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _SimBtn(
                  label: 'مكرر',
                  icon: Icons.copy_rounded,
                  color: const Color(0xFFF59E0B),
                  onTap: _isProcessing
                      ? null
                      : () => _processScan(
                          _controller.simulateDuplicateScan),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _SimBtn(
                  label: 'دفعة خاطئة',
                  icon: Icons.group_off_rounded,
                  color: const Color(0xFFEF4444),
                  onTap: _isProcessing
                      ? null
                      : () => _processScan(
                          _controller.simulateWrongBatchScan),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _SimBtn(
                  label: 'مجهول',
                  icon: Icons.help_outline_rounded,
                  color: const Color(0xFF64748B),
                  onTap: _isProcessing
                      ? null
                      : () => _processScan(
                          _controller.simulateUnknownQrScan),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomInfo(AttendanceState st) {
    return Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 14,
        bottom: MediaQuery.of(context).padding.bottom + 14,
      ),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        border: Border(
            top: BorderSide(color: Colors.white.withOpacity(0.1))),
      ),
      child: Row(
        children: [
          Expanded(
            child: _InfoPill(
              icon: Icons.check_circle_rounded,
              label: 'تم التسجيل',
              value: st.records.length.toString(),
              color: const Color(0xFF22C55E),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: _InfoPill(
              icon: Icons.qr_code_scanner_rounded,
              label: 'بالـ QR',
              value: st.qrCount.toString(),
              color: const Color(0xFF2563EB),
            ),
          ),
          const SizedBox(width: 10),
          if (st.lastScannedRecord != null)
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: const Color(0xFF22C55E).withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          st.lastScannedRecord!.studentName[0],
                          style: const TextStyle(
                            color: Color(0xFF22C55E),
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'آخر مسح',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            st.lastScannedRecord!.studentName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _SessionChip extends StatelessWidget {
  final IconData icon;
  final String text;
  const _SessionChip({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withOpacity(0.15)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white70, size: 12),
          const SizedBox(width: 5),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11.5,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _SimBtn extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;

  const _SimBtn({
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Opacity(
        opacity: onTap == null ? 0.4 : 1.0,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: color.withOpacity(0.15),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: color.withOpacity(0.4)),
          ),
          child: Column(
            children: [
              Icon(icon, color: color, size: 18),
              const SizedBox(height: 3),
              Text(
                label,
                style: TextStyle(
                  color: color,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoPill extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _InfoPill({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(height: 2),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 9.5,
            ),
          ),
        ],
      ),
    );
  }
}

// Custom QR frame painter
class _QrFramePainter extends CustomPainter {
  final Color color;
  const _QrFramePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    const cornerLen = 30.0;
    const margin = 4.0;

    // Top-left
    canvas.drawLine(
        Offset(margin, margin + cornerLen), Offset(margin, margin), paint);
    canvas.drawLine(
        Offset(margin, margin), Offset(margin + cornerLen, margin), paint);

    // Top-right
    canvas.drawLine(Offset(size.width - margin, margin + cornerLen),
        Offset(size.width - margin, margin), paint);
    canvas.drawLine(Offset(size.width - margin, margin),
        Offset(size.width - margin - cornerLen, margin), paint);

    // Bottom-left
    canvas.drawLine(Offset(margin, size.height - margin - cornerLen),
        Offset(margin, size.height - margin), paint);
    canvas.drawLine(Offset(margin, size.height - margin),
        Offset(margin + cornerLen, size.height - margin), paint);

    // Bottom-right
    canvas.drawLine(
        Offset(size.width - margin, size.height - margin - cornerLen),
        Offset(size.width - margin, size.height - margin),
        paint);
    canvas.drawLine(
        Offset(size.width - margin, size.height - margin),
        Offset(size.width - margin - cornerLen, size.height - margin),
        paint);
  }

  @override
  bool shouldRepaint(covariant _QrFramePainter old) =>
      old.color != color;
}

// Success Sheet
class _SuccessSheet extends StatefulWidget {
  final AttendanceRecord record;
  const _SuccessSheet({required this.record});

  @override
  State<_SuccessSheet> createState() => _SuccessSheetState();
}

class _SuccessSheetState extends State<_SuccessSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _animCtrl;
  late Animation<double> _scaleAnim;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();
    _animCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _scaleAnim = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _animCtrl, curve: Curves.elasticOut),
    );
    _fadeAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animCtrl, curve: Curves.easeIn),
    );
    _animCtrl.forward();

    // Auto dismiss
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) Navigator.pop(context);
    });
  }

  @override
  void dispose() {
    _animCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnim,
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF22C55E).withOpacity(0.25),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ScaleTransition(
              scale: _scaleAnim,
              child: Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: const Color(0xFF22C55E).withOpacity(0.12),
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: const Color(0xFF22C55E).withOpacity(0.4),
                      width: 2),
                ),
                child: const Icon(Icons.check_circle_rounded,
                    color: Color(0xFF22C55E), size: 40),
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              'تم تسجيل الحضور بنجاح',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'سيتم متابعة المسح تلقائياً',
              style: TextStyle(
                fontSize: 12.5,
                color: Colors.grey.shade500,
              ),
            ),
            const SizedBox(height: 18),
            // Student Info
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFF22C55E).withOpacity(0.06),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFF22C55E).withOpacity(0.15),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        widget.record.studentName[0],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF22C55E),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.record.studentName,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1E293B),
                          ),
                        ),
                        Text(
                          widget.record.studentCode,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.record.batch,
                          style: const TextStyle(
                            fontSize: 11.5,
                            color: Color(0xFF22C55E),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'وقت التسجيل',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        '${widget.record.time.hour.toString().padLeft(2, '0')}:${widget.record.time.minute.toString().padLeft(2, '0')}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF22C55E),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Generic scan result dialog
class _ScanResultDialog extends StatelessWidget {
  final String icon;
  final String title;
  final String message;
  final Color color;
  final List<Widget> details;

  const _ScanResultDialog({
    required this.icon,
    required this.title,
    required this.message,
    required this.color,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(icon, style: const TextStyle(fontSize: 44)),
            const SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: color,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13.5,
                color: Colors.grey.shade600,
              ),
            ),
            if (details.isNotEmpty) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(children: details),
              ),
            ],
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'حسناً، متابعة',
                  style: TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style:
                TextStyle(fontSize: 13, color: Colors.grey.shade600),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1E293B),
            ),
          ),
        ],
      ),
    );
  }
}
