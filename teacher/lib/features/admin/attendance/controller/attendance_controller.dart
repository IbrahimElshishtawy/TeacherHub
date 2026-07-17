import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../state/attendance_state.dart';

class AttendanceController extends GetxController {
  final Rx<AttendanceState> state = AttendanceState.initial().obs;

  // ─── Filters ────────────────────────────────────────────────────────────────
  void setQuery(String q) => state.value = state.value.copyWith(query: q);
  void setTab(int tab) => state.value = state.value.copyWith(activeTab: tab);
  void setFilterGrade(String v) => state.value = state.value.copyWith(filterGrade: v);
  void setFilterBatch(String v) => state.value = state.value.copyWith(filterBatch: v);
  void setFilterSubject(String v) => state.value = state.value.copyWith(filterSubject: v);
  void setFilterSession(String v) => state.value = state.value.copyWith(filterSession: v);
  void setFilterDate(DateTime d) => state.value = state.value.copyWith(filterDate: d);
  void setFilterStatus(String v) => state.value = state.value.copyWith(filterStatus: v);
  void clearFilters() {
    state.value = state.value.copyWith(
      query: '',
      filterGrade: 'الكل',
      filterBatch: 'الكل',
      filterSubject: 'الكل',
      filterSession: 'الكل',
      filterStatus: 'الكل',
    );
  }

  // ─── QR Scan Simulation ─────────────────────────────────────────────────────
  /// Simulates a scan for the given student code.
  /// Returns the scan result type.
  AttendanceScanResult simulateScan(String studentCode) {
    final session = state.value.activeSession;
    if (session == null) return AttendanceScanResult.unknownQr;

    // Find student in global mock database
    final student = state.value.students
        .where((s) => s.code == studentCode)
        .firstOrNull;

    if (student == null) return AttendanceScanResult.unknownQr;

    // Check if already scanned
    final existing = state.value.records
        .where((r) => r.studentId == student.id)
        .firstOrNull;
    if (existing != null) return AttendanceScanResult.duplicate;

    // Check batch match
    if (student.batch != session.batch) return AttendanceScanResult.wrongBatch;

    // Success: register attendance
    final record = AttendanceRecord(
      id: 'rec_${DateTime.now().millisecondsSinceEpoch}',
      studentId: student.id,
      studentName: student.name,
      studentCode: student.code,
      studentPhoto: student.photo,
      batch: student.batch,
      grade: student.grade,
      subject: session.subject,
      sessionName: session.sessionName,
      status: AttendanceStatus.present,
      method: AttendanceMethod.qr,
      time: DateTime.now(),
      phone: student.phone,
      parentPhone: student.parentPhone,
    );

    final updated = [...state.value.records, record];
    state.value = state.value.copyWith(records: updated, lastScannedRecord: record);
    return AttendanceScanResult.success;
  }

  /// Simulates a random success scan (picks first unscanned student in current batch)
  AttendanceScanResult simulateSuccessScan() {
    final session = state.value.activeSession;
    if (session == null) return AttendanceScanResult.unknownQr;

    final scannedIds = state.value.records.map((r) => r.studentId).toSet();
    final unscanned = state.value.students
        .where((s) => s.batch == session.batch && !scannedIds.contains(s.id))
        .toList();

    if (unscanned.isEmpty) {
      // All scanned — pick anyone for duplicate demo
      return simulateScan(state.value.students.first.code);
    }
    return simulateScan(unscanned.first.code);
  }

  AttendanceScanResult simulateDuplicateScan() {
    final scanned = state.value.records;
    if (scanned.isEmpty) return AttendanceScanResult.unknownQr;
    final firstRecord = scanned.first;
    return simulateScan(firstRecord.studentCode);
  }

  AttendanceScanResult simulateWrongBatchScan() {
    final session = state.value.activeSession;
    if (session == null) return AttendanceScanResult.unknownQr;
    final wrongBatch = state.value.students
        .where((s) => s.batch != session.batch)
        .firstOrNull;
    if (wrongBatch == null) return AttendanceScanResult.unknownQr;
    return simulateScan(wrongBatch.code);
  }

  AttendanceScanResult simulateUnknownQrScan() => AttendanceScanResult.unknownQr;

  /// Get existing record for a student code (used for duplicate/wrong batch info)
  AttendanceRecord? getExistingRecord(String studentCode) {
    return state.value.records
        .where((r) => r.studentCode == studentCode)
        .firstOrNull;
  }

  MockStudentEntry? getStudentByCode(String code) {
    return state.value.students
        .where((s) => s.code == code)
        .firstOrNull;
  }

  // ─── Manual Attendance ───────────────────────────────────────────────────────
  void registerManualAttendance({
    required MockStudentEntry student,
    required AttendanceStatus status,
    String? reason,
    String? notes,
  }) {
    final session = state.value.activeSession;
    final record = AttendanceRecord(
      id: 'rec_${DateTime.now().millisecondsSinceEpoch}',
      studentId: student.id,
      studentName: student.name,
      studentCode: student.code,
      studentPhoto: student.photo,
      batch: student.batch,
      grade: student.grade,
      subject: session?.subject ?? 'غير محدد',
      sessionName: session?.sessionName ?? 'غير محدد',
      status: status,
      method: AttendanceMethod.manual,
      time: DateTime.now(),
      notes: notes,
      phone: student.phone,
      parentPhone: student.parentPhone,
    );

    // Remove existing record for this student if any
    final filtered = state.value.records
        .where((r) => r.studentId != student.id)
        .toList();
    state.value = state.value.copyWith(records: [...filtered, record]);

    // Notify parent if needed
    if (state.value.settings.enableParentNotifications) {
      if (status == AttendanceStatus.absent && state.value.settings.notifyOnAbsent) {
        _showParentNotificationSnackbar(student.name, 'غائب');
      } else if (status == AttendanceStatus.late && state.value.settings.notifyOnLate) {
        _showParentNotificationSnackbar(student.name, 'متأخر');
      }
    }

    Get.back(); // Close the sheet
    Get.snackbar(
      '✅ تم التسجيل',
      'تم تسجيل ${student.name} بنجاح',
      backgroundColor: const Color(0xFF22C55E),
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
      snackPosition: SnackPosition.TOP,
    );
  }

  void updateAttendanceRecord(AttendanceRecord record) {
    final filtered = state.value.records
        .where((r) => r.id != record.id)
        .toList();
    state.value = state.value.copyWith(records: [...filtered, record]);
    Get.back();
    Get.snackbar(
      '✅ تم التعديل',
      'تم تحديث بيانات الحضور بنجاح',
      backgroundColor: const Color(0xFF22C55E),
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
    );
  }

  // ─── Settings ────────────────────────────────────────────────────────────────
  void updateSettings(AttendanceSettings newSettings) {
    state.value = state.value.copyWith(settings: newSettings);
  }

  // ─── Analytics Helpers ───────────────────────────────────────────────────────
  List<MapEntry<String, int>> get absenteesByBatch {
    final Map<String, int> counts = {};
    for (final r in state.value.records) {
      if (r.status == AttendanceStatus.absent) {
        counts[r.batch] = (counts[r.batch] ?? 0) + 1;
      }
    }
    return counts.entries.toList();
  }

  List<MockStudentEntry> get mostAbsentStudents {
    final sorted = [...state.value.students]
      ..sort((a, b) => b.absenceCount.compareTo(a.absenceCount));
    return sorted.take(5).toList();
  }

  List<MockStudentEntry> get bestAttendanceStudents {
    final sorted = [...state.value.students]
      ..sort((a, b) => b.attendanceRate.compareTo(a.attendanceRate));
    return sorted.take(5).toList();
  }

  // ─── Private Helpers ─────────────────────────────────────────────────────────
  void _showParentNotificationSnackbar(String studentName, String statusText) {
    Future.delayed(const Duration(milliseconds: 800), () {
      Get.snackbar(
        '📱 تم إرسال إشعار للولي',
        'تم إخطار ولي أمر $studentName بحالة: $statusText',
        backgroundColor: const Color(0xFF2563EB),
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
        icon: const Icon(Icons.whatsapp, color: Colors.white),
      );
    });
  }

  String formatTime(DateTime t) {
    final h = t.hour.toString().padLeft(2, '0');
    final m = t.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }

  String formatDate(DateTime d) {
    const months = [
      '', 'يناير', 'فبراير', 'مارس', 'أبريل', 'مايو', 'يونيو',
      'يوليو', 'أغسطس', 'سبتمبر', 'أكتوبر', 'نوفمبر', 'ديسمبر'
    ];
    return '${d.day} ${months[d.month]} ${d.year}';
  }
}
