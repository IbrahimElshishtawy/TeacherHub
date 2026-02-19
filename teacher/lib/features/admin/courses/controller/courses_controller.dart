import 'package:get/get.dart';
import '../state/courses_state.dart';

class CoursesController extends GetxController {
  final Rx<CoursesState> state = CoursesState.initial.obs;

  @override
  void onInit() {
    super.onInit();
    _seedCourses();
  }

  void _seedCourses() {
    final items = <CourseModel>[
      CourseModel(
        id: "CH-301",
        title: "شرح الباب الأول في الكيمياء",
        stage: "الصف الثالث الثانوي",
        videosCount: 8,
        publishDate: DateTime(2025, 1, 16),
        coverUrl: "", // حط URL لاحقاً
        isActive: true,
        durationHours: 6,
        price: 300,
        views: 320,
        enrolled: 350,
      ),
      CourseModel(
        id: "CH-302",
        title: "شرح كامل لباب أول - كيمياء",
        stage: "الصف الثالث الثانوي",
        videosCount: 8,
        publishDate: DateTime(2025, 1, 16),
        coverUrl: "",
        isActive: true,
        durationHours: 6,
        price: 300,
        views: 320,
        enrolled: 350,
      ),
    ];

    state.value = state.value.copyWith(courses: items);
  }

  void setQuery(String q) {
    state.value = state.value.copyWith(query: q);
  }

  List<CourseModel> get filteredCourses {
    final q = state.value.query.trim().toLowerCase();
    if (q.isEmpty) return state.value.courses;

    return state.value.courses.where((c) {
      return c.title.toLowerCase().contains(q) ||
          c.stage.toLowerCase().contains(q) ||
          c.id.toLowerCase().contains(q);
    }).toList();
  }

  void openFilter() {
    Get.snackbar("فلتر", "فلترة الكورسات (قريباً)");
  }

  void openDetails(CourseModel course) {
    Get.toNamed('/home_admin/courses/details', arguments: course);
  }

  // Actions in details
  void previewCourse(CourseModel course) {
    Get.snackbar("معاينة", "معاينة الكورس: ${course.title}");
  }

  void changeStatus(CourseModel course) {
    Get.snackbar("تغيير الحالة", "تغيير حالة الكورس (قريباً)");
  }

  void editCourse(CourseModel course) {
    Get.snackbar("تعديل", "تعديل بيانات الكورس (قريباً)");
  }
}
