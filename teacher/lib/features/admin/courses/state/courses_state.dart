enum CoursesViewMode { list, details }

class CourseModel {
  final String id;
  final String title;
  final String stage;
  final int videosCount;
  final DateTime publishDate;
  final String coverUrl;
  final bool isActive;
  final int durationHours;
  final int price;
  final int views;
  final int enrolled;

  const CourseModel({
    required this.id,
    required this.title,
    required this.stage,
    required this.videosCount,
    required this.publishDate,
    required this.coverUrl,
    required this.isActive,
    required this.durationHours,
    required this.price,
    required this.views,
    required this.enrolled,
  });
}

class CoursesState {
  final String query;
  final List<CourseModel> courses;

  const CoursesState({required this.query, required this.courses});

  static const initial = CoursesState(query: "", courses: []);

  CoursesState copyWith({String? query, List<CourseModel>? courses}) {
    return CoursesState(
      query: query ?? this.query,
      courses: courses ?? this.courses,
    );
  }
}
