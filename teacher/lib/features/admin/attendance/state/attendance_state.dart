enum AttendanceGradeTab { prep3, sec1, sec2 }

class AttendanceState {
  final AttendanceGradeTab tab;
  final DateTime date;
  final String query;

  final int totalStudents;
  final int presentCount;
  final int absentCount;

  const AttendanceState({
    required this.tab,
    required this.date,
    required this.query,
    required this.totalStudents,
    required this.presentCount,
    required this.absentCount,
  });

  factory AttendanceState.initial() {
    final now = DateTime.now();
    return AttendanceState(
      tab: AttendanceGradeTab.prep3,
      date: DateTime(now.year, now.month, now.day),
      query: "",
      totalStudents: 300,
      presentCount: 290,
      absentCount: 10,
    );
  }

  AttendanceState copyWith({
    AttendanceGradeTab? tab,
    DateTime? date,
    String? query,
    int? totalStudents,
    int? presentCount,
    int? absentCount,
  }) {
    return AttendanceState(
      tab: tab ?? this.tab,
      date: date ?? this.date,
      query: query ?? this.query,
      totalStudents: totalStudents ?? this.totalStudents,
      presentCount: presentCount ?? this.presentCount,
      absentCount: absentCount ?? this.absentCount,
    );
  }
}
