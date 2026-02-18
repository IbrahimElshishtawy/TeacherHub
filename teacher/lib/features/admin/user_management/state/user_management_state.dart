class StudentsManagementState {
  final int total;
  final int active;
  final int suspended;
  final int warned;

  const StudentsManagementState({
    required this.total,
    required this.active,
    required this.suspended,
    required this.warned,
  });

  StudentsManagementState copyWith({
    int? total,
    int? active,
    int? suspended,
    int? warned,
  }) {
    return StudentsManagementState(
      total: total ?? this.total,
      active: active ?? this.active,
      suspended: suspended ?? this.suspended,
      warned: warned ?? this.warned,
    );
  }

  static const initial = StudentsManagementState(
    total: 0,
    active: 0,
    suspended: 0,
    warned: 0,
  );
}
