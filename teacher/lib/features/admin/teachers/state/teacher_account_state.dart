class TeacherAccountState {
  final String id;
  final String fullName;
  final String email;
  final String createdAt;

  final bool isActive;
  final String avatarPath;

  final String password;
  final List<String> stages;
  final List<String> grades;
  final List<String> subjects;
  final Map<String, bool> permissions;

  const TeacherAccountState({
    required this.id,
    required this.fullName,
    required this.email,
    required this.createdAt,
    this.isActive = true,
    this.avatarPath = '',
    this.password = '',
    this.stages = const [],
    this.grades = const [],
    this.subjects = const [],
    this.permissions = const {},
  });

  TeacherAccountState copyWith({
    String? id,
    String? fullName,
    String? email,
    String? createdAt,
    bool? isActive,
    String? avatarPath,
    String? password,
    List<String>? stages,
    List<String>? grades,
    List<String>? subjects,
    Map<String, bool>? permissions,
  }) {
    return TeacherAccountState(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
      isActive: isActive ?? this.isActive,
      avatarPath: avatarPath ?? this.avatarPath,
      password: password ?? this.password,
      stages: stages ?? this.stages,
      grades: grades ?? this.grades,
      subjects: subjects ?? this.subjects,
      permissions: permissions ?? this.permissions,
    );
  }
}
