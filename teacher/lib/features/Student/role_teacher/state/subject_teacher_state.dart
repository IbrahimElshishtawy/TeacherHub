class SubjectTeacherState {
  /// key: subjectId, value: selectedTeacher
  final Map<String, TeacherModel> selectedTeachers;

  const SubjectTeacherState({this.selectedTeachers = const {}});

  SubjectTeacherState copyWith({Map<String, TeacherModel>? selectedTeachers}) {
    return SubjectTeacherState(
      selectedTeachers: selectedTeachers ?? this.selectedTeachers,
    );
  }
}

class SubjectModel {
  final String id;
  final String name;
  final String iconAsset; // أو ممكن IconData
  const SubjectModel({
    required this.id,
    required this.name,
    required this.iconAsset,
  });
}

class TeacherModel {
  final String id;
  final String name;
  final String avatarUrl;
  final bool available;
  final String gradeText; // "الصف الثالث الثانوي"
  final String stageText; // "المرحلة الثانوية"
  final int studentsCount; // 300
  const TeacherModel({
    required this.id,
    required this.name,
    required this.avatarUrl,
    required this.available,
    required this.gradeText,
    required this.stageText,
    required this.studentsCount,
  });
}
