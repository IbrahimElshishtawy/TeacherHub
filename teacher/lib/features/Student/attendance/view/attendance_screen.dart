// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/attendance_controller.dart';
import '../widgets/success_dialog/success_dialog_widget.dart';
import 'widgets/attendance_header.dart';
import 'widgets/attendance_input_card.dart';
import 'widgets/attendance_mode_toggle.dart';
import 'widgets/attendance_student_app_bar.dart';
import 'widgets/attendance_student_badge.dart';
import 'widgets/attendance_submit_button.dart';
import 'widgets/attendance_ui_tokens.dart';

class AttendanceScreenStudent extends StatelessWidget {
  const AttendanceScreenStudent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AttendanceController>();

    return Scaffold(
      backgroundColor: AttendanceUiTokens.bg,
      appBar: const AttendanceStudentAppBar(),
      body: GetBuilder<AttendanceController>(
        builder: (_) {
          final isScanning = controller.state.isScanning.value;
          final studentId = controller.state.studentId.value;
          final hasId = studentId.trim().isNotEmpty;
          final isSubmitted = controller.state.isSubmitted.value;

          return Stack(
            children: [
              Positioned(
                top: -80,
                right: -60,
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        AttendanceUiTokens.accent.withOpacity(0.08),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AttendanceHeader(),
                      const SizedBox(height: 28),
                      AttendanceModeToggle(
                        isScanning: isScanning,
                        controller: controller,
                      ),
                      const SizedBox(height: 24),
                      AttendanceInputCard(
                        isScanning: isScanning,
                        controller: controller,
                      ),
                      const SizedBox(height: 20),
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
                            ? AttendanceStudentBadge(
                                studentId: studentId,
                                isSubmitted: isSubmitted,
                                controller: controller,
                              )
                            : const SizedBox.shrink(),
                      ),
                      if (hasId) const SizedBox(height: 20),
                      AttendanceSubmitButton(
                        hasId: hasId,
                        controller: controller,
                      ),
                      const SizedBox(height: 24),
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
}
