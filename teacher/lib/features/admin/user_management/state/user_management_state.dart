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
  // ===== Identifiers =====
  final String id;
  final String fullName;
  final String email;
  final String avatarUrl;

  // ===== Extra data (للجدول اللي فيه هاتف/ولي أمر/صف/حالة) =====
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
}

class UserManagementState {
  // ===== Students =====
  final StudentsViewMode studentsMode;

  // Overview cards data
  final StudentsOverview studentsOverview;

  // Table/List data
  final List<StudentRowModel> students;

  // Search
  final String studentsQuery;

  const UserManagementState({
    required this.studentsMode,
    required this.studentsOverview,
    required this.students,
    required this.studentsQuery,
  });

  static const initial = UserManagementState(
    studentsMode: StudentsViewMode.overview,
    studentsOverview: StudentsOverview.empty,
    students: [],
    studentsQuery: "",
  );

  UserManagementState copyWith({
    StudentsViewMode? studentsMode,
    StudentsOverview? studentsOverview,
    List<StudentRowModel>? students,
    String? studentsQuery,
  }) {
    return UserManagementState(
      studentsMode: studentsMode ?? this.studentsMode,
      studentsOverview: studentsOverview ?? this.studentsOverview,
      students: students ?? this.students,
      studentsQuery: studentsQuery ?? this.studentsQuery,
    );
  }
}
