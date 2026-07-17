// ignore_for_file: constant_identifier_names

enum AttendanceStatus { present, absent, late }

enum AttendanceMethod { qr, manual }

enum AttendanceScanResult { success, duplicate, wrongBatch, unknownQr }

class AttendanceRecord {
  final String id;
  final String studentId;
  final String studentName;
  final String studentCode;
  final String studentPhoto;
  final String batch;
  final String grade;
  final String subject;
  final String sessionName;
  final AttendanceStatus status;
  final AttendanceMethod method;
  final DateTime time;
  final String? notes;
  final String phone;
  final String parentPhone;

  const AttendanceRecord({
    required this.id,
    required this.studentId,
    required this.studentName,
    required this.studentCode,
    required this.studentPhoto,
    required this.batch,
    required this.grade,
    required this.subject,
    required this.sessionName,
    required this.status,
    required this.method,
    required this.time,
    this.notes,
    this.phone = '',
    this.parentPhone = '',
  });

  AttendanceRecord copyWith({
    String? id,
    String? studentId,
    String? studentName,
    String? studentCode,
    String? studentPhoto,
    String? batch,
    String? grade,
    String? subject,
    String? sessionName,
    AttendanceStatus? status,
    AttendanceMethod? method,
    DateTime? time,
    String? notes,
    String? phone,
    String? parentPhone,
  }) {
    return AttendanceRecord(
      id: id ?? this.id,
      studentId: studentId ?? this.studentId,
      studentName: studentName ?? this.studentName,
      studentCode: studentCode ?? this.studentCode,
      studentPhoto: studentPhoto ?? this.studentPhoto,
      batch: batch ?? this.batch,
      grade: grade ?? this.grade,
      subject: subject ?? this.subject,
      sessionName: sessionName ?? this.sessionName,
      status: status ?? this.status,
      method: method ?? this.method,
      time: time ?? this.time,
      notes: notes ?? this.notes,
      phone: phone ?? this.phone,
      parentPhone: parentPhone ?? this.parentPhone,
    );
  }
}

class MockStudentEntry {
  final String id;
  final String name;
  final String code;
  final String photo;
  final String batch;
  final String grade;
  final String phone;
  final String parentPhone;
  final double attendanceRate;
  final int absenceCount;
  final int lateCount;

  const MockStudentEntry({
    required this.id,
    required this.name,
    required this.code,
    required this.photo,
    required this.batch,
    required this.grade,
    required this.phone,
    required this.parentPhone,
    required this.attendanceRate,
    required this.absenceCount,
    required this.lateCount,
  });
}

class AttendanceSettings {
  final bool enableQrAttendance;
  final bool enableManualAttendance;
  final bool allowLateAttendance;
  final int lateThresholdMinutes;
  final bool autoCloseAttendance;
  final bool enableParentNotifications;
  final bool notifyOnAbsent;
  final bool notifyOnLate;
  final bool notifyOnSuccess;
  final bool generateDailySummary;
  final bool generateWeeklySummary;

  const AttendanceSettings({
    this.enableQrAttendance = true,
    this.enableManualAttendance = true,
    this.allowLateAttendance = true,
    this.lateThresholdMinutes = 15,
    this.autoCloseAttendance = false,
    this.enableParentNotifications = true,
    this.notifyOnAbsent = true,
    this.notifyOnLate = true,
    this.notifyOnSuccess = false,
    this.generateDailySummary = true,
    this.generateWeeklySummary = true,
  });

  AttendanceSettings copyWith({
    bool? enableQrAttendance,
    bool? enableManualAttendance,
    bool? allowLateAttendance,
    int? lateThresholdMinutes,
    bool? autoCloseAttendance,
    bool? enableParentNotifications,
    bool? notifyOnAbsent,
    bool? notifyOnLate,
    bool? notifyOnSuccess,
    bool? generateDailySummary,
    bool? generateWeeklySummary,
  }) {
    return AttendanceSettings(
      enableQrAttendance: enableQrAttendance ?? this.enableQrAttendance,
      enableManualAttendance: enableManualAttendance ?? this.enableManualAttendance,
      allowLateAttendance: allowLateAttendance ?? this.allowLateAttendance,
      lateThresholdMinutes: lateThresholdMinutes ?? this.lateThresholdMinutes,
      autoCloseAttendance: autoCloseAttendance ?? this.autoCloseAttendance,
      enableParentNotifications: enableParentNotifications ?? this.enableParentNotifications,
      notifyOnAbsent: notifyOnAbsent ?? this.notifyOnAbsent,
      notifyOnLate: notifyOnLate ?? this.notifyOnLate,
      notifyOnSuccess: notifyOnSuccess ?? this.notifyOnSuccess,
      generateDailySummary: generateDailySummary ?? this.generateDailySummary,
      generateWeeklySummary: generateWeeklySummary ?? this.generateWeeklySummary,
    );
  }
}

class QrSessionInfo {
  final String sessionName;
  final String subject;
  final String batch;
  final String grade;
  final DateTime date;

  const QrSessionInfo({
    required this.sessionName,
    required this.subject,
    required this.batch,
    required this.grade,
    required this.date,
  });
}

class AttendanceState {
  final List<AttendanceRecord> records;
  final List<MockStudentEntry> students;

  // Filters
  final String query;
  final String filterGrade;
  final String filterBatch;
  final String filterSubject;
  final String filterSession;
  final DateTime filterDate;
  final String filterStatus; // الكل / حاضر / غائب / متأخر

  // Active tab (0 = list, 1 = analytics)
  final int activeTab;

  // Settings
  final AttendanceSettings settings;

  // QR Session
  final QrSessionInfo? activeSession;
  final AttendanceRecord? lastScannedRecord;

  // Computed (for convenience)
  int get totalStudents => students.length;
  int get presentCount => records.where((r) => r.status == AttendanceStatus.present).length;
  int get absentCount => records.where((r) => r.status == AttendanceStatus.absent).length;
  int get lateCount => records.where((r) => r.status == AttendanceStatus.late).length;
  int get qrCount => records.where((r) => r.method == AttendanceMethod.qr).length;
  int get manualCount => records.where((r) => r.method == AttendanceMethod.manual).length;
  double get attendanceRate =>
      totalStudents == 0 ? 0 : ((presentCount + lateCount) / totalStudents * 100);

  List<AttendanceRecord> get filteredRecords {
    return records.where((r) {
      final q = query.toLowerCase();
      final matchQuery = q.isEmpty ||
          r.studentName.toLowerCase().contains(q) ||
          r.studentCode.toLowerCase().contains(q);
      final matchGrade = filterGrade == 'الكل' || r.grade == filterGrade;
      final matchBatch = filterBatch == 'الكل' || r.batch == filterBatch;
      final matchSubject = filterSubject == 'الكل' || r.subject == filterSubject;
      final matchSession = filterSession == 'الكل' || r.sessionName == filterSession;
      final matchStatus = filterStatus == 'الكل' ||
          (filterStatus == 'حاضر' && r.status == AttendanceStatus.present) ||
          (filterStatus == 'غائب' && r.status == AttendanceStatus.absent) ||
          (filterStatus == 'متأخر' && r.status == AttendanceStatus.late);
      return matchQuery && matchGrade && matchBatch && matchSubject && matchSession && matchStatus;
    }).toList();
  }

  const AttendanceState({
    required this.records,
    required this.students,
    this.query = '',
    this.filterGrade = 'الكل',
    this.filterBatch = 'الكل',
    this.filterSubject = 'الكل',
    this.filterSession = 'الكل',
    required this.filterDate,
    this.filterStatus = 'الكل',
    this.activeTab = 0,
    this.settings = const AttendanceSettings(),
    this.activeSession,
    this.lastScannedRecord,
  });

  factory AttendanceState.initial() {
    final now = DateTime.now();
    final mockStudents = _buildMockStudents();
    final mockRecords = _buildMockRecords(now, mockStudents);
    return AttendanceState(
      records: mockRecords,
      students: mockStudents,
      filterDate: DateTime(now.year, now.month, now.day),
      activeSession: QrSessionInfo(
        sessionName: 'الحصة الأولى',
        subject: 'الرياضيات',
        batch: 'الدفعة الأولى 2026',
        grade: 'الصف الثالث الثانوي',
        date: now,
      ),
    );
  }

  AttendanceState copyWith({
    List<AttendanceRecord>? records,
    List<MockStudentEntry>? students,
    String? query,
    String? filterGrade,
    String? filterBatch,
    String? filterSubject,
    String? filterSession,
    DateTime? filterDate,
    String? filterStatus,
    int? activeTab,
    AttendanceSettings? settings,
    QrSessionInfo? activeSession,
    AttendanceRecord? lastScannedRecord,
    bool clearLastScanned = false,
  }) {
    return AttendanceState(
      records: records ?? this.records,
      students: students ?? this.students,
      query: query ?? this.query,
      filterGrade: filterGrade ?? this.filterGrade,
      filterBatch: filterBatch ?? this.filterBatch,
      filterSubject: filterSubject ?? this.filterSubject,
      filterSession: filterSession ?? this.filterSession,
      filterDate: filterDate ?? this.filterDate,
      filterStatus: filterStatus ?? this.filterStatus,
      activeTab: activeTab ?? this.activeTab,
      settings: settings ?? this.settings,
      activeSession: activeSession ?? this.activeSession,
      lastScannedRecord: clearLastScanned ? null : (lastScannedRecord ?? this.lastScannedRecord),
    );
  }

  static List<MockStudentEntry> _buildMockStudents() {
    return [
      const MockStudentEntry(
        id: 'stu001',
        name: 'أحمد محمد علي',
        code: 'STU-2026-001',
        photo: '',
        batch: 'الدفعة الأولى 2026',
        grade: 'الصف الثالث الثانوي',
        phone: '01012345678',
        parentPhone: '01098765432',
        attendanceRate: 92.5,
        absenceCount: 3,
        lateCount: 2,
      ),
      const MockStudentEntry(
        id: 'stu002',
        name: 'فاطمة عبد الرحمن',
        code: 'STU-2026-002',
        photo: '',
        batch: 'الدفعة الأولى 2026',
        grade: 'الصف الثالث الثانوي',
        phone: '01123456789',
        parentPhone: '01087654321',
        attendanceRate: 98.0,
        absenceCount: 1,
        lateCount: 0,
      ),
      const MockStudentEntry(
        id: 'stu003',
        name: 'محمد خالد إبراهيم',
        code: 'STU-2026-003',
        photo: '',
        batch: 'الدفعة الثانية 2026',
        grade: 'الصف الثاني الثانوي',
        phone: '01234567890',
        parentPhone: '01176543210',
        attendanceRate: 75.0,
        absenceCount: 8,
        lateCount: 5,
      ),
      const MockStudentEntry(
        id: 'stu004',
        name: 'نور الهدى سعيد',
        code: 'STU-2026-004',
        photo: '',
        batch: 'الدفعة الأولى 2026',
        grade: 'الصف الثالث الثانوي',
        phone: '01345678901',
        parentPhone: '01265432109',
        attendanceRate: 88.5,
        absenceCount: 4,
        lateCount: 3,
      ),
      const MockStudentEntry(
        id: 'stu005',
        name: 'يوسف أحمد حسن',
        code: 'STU-2026-005',
        photo: '',
        batch: 'الدفعة الثانية 2026',
        grade: 'الصف الأول الثانوي',
        phone: '01456789012',
        parentPhone: '01354321098',
        attendanceRate: 95.0,
        absenceCount: 2,
        lateCount: 1,
      ),
      const MockStudentEntry(
        id: 'stu006',
        name: 'مريم إسماعيل طه',
        code: 'STU-2026-006',
        photo: '',
        batch: 'الدفعة الأولى 2026',
        grade: 'الصف الثالث الثانوي',
        phone: '01567890123',
        parentPhone: '01443210987',
        attendanceRate: 100.0,
        absenceCount: 0,
        lateCount: 0,
      ),
      const MockStudentEntry(
        id: 'stu007',
        name: 'عمر عبد الله فاروق',
        code: 'STU-2026-007',
        photo: '',
        batch: 'الدفعة الثانية 2026',
        grade: 'الصف الثاني الثانوي',
        phone: '01678901234',
        parentPhone: '01532109876',
        attendanceRate: 60.0,
        absenceCount: 12,
        lateCount: 6,
      ),
      const MockStudentEntry(
        id: 'stu008',
        name: 'سارة رامي محمود',
        code: 'STU-2026-008',
        photo: '',
        batch: 'الدفعة الأولى 2026',
        grade: 'الصف الثالث الثانوي',
        phone: '01789012345',
        parentPhone: '01621098765',
        attendanceRate: 84.0,
        absenceCount: 5,
        lateCount: 4,
      ),
    ];
  }

  static List<AttendanceRecord> _buildMockRecords(
      DateTime now, List<MockStudentEntry> students) {
    final statuses = [
      AttendanceStatus.present,
      AttendanceStatus.present,
      AttendanceStatus.absent,
      AttendanceStatus.present,
      AttendanceStatus.late,
      AttendanceStatus.present,
      AttendanceStatus.absent,
      AttendanceStatus.present,
    ];
    final methods = [
      AttendanceMethod.qr,
      AttendanceMethod.qr,
      AttendanceMethod.manual,
      AttendanceMethod.qr,
      AttendanceMethod.manual,
      AttendanceMethod.qr,
      AttendanceMethod.manual,
      AttendanceMethod.qr,
    ];

    return List.generate(students.length, (i) {
      final s = students[i];
      return AttendanceRecord(
        id: 'rec_${i + 1}',
        studentId: s.id,
        studentName: s.name,
        studentCode: s.code,
        studentPhoto: s.photo,
        batch: s.batch,
        grade: s.grade,
        subject: 'الرياضيات',
        sessionName: 'الحصة الأولى',
        status: statuses[i],
        method: methods[i],
        time: now.subtract(Duration(minutes: (i * 7))),
        phone: s.phone,
        parentPhone: s.parentPhone,
      );
    });
  }
}
