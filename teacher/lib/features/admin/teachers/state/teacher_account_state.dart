class TeacherAccountState {
  final bool isActive;
  final String fullName;
  final String email;
  final String stageLabel;
  final String createdAtLabel;
  final String avatarUrl;
  final bool? isOptionSelected;
  final String? selectedOption;

  const TeacherAccountState({
    required this.isActive,
    required this.isOptionSelected,
    required this.fullName,
    required this.email,
    required this.stageLabel,
    required this.createdAtLabel,
    this.avatarUrl = '',
    this.selectedOption,
  });

  TeacherAccountState copyWith({
    bool? isActive,
    String? fullName,
    String? email,
    bool? isOptionSelected,
    String? stageLabel,
    String? createdAtLabel,
    String? avatarUrl,
    String? selectedOption,
  }) {
    return TeacherAccountState(
      isActive: isActive ?? this.isActive,
      fullName: fullName ?? this.fullName,
      isOptionSelected: isOptionSelected ?? this.isOptionSelected,
      email: email ?? this.email,
      stageLabel: stageLabel ?? this.stageLabel,
      createdAtLabel: createdAtLabel ?? this.createdAtLabel,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      selectedOption: selectedOption ?? this.selectedOption,
    );
  }
}
