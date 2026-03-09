import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/features/Student/attendance/widgets/qr_scanner_widget.dart';
import 'package:teacher/features/auth/view/login/widget.login/AppBar_Tap.dart';
import '../controller/attendance_controller.dart';
import '../widgets/manual_input_widget.dart';
import '../widgets/success_dialog_widget.dart';

class AttendanceScreenStudent extends StatelessWidget {
  const AttendanceScreenStudent({super.key});

  // Design tokens
  static const _bg = Color(0xFF060B18);
  static const _surface = Color(0xFF0D1526);
  static const _card = Color(0xFF111D35);
  static const _accent = Color(0xFF3B82F6);
  static const _accentGlow = Color(0xFF1D4ED8);
  static const _success = Color(0xFF10B981);
  static const _border = Color(0xFF1E2D4A);
  static const _textPrimary = Color(0xFFEFF6FF);
  static const _textMuted = Color(0xFF4B6A9B);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AttendanceController>();

    return Scaffold(
      backgroundColor: _bg,
      appBar: AppbarTap(),
      body: GetBuilder<AttendanceController>(
        builder: (_) {
          final isScanning = controller.state.isScanning.value;
          final studentId = controller.state.studentId.value;
          final hasId = studentId.trim().isNotEmpty;
          final isSubmitted = controller.state.isSubmitted.value;

          return Stack(
            children: [
              // Ambient background glow
              Positioned(
                top: -80,
                right: -60,
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [_accent.withOpacity(0.08), Colors.transparent],
                    ),
                  ),
                ),
              ),

              SafeArea(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ── Header ──────────────────────────────────────
                      _buildHeader(),
                      const SizedBox(height: 28),

                      // ── Mode toggle pills ────────────────────────────
                      _buildModeToggle(isScanning, controller),
                      const SizedBox(height: 24),

                      // ── Scanner / Manual card ────────────────────────
                      _buildInputCard(isScanning, controller),
                      const SizedBox(height: 20),

                      // ── Student ID badge ─────────────────────────────
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder: (child, anim) => FadeTransition(
                          opacity: anim,
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0, 0.2),
                              end: Offset.zero,
                            ).animate(anim),
                            child: child,
                          ),
                        ),
                        child: hasId
                            ? _buildStudentBadge(
                                studentId,
                                isSubmitted,
                                controller,
                              )
                            : const SizedBox.shrink(),
                      ),

                      if (hasId) const SizedBox(height: 20),

                      // ── Submit button ────────────────────────────────
                      _buildSubmitButton(hasId, controller),
                      const SizedBox(height: 24),

                      // ── Success dialog ───────────────────────────────
                      SuccessDialogWidget(studentId: studentId),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // ── Widgets ──────────────────────────────────────────────────────────────

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [_accent, _accentGlow],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: _accent.withOpacity(0.35),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: const Icon(
                Icons.how_to_reg_rounded,
                color: Colors.white,
                size: 22,
              ),
            ),
            const SizedBox(width: 14),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'تسجيل الحضور',
                  style: TextStyle(
                    color: _textPrimary,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.5,
                  ),
                ),
                Text(
                  'امسح الكود أو أدخل الرقم يدويًا',
                  style: TextStyle(
                    color: _textMuted,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildModeToggle(bool isScanning, AttendanceController controller) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: _surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _border),
      ),
      child: Row(
        children: [
          _togglePill(
            icon: Icons.qr_code_scanner_rounded,
            label: 'مسح QR',
            active: isScanning,
            onTap: () {
              if (!isScanning) controller.toggleMode();
            },
          ),
          _togglePill(
            icon: Icons.keyboard_rounded,
            label: 'إدخال يدوي',
            active: !isScanning,
            onTap: () {
              if (isScanning) controller.toggleMode();
            },
          ),
        ],
      ),
    );
  }

  Widget _togglePill({
    required IconData icon,
    required String label,
    required bool active,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            gradient: active
                ? const LinearGradient(
                    colors: [_accent, _accentGlow],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : null,
            borderRadius: BorderRadius.circular(12),
            boxShadow: active
                ? [
                    BoxShadow(
                      color: _accent.withOpacity(0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 16, color: active ? Colors.white : _textMuted),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  color: active ? Colors.white : _textMuted,
                  fontSize: 14,
                  fontWeight: active ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputCard(bool isScanning, AttendanceController controller) {
    final studentId = controller.state.studentId.value;
    final canScan = studentId.trim().isEmpty;

    return Container(
      decoration: BoxDecoration(
        color: _card,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: _border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: isScanning
            ? SizedBox(
                key: ValueKey('scanner_${canScan ? "active" : "locked"}'),
                height: 320,
                child: QRScannerWidget(
                  onQRScan: controller.setQRCode,
                  scanEnabled: canScan,
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(24),
                child: ManualInputWidget(onInput: controller.setManualId),
              ),
      ),
    );
  }

  Widget _buildStudentBadge(
    String studentId,
    bool isSubmitted,
    AttendanceController controller,
  ) {
    return Container(
      key: ValueKey(studentId),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: _success.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _success.withOpacity(0.25)),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: _success.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.check_rounded, color: _success, size: 20),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'تم التعرف على الطالب',
                style: TextStyle(
                  color: _success,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.3,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                studentId,
                style: const TextStyle(
                  color: _textPrimary,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: controller.clearStudentId,
            tooltip: isSubmitted ? 'مسح والبدء من جديد' : 'إعادة المسح',
            icon: Icon(
              isSubmitted
                  ? Icons.refresh_rounded
                  : Icons.qr_code_scanner_rounded,
              color: _success.withOpacity(0.8),
              size: 22,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubmitButton(bool hasId, AttendanceController controller) {
    return SizedBox(
      width: double.infinity,
      height: 58,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          gradient: hasId
              ? const LinearGradient(
                  colors: [_accent, _accentGlow],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                )
              : null,
          color: hasId ? null : _surface,
          borderRadius: BorderRadius.circular(18),
          border: hasId ? null : Border.all(color: _border),
          boxShadow: hasId
              ? [
                  BoxShadow(
                    color: _accent.withOpacity(0.4),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ]
              : null,
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(18),
          child: InkWell(
            borderRadius: BorderRadius.circular(18),
            onTap: hasId ? controller.submitAttendance : null,
            splashColor: Colors.white.withOpacity(0.1),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.how_to_reg_rounded,
                    color: hasId ? Colors.white : _textMuted,
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'تسجيل الحضور',
                    style: TextStyle(
                      color: hasId ? Colors.white : _textMuted,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
