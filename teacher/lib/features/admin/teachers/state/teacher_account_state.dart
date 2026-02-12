class TeacherAccountState {
  final bool isActive;
  final String fullName;
  final String email;
  final String stageLabel;
  final String createdAtLabel;
  final String avatarUrl;

  const TeacherAccountState({
    required this.isActive,
    required this.fullName,
    required this.email,
    required this.stageLabel,
    required this.createdAtLabel,
    this.avatarUrl = '',
  });

  TeacherAccountState copyWith({
    bool? isActive,
    String? fullName,
    String? email,
    String? stageLabel,
    String? createdAtLabel,
    String? avatarUrl,
  }) {
    return TeacherAccountState(
      isActive: isActive ?? this.isActive,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      stageLabel: stageLabel ?? this.stageLabel,
      createdAtLabel: createdAtLabel ?? this.createdAtLabel,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }
}
