class ExamsRRState {
  final int examsCount; // عدد الاختبارات
  final int reviewsCount; // عدد المراجعات
  final int resultsCount; // عدد النتائج

  const ExamsRRState({
    required this.examsCount,
    required this.reviewsCount,
    required this.resultsCount,
  });

  static const initial = ExamsRRState(
    examsCount: 0,
    reviewsCount: 0,
    resultsCount: 0,
  );

  ExamsRRState copyWith({
    int? examsCount,
    int? reviewsCount,
    int? resultsCount,
  }) {
    return ExamsRRState(
      examsCount: examsCount ?? this.examsCount,
      reviewsCount: reviewsCount ?? this.reviewsCount,
      resultsCount: resultsCount ?? this.resultsCount,
    );
  }
}
