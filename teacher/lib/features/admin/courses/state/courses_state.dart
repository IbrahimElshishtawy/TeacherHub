enum CoursesViewMode { list, details }

class ContentModel {
  final String id;
  final String title;
  final String description;
  final String contentType; // كورس, فيديو مستقل, مراجعة, ملخص, حل امتحان, حل واجب, اختبار, PDF, فيديو الصفحة الرئيسية
  final String subject;
  final String stage;
  final List<String> batches;
  final String sourceType; // Upload Video, YouTube, Google Drive, PDF
  final String videoUrl;
  final bool belongsToCourse;
  final String? courseName;
  final String? sectionName;
  final int videosCount;
  final String duration;
  final String coverUrl;
  final bool showInHome;
  final bool isAvailableForStudents;
  final bool isFree;
  final bool requiresSubscription;
  final DateTime publishDate;
  final int views;
  final int enrolled;
  final bool isActive;

  const ContentModel({
    required this.id,
    required this.title,
    this.description = "",
    required this.contentType,
    required this.subject,
    required this.stage,
    required this.batches,
    required this.sourceType,
    this.videoUrl = "",
    this.belongsToCourse = false,
    this.courseName,
    this.sectionName,
    this.videosCount = 0,
    this.duration = "00:00",
    this.coverUrl = "",
    this.showInHome = false,
    this.isAvailableForStudents = true,
    this.isFree = false,
    this.requiresSubscription = true,
    required this.publishDate,
    this.views = 0,
    this.enrolled = 0,
    this.isActive = true,
  });
}

class CoursesState {
  final String? _query;
  final List<ContentModel>? _courses;
  final String? _selectedType;
  final String? _selectedSubject;
  final String? _selectedBatch;
  final String? _selectedStage;
  final String? _selectedStatus;

  String get query => _query ?? "";
  List<ContentModel> get courses => _courses ?? const [];
  String get selectedType => _selectedType ?? "الكل";
  String get selectedSubject => _selectedSubject ?? "الكل";
  String get selectedBatch => _selectedBatch ?? "الكل";
  String get selectedStage => _selectedStage ?? "الكل";
  String get selectedStatus => _selectedStatus ?? "الكل";

  const CoursesState({
    String? query,
    List<ContentModel>? courses,
    String? selectedType,
    String? selectedSubject,
    String? selectedBatch,
    String? selectedStage,
    String? selectedStatus,
  })  : _query = query,
        _courses = courses,
        _selectedType = selectedType,
        _selectedSubject = selectedSubject,
        _selectedBatch = selectedBatch,
        _selectedStage = selectedStage,
        _selectedStatus = selectedStatus;

  static const initial = CoursesState(
    query: "",
    courses: [],
    selectedType: "الكل",
    selectedSubject: "الكل",
    selectedBatch: "الكل",
    selectedStage: "الكل",
    selectedStatus: "الكل",
  );

  CoursesState copyWith({
    String? query,
    List<ContentModel>? courses,
    String? selectedType,
    String? selectedSubject,
    String? selectedBatch,
    String? selectedStage,
    String? selectedStatus,
  }) {
    return CoursesState(
      query: query ?? this.query,
      courses: courses ?? this.courses,
      selectedType: selectedType ?? this.selectedType,
      selectedSubject: selectedSubject ?? this.selectedSubject,
      selectedBatch: selectedBatch ?? this.selectedBatch,
      selectedStage: selectedStage ?? this.selectedStage,
      selectedStatus: selectedStatus ?? this.selectedStatus,
    );
  }
}
