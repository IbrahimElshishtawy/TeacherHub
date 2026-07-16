
class StudentModel {
  final String id;
  final String fullName;
  final String avatarUrl;
  final String phone;
  final String parentPhone;
  final String parentWhatsapp;
  final String grade; // e.g. الصف الثالث الثانوي
  final String batch; // e.g. Third Secondary 2026
  final String schoolYear; // e.g. 2025/2026
  final bool isActive;
  final String subscriptionStatus; // نشط / منتهي / غير مشترك
  final double attendanceRate; // e.g. 85.0
  final String latestExamScore; // e.g. 18/20

  // Attendance Detail
  final int attendanceCount;
  final int absenceCount;
  final String latestAttendanceDate;

  // Exam Statistics
  final int examCount;
  final double avgExamScore;
  final double highestExamScore;
  final String latestExamName;

  // Homework Statistics
  final int homeworkCount;
  final int completedHomework;
  final int delayedHomework;

  // Course Progress
  final int purchasedCoursesCount;
  final double courseProgress; // e.g. 75.0
  final int completedLessons;
  final int remainingLessons;

  // Notes
  final String internalNotes;

  // Timeline logs
  final String lastLogin;
  final String lastWatch;
  final String lastExam;
  final String lastHomework;

  const StudentModel({
    required this.id,
    required this.fullName,
    this.avatarUrl = "",
    required this.phone,
    required this.parentPhone,
    required this.parentWhatsapp,
    required this.grade,
    required this.batch,
    required this.schoolYear,
    this.isActive = true,
    required this.subscriptionStatus,
    this.attendanceRate = 0.0,
    this.latestExamScore = "N/A",
    this.attendanceCount = 0,
    this.absenceCount = 0,
    this.latestAttendanceDate = "N/A",
    this.examCount = 0,
    this.avgExamScore = 0.0,
    this.highestExamScore = 0.0,
    this.latestExamName = "N/A",
    this.homeworkCount = 0,
    this.completedHomework = 0,
    this.delayedHomework = 0,
    this.purchasedCoursesCount = 0,
    this.courseProgress = 0.0,
    this.completedLessons = 0,
    this.remainingLessons = 0,
    this.internalNotes = "",
    this.lastLogin = "N/A",
    this.lastWatch = "N/A",
    this.lastExam = "N/A",
    this.lastHomework = "N/A",
  });

  StudentModel copyWith({
    String? id,
    String? fullName,
    String? avatarUrl,
    String? phone,
    String? parentPhone,
    String? parentWhatsapp,
    String? grade,
    String? batch,
    String? schoolYear,
    bool? isActive,
    String? subscriptionStatus,
    double? attendanceRate,
    String? latestExamScore,
    int? attendanceCount,
    int? absenceCount,
    String? latestAttendanceDate,
    int? examCount,
    double? avgExamScore,
    double? highestExamScore,
    String? latestExamName,
    int? homeworkCount,
    int? completedHomework,
    int? delayedHomework,
    int? purchasedCoursesCount,
    double? courseProgress,
    int? completedLessons,
    int? remainingLessons,
    String? internalNotes,
    String? lastLogin,
    String? lastWatch,
    String? lastExam,
    String? lastHomework,
  }) {
    return StudentModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      phone: phone ?? this.phone,
      parentPhone: parentPhone ?? this.parentPhone,
      parentWhatsapp: parentWhatsapp ?? this.parentWhatsapp,
      grade: grade ?? this.grade,
      batch: batch ?? this.batch,
      schoolYear: schoolYear ?? this.schoolYear,
      isActive: isActive ?? this.isActive,
      subscriptionStatus: subscriptionStatus ?? this.subscriptionStatus,
      attendanceRate: attendanceRate ?? this.attendanceRate,
      latestExamScore: latestExamScore ?? this.latestExamScore,
      attendanceCount: attendanceCount ?? this.attendanceCount,
      absenceCount: absenceCount ?? this.absenceCount,
      latestAttendanceDate: latestAttendanceDate ?? this.latestAttendanceDate,
      examCount: examCount ?? this.examCount,
      avgExamScore: avgExamScore ?? this.avgExamScore,
      highestExamScore: highestExamScore ?? this.highestExamScore,
      latestExamName: latestExamName ?? this.latestExamName,
      homeworkCount: homeworkCount ?? this.homeworkCount,
      completedHomework: completedHomework ?? this.completedHomework,
      delayedHomework: delayedHomework ?? this.delayedHomework,
      purchasedCoursesCount: purchasedCoursesCount ?? this.purchasedCoursesCount,
      courseProgress: courseProgress ?? this.courseProgress,
      completedLessons: completedLessons ?? this.completedLessons,
      remainingLessons: remainingLessons ?? this.remainingLessons,
      internalNotes: internalNotes ?? this.internalNotes,
      lastLogin: lastLogin ?? this.lastLogin,
      lastWatch: lastWatch ?? this.lastWatch,
      lastExam: lastExam ?? this.lastExam,
      lastHomework: lastHomework ?? this.lastHomework,
    );
  }
}

class ParentModel {
  final String id;
  final String fullName;
  final String phone;
  final String whatsapp;
  final List<String> childrenIds;

  const ParentModel({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.whatsapp,
    required this.childrenIds,
  });

  ParentModel copyWith({
    String? id,
    String? fullName,
    String? phone,
    String? whatsapp,
    List<String>? childrenIds,
  }) {
    return ParentModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      whatsapp: whatsapp ?? this.whatsapp,
      childrenIds: childrenIds ?? this.childrenIds,
    );
  }
}

class UserManagementState {
  final List<StudentModel> students;
  final List<ParentModel> parents;

  // Student Filters
  final String studentQuery;
  final String selectedStudentBatch;
  final String selectedStudentGrade;
  final String selectedStudentYear;
  final String selectedStudentStatus; // الكل / نشط / موقوف
  final String selectedStudentSub; // الكل / نشط / منتهي
  final String selectedStudentAttendance; // الكل / ممتاز / مقبول / ضعيف

  // Parent Filters
  final String parentQuery;
  final String selectedParentBatch;
  final String selectedParentGrade;
  final String selectedParentYear;
  final String selectedParentChildrenCount; // الكل / 1 / 2 / 3+

  // Chatbot Toggles
  final Map<String, bool> enabledReports;

  const UserManagementState({
    required this.students,
    required this.parents,
    this.studentQuery = "",
    this.selectedStudentBatch = "الكل",
    this.selectedStudentGrade = "الكل",
    this.selectedStudentYear = "الكل",
    this.selectedStudentStatus = "الكل",
    this.selectedStudentSub = "الكل",
    this.selectedStudentAttendance = "الكل",
    this.parentQuery = "",
    this.selectedParentBatch = "الكل",
    this.selectedParentGrade = "الكل",
    this.selectedParentYear = "الكل",
    this.selectedParentChildrenCount = "الكل",
    this.enabledReports = const {
      "تقرير الحضور اليومي": true,
      "تقرير الغياب": true,
      "درجات الاختبارات": true,
      "الواجبات": true,
      "تقدم الطالب": false,
      "تذكير بالمحاضرات": true,
      "انتهاء الاشتراك": false,
    },
  });

  static const initial = UserManagementState(
    students: [],
    parents: [],
  );

  UserManagementState copyWith({
    List<StudentModel>? students,
    List<ParentModel>? parents,
    String? studentQuery,
    String? selectedStudentBatch,
    String? selectedStudentGrade,
    String? selectedStudentYear,
    String? selectedStudentStatus,
    String? selectedStudentSub,
    String? selectedStudentAttendance,
    String? parentQuery,
    String? selectedParentBatch,
    String? selectedParentGrade,
    String? selectedParentYear,
    String? selectedParentChildrenCount,
    Map<String, bool>? enabledReports,
  }) {
    return UserManagementState(
      students: students ?? this.students,
      parents: parents ?? this.parents,
      studentQuery: studentQuery ?? this.studentQuery,
      selectedStudentBatch: selectedStudentBatch ?? this.selectedStudentBatch,
      selectedStudentGrade: selectedStudentGrade ?? this.selectedStudentGrade,
      selectedStudentYear: selectedStudentYear ?? this.selectedStudentYear,
      selectedStudentStatus: selectedStudentStatus ?? this.selectedStudentStatus,
      selectedStudentSub: selectedStudentSub ?? this.selectedStudentSub,
      selectedStudentAttendance: selectedStudentAttendance ?? this.selectedStudentAttendance,
      parentQuery: parentQuery ?? this.parentQuery,
      selectedParentBatch: selectedParentBatch ?? this.selectedParentBatch,
      selectedParentGrade: selectedParentGrade ?? this.selectedParentGrade,
      selectedParentYear: selectedParentYear ?? this.selectedParentYear,
      selectedParentChildrenCount: selectedParentChildrenCount ?? this.selectedParentChildrenCount,
      enabledReports: enabledReports ?? this.enabledReports,
    );
  }
}
