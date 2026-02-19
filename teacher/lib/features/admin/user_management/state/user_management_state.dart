// =============================
// Students
// =============================
enum StudentsViewMode { overview, table }

class StudentsOverview {
  final int active;
  final int total;
  final int suspended;
  final int warned;

  const StudentsOverview({
    required this.active,
    required this.total,
    required this.suspended,
    required this.warned,
  });

  static const empty = StudentsOverview(
    active: 0,
    total: 0,
    suspended: 0,
    warned: 0,
  );

  StudentsOverview copyWith({
    int? active,
    int? total,
    int? suspended,
    int? warned,
  }) {
    return StudentsOverview(
      active: active ?? this.active,
      total: total ?? this.total,
      suspended: suspended ?? this.suspended,
      warned: warned ?? this.warned,
    );
  }
}

class StudentRowModel {
  final String id;
  final String fullName;
  final String email;
  final String avatarUrl;

  final String phone;
  final String parentPhone;
  final String grade;
  final bool isActive;

  const StudentRowModel({
    required this.id,
    required this.fullName,
    required this.email,
    this.avatarUrl = "",
    required this.phone,
    required this.parentPhone,
    required this.grade,
    required this.isActive,
  });

  StudentRowModel copyWith({
    String? id,
    String? fullName,
    String? email,
    String? avatarUrl,
    String? phone,
    String? parentPhone,
    String? grade,
    bool? isActive,
  }) {
    return StudentRowModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      phone: phone ?? this.phone,
      parentPhone: parentPhone ?? this.parentPhone,
      grade: grade ?? this.grade,
      isActive: isActive ?? this.isActive,
    );
  }
}

// =============================
// Parents
// =============================
enum ParentsViewMode { overview, table }

class ParentsOverview {
  final int active;
  final int total;
  final int suspended;
  final int warned;

  const ParentsOverview({
    required this.active,
    required this.total,
    required this.suspended,
    required this.warned,
  });

  static const empty = ParentsOverview(
    active: 0,
    total: 0,
    suspended: 0,
    warned: 0,
  );

  ParentsOverview copyWith({
    int? active,
    int? total,
    int? suspended,
    int? warned,
  }) {
    return ParentsOverview(
      active: active ?? this.active,
      total: total ?? this.total,
      suspended: suspended ?? this.suspended,
      warned: warned ?? this.warned,
    );
  }
}

class ParentRowModel {
  final String id;
  final String fullName;
  final String avatarUrl;

  // وسائل التواصل
  final String phone;
  final String whatsapp;

  // ربط بالطالب (لو محتاجه)
  final String linkedStudentId;

  // حالة الحساب
  final bool isActive;

  const ParentRowModel({
    required this.id,
    required this.fullName,
    this.avatarUrl = "",
    required this.phone,
    required this.whatsapp,
    required this.linkedStudentId,
    required this.isActive,
  });

  ParentRowModel copyWith({
    String? id,
    String? fullName,
    String? avatarUrl,
    String? phone,
    String? whatsapp,
    String? linkedStudentId,
    bool? isActive,
  }) {
    return ParentRowModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      phone: phone ?? this.phone,
      whatsapp: whatsapp ?? this.whatsapp,
      linkedStudentId: linkedStudentId ?? this.linkedStudentId,
      isActive: isActive ?? this.isActive,
    );
  }
}

// =============================
// State
// =============================
class UserManagementState {
  // ===== Students =====
  final StudentsViewMode studentsMode;
  final StudentsOverview studentsOverview;
  final List<StudentRowModel> students;
  final String studentsQuery;

  // ===== Parents =====
  final ParentsViewMode parentsMode;
  final ParentsOverview parentsOverview;
  final List<ParentRowModel> parents;
  final String parentsQuery;

  const UserManagementState({
    required this.studentsMode,
    required this.studentsOverview,
    required this.students,
    required this.studentsQuery,
    required this.parentsMode,
    required this.parentsOverview,
    required this.parents,
    required this.parentsQuery,
  });

  static const initial = UserManagementState(
    // Students
    studentsMode: StudentsViewMode.overview,
    studentsOverview: StudentsOverview.empty,
    students: [],
    studentsQuery: "",

    // Parents
    parentsMode: ParentsViewMode.overview,
    parentsOverview: ParentsOverview.empty,
    parents: [],
    parentsQuery: "",
  );

  UserManagementState copyWith({
    // Students
    StudentsViewMode? studentsMode,
    StudentsOverview? studentsOverview,
    List<StudentRowModel>? students,
    String? studentsQuery,

    // Parents
    ParentsViewMode? parentsMode,
    ParentsOverview? parentsOverview,
    List<ParentRowModel>? parents,
    String? parentsQuery,
  }) {
    return UserManagementState(
      // Students
      studentsMode: studentsMode ?? this.studentsMode,
      studentsOverview: studentsOverview ?? this.studentsOverview,
      students: students ?? this.students,
      studentsQuery: studentsQuery ?? this.studentsQuery,

      // Parents
      parentsMode: parentsMode ?? this.parentsMode,
      parentsOverview: parentsOverview ?? this.parentsOverview,
      parents: parents ?? this.parents,
      parentsQuery: parentsQuery ?? this.parentsQuery,
    );
  }
}
