enum ReportMonth { jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec }

extension ReportMonthX on ReportMonth {
  String get label {
    switch (this) {
      case ReportMonth.jan:
        return "يناير";
      case ReportMonth.feb:
        return "فبراير";
      case ReportMonth.mar:
        return "مارس";
      case ReportMonth.apr:
        return "أبريل";
      case ReportMonth.may:
        return "مايو";
      case ReportMonth.jun:
        return "يونيو";
      case ReportMonth.jul:
        return "يوليو";
      case ReportMonth.aug:
        return "أغسطس";
      case ReportMonth.sep:
        return "سبتمبر";
      case ReportMonth.oct:
        return "أكتوبر";
      case ReportMonth.nov:
        return "نوفمبر";
      case ReportMonth.dec:
        return "ديسمبر";
    }
  }
}

class AttendanceMonthData {
  final int total;
  final int present;
  final int absent;

  const AttendanceMonthData({
    required this.total,
    required this.present,
    required this.absent,
  });

  double get presentRate => total == 0 ? 0 : (present / total) * 100;
  double get absentRate => total == 0 ? 0 : (absent / total) * 100;
}

class GradesMonthData {
  final int total;
  final double avg;
  final int high;
  final int mid;
  final int low;

  const GradesMonthData({
    required this.total,
    required this.avg,
    required this.high,
    required this.mid,
    required this.low,
  });
}

class ReportsState {
  // Expand/collapse
  final bool attendanceExpanded;
  final bool gradesExpanded;

  // Selected month for each panel
  final ReportMonth attendanceMonth;
  final ReportMonth gradesMonth;

  // Data
  final Map<ReportMonth, AttendanceMonthData> attendanceByMonth;
  final Map<ReportMonth, GradesMonthData> gradesByMonth;

  const ReportsState({
    required this.attendanceExpanded,
    required this.gradesExpanded,
    required this.attendanceMonth,
    required this.gradesMonth,
    required this.attendanceByMonth,
    required this.gradesByMonth,
  });

  static ReportsState initial() {
    final attendance = <ReportMonth, AttendanceMonthData>{
      ReportMonth.jan: const AttendanceMonthData(
        total: 300,
        present: 350,
        absent: 50,
      ),
      ReportMonth.feb: const AttendanceMonthData(
        total: 280,
        present: 260,
        absent: 20,
      ),
      ReportMonth.mar: const AttendanceMonthData(
        total: 320,
        present: 300,
        absent: 20,
      ),
      ReportMonth.apr: const AttendanceMonthData(
        total: 310,
        present: 290,
        absent: 20,
      ),
      ReportMonth.may: const AttendanceMonthData(
        total: 305,
        present: 280,
        absent: 25,
      ),
      ReportMonth.jun: const AttendanceMonthData(
        total: 300,
        present: 270,
        absent: 30,
      ),
      ReportMonth.jul: const AttendanceMonthData(
        total: 290,
        present: 260,
        absent: 30,
      ),
      ReportMonth.aug: const AttendanceMonthData(
        total: 295,
        present: 275,
        absent: 20,
      ),
      ReportMonth.sep: const AttendanceMonthData(
        total: 310,
        present: 290,
        absent: 20,
      ),
      ReportMonth.oct: const AttendanceMonthData(
        total: 300,
        present: 280,
        absent: 20,
      ),
      ReportMonth.nov: const AttendanceMonthData(
        total: 305,
        present: 285,
        absent: 20,
      ),
      ReportMonth.dec: const AttendanceMonthData(
        total: 315,
        present: 295,
        absent: 20,
      ),
    };

    final grades = <ReportMonth, GradesMonthData>{
      ReportMonth.jan: const GradesMonthData(
        total: 350,
        avg: 98.0,
        high: 280,
        mid: 60,
        low: 10,
      ),
      ReportMonth.feb: const GradesMonthData(
        total: 340,
        avg: 92.5,
        high: 240,
        mid: 85,
        low: 15,
      ),
      ReportMonth.mar: const GradesMonthData(
        total: 360,
        avg: 88.0,
        high: 210,
        mid: 120,
        low: 30,
      ),
      ReportMonth.apr: const GradesMonthData(
        total: 355,
        avg: 90.0,
        high: 230,
        mid: 105,
        low: 20,
      ),
      ReportMonth.may: const GradesMonthData(
        total: 345,
        avg: 86.0,
        high: 200,
        mid: 115,
        low: 30,
      ),
      ReportMonth.jun: const GradesMonthData(
        total: 350,
        avg: 89.0,
        high: 220,
        mid: 110,
        low: 20,
      ),
      ReportMonth.jul: const GradesMonthData(
        total: 340,
        avg: 87.5,
        high: 210,
        mid: 100,
        low: 30,
      ),
      ReportMonth.aug: const GradesMonthData(
        total: 355,
        avg: 91.0,
        high: 240,
        mid: 90,
        low: 25,
      ),
      ReportMonth.sep: const GradesMonthData(
        total: 360,
        avg: 88.5,
        high: 230,
        mid: 110,
        low: 20,
      ),
      ReportMonth.oct: const GradesMonthData(
        total: 350,
        avg: 90.0,
        high: 220,
        mid: 115,
        low: 15,
      ),
      ReportMonth.nov: const GradesMonthData(
        total: 345,
        avg: 87.0,
        high: 210,
        mid: 120,
        low: 15,
      ),
      ReportMonth.dec: const GradesMonthData(
        total: 360,
        avg: 89.5,
        high: 240,
        mid: 100,
        low: 20,
      ),
    };

    return ReportsState(
      attendanceExpanded: true,
      gradesExpanded: false,
      attendanceMonth: ReportMonth.jan,
      gradesMonth: ReportMonth.jan,
      attendanceByMonth: attendance,
      gradesByMonth: grades,
    );
  }

  ReportsState copyWith({
    bool? attendanceExpanded,
    bool? gradesExpanded,
    ReportMonth? attendanceMonth,
    ReportMonth? gradesMonth,
    Map<ReportMonth, AttendanceMonthData>? attendanceByMonth,
    Map<ReportMonth, GradesMonthData>? gradesByMonth,
  }) {
    return ReportsState(
      attendanceExpanded: attendanceExpanded ?? this.attendanceExpanded,
      gradesExpanded: gradesExpanded ?? this.gradesExpanded,
      attendanceMonth: attendanceMonth ?? this.attendanceMonth,
      gradesMonth: gradesMonth ?? this.gradesMonth,
      attendanceByMonth: attendanceByMonth ?? this.attendanceByMonth,
      gradesByMonth: gradesByMonth ?? this.gradesByMonth,
    );
  }
}
