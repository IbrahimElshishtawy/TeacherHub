import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../state/courses_state.dart';
import 'package:teacher/features/Student/Student_home/controller/Student_home_controller.dart';

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

  void uploadVideoFromGoogleDrive(CourseModel course) {
    final titleController = TextEditingController();
    final descController = TextEditingController();
    final linkController = TextEditingController();
    final durationController = TextEditingController(text: "45");

    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.add_to_drive_outlined, color: Color(0xFF1976D2), size: 28),
                      const SizedBox(width: 10),
                      const Text(
                        "رفع فيديو من Google Drive",
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "أدخل تفاصيل الفيديو ورابط المشاركة من جوجل درايف ليعرض للطالب.",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  const SizedBox(height: 16),
                  
                  // Title Field
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      labelText: "عنوان الفيديو",
                      hintText: "مثال: مقدمة الباب الأول كيمياء",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Desc Field
                  TextField(
                    controller: descController,
                    decoration: InputDecoration(
                      labelText: "وصف الفيديو",
                      hintText: "مثال: شرح مبسط عن مكونات الذرة والروابط",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Link Field
                  TextField(
                    controller: linkController,
                    textDirection: TextDirection.ltr,
                    decoration: InputDecoration(
                      labelText: "رابط فيديو Google Drive",
                      hintText: "https://drive.google.com/...",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      prefixIcon: const Icon(Icons.link, color: Color(0xFF1976D2)),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Duration Field
                  TextField(
                    controller: durationController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "مدة الفيديو (بالدقائق)",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Actions Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Get.back(),
                        child: const Text("إلغاء", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          final title = titleController.text.trim();
                          final link = linkController.text.trim();
                          if (title.isEmpty || link.isEmpty) {
                            Get.snackbar(
                              "خطأ",
                              "يرجى إدخال عنوان الفيديو ورابط جوجل درايف",
                              backgroundColor: Colors.red.withValues(alpha: 0.9),
                              colorText: Colors.white,
                            );
                            return;
                          }

                          if (!link.contains("drive.google.com")) {
                            Get.snackbar(
                              "رابط غير صالح",
                              "يرجى إدخال رابط مشاركة صحيح من Google Drive",
                              backgroundColor: Colors.amber.withValues(alpha: 0.9),
                              colorText: Colors.white,
                            );
                            return;
                          }

                          Get.back(); // Close Dialog
                          Get.snackbar(
                            "تم الرفع بنجاح",
                            "تم إضافة فيديو '$title' من Google Drive بنجاح، وهو الآن متاح للطلاب.",
                            backgroundColor: const Color(0xFF4CAF50).withValues(alpha: 0.9),
                            colorText: Colors.white,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1976D2),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        child: const Text("تأكيد الرفع", style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void assignVideoListToBatch() {
    String? selectedCourseId;
    String? selectedBatch;
    final noteController = TextEditingController();

    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: StatefulBuilder(
              builder: (context, setState) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.share_outlined, color: Color(0xFF6A1BB2), size: 28),
                          const SizedBox(width: 10),
                          const Text(
                            "إسناد قائمة فيديوهات لدفعة",
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "اختر كورس/مجموعة فيديوهات، وحدد الدفعة الدراسية التي ترغب في إتاحة هذه الفيديوهات لها.",
                        style: TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                      const SizedBox(height: 16),

                      // Dropdown for Course/Video List Selection
                      const Text(
                        "اختر الكورس / قائمة الفيديوهات",
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedCourseId,
                            hint: const Text("اختر من الكورسات المتاحة"),
                            isExpanded: true,
                            items: state.value.courses.map((c) {
                              return DropdownMenuItem<String>(
                                value: c.id,
                                child: Text(c.title),
                              );
                            }).toList(),
                            onChanged: (val) {
                              setState(() => selectedCourseId = val);
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Dropdown for Target Batch/Class Selection
                      const Text(
                        "اختر الدفعة المستهدفة",
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedBatch,
                            hint: const Text("اختر الدفعة الدراسية"),
                            isExpanded: true,
                            items: const [
                              DropdownMenuItem(value: "الصف الأول الثانوي", child: Text("الصف الأول الثانوي")),
                              DropdownMenuItem(value: "الصف الثاني الثانوي", child: Text("الصف الثاني الثانوي")),
                              DropdownMenuItem(value: "الصف الثالث الثانوي", child: Text("الصف الثالث الثانوي")),
                            ],
                            onChanged: (val) {
                              setState(() => selectedBatch = val);
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Note field
                      TextField(
                        controller: noteController,
                        maxLines: 2,
                        decoration: InputDecoration(
                          labelText: "ملاحظة أو رسالة تنبيه للطلاب (اختياري)",
                          hintText: "مثال: يرجى مشاهدة هذه القائمة قبل محاضرة السبت القادم",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () => Get.back(),
                            child: const Text("إلغاء", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {
                              if (selectedCourseId == null || selectedBatch == null) {
                                Get.snackbar(
                                  "خطأ",
                                  "يرجى اختيار الكورس والدفعة الدراسية المستهدفة",
                                  backgroundColor: Colors.red.withValues(alpha: 0.9),
                                  colorText: Colors.white,
                                );
                                return;
                              }

                              final course = state.value.courses.firstWhere((c) => c.id == selectedCourseId);

                              Get.back(); // Close Dialog
                              Get.snackbar(
                                "تم الإسناد بنجاح",
                                "تم إسناد قائمة فيديوهات '${course.title}' إلى دفعة '$selectedBatch' بنجاح.",
                                backgroundColor: const Color(0xFF4CAF50).withValues(alpha: 0.9),
                                colorText: Colors.white,
                                duration: const Duration(seconds: 4),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF6A1BB2),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                            child: const Text("تأكيد الإسناد", style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void createNewCourseDialog() {
    final titleController = TextEditingController();
    String? selectedBatch;
    String? selectedPart;
    final driveLinkController = TextEditingController();
    bool isSingleVideo = false;
    bool isGeneral = false;

    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: StatefulBuilder(
              builder: (context, setState) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.add_box_outlined, color: Color(0xFF2F6BFF), size: 28),
                          const SizedBox(width: 10),
                          const Text(
                            "إنشاء كورس / قائمة فيديوهات",
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "قم بملء البيانات لتأسيس كورس جديد وتحديد نوعه والدفعة والباب المستهدف.",
                        style: TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                      const SizedBox(height: 16),

                      // Title Field
                      TextField(
                        controller: titleController,
                        decoration: InputDecoration(
                          labelText: "عنوان الكورس / القائمة",
                          hintText: "مثال: شرح الباب الثاني كيمياء",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Dropdown for Target Batch
                      const Text(
                        "الدفعة الدراسية المستهدفة",
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedBatch,
                            hint: const Text("اختر الدفعة"),
                            isExpanded: true,
                            items: const [
                              DropdownMenuItem(value: "الصف الأول الثانوي", child: Text("الصف الأول الثانوي")),
                              DropdownMenuItem(value: "الصف الثاني الثانوي", child: Text("الصف الثاني الثانوي")),
                              DropdownMenuItem(value: "الصف الثالث الثانوي", child: Text("الصف الثالث الثانوي")),
                            ],
                            onChanged: (val) {
                              setState(() => selectedBatch = val);
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Dropdown for Subject Part/Chapter
                      const Text(
                        "الجزء / الباب من المادة",
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedPart,
                            hint: const Text("اختر الجزء/الباب المستهدف"),
                            isExpanded: true,
                            items: const [
                              DropdownMenuItem(value: "الباب الأول (مفاهيم كيميائية)", child: Text("الباب الأول (مفاهيم كيميائية)")),
                              DropdownMenuItem(value: "الباب الثاني (الكيمياء التحليلية)", child: Text("الباب الثاني (الكيمياء التحليلية)")),
                              DropdownMenuItem(value: "الباب الثالث (الاتزان الكيميائي)", child: Text("الباب الثالث (الاتزان الكيميائي)")),
                              DropdownMenuItem(value: "الباب الرابع (الكيمياء الكهربية)", child: Text("الباب الرابع (الكيمياء الكهربية)")),
                              DropdownMenuItem(value: "الباب الخامس (الكيمياء العضوية)", child: Text("الباب الخامس (الكيمياء العضوية)")),
                            ],
                            onChanged: (val) {
                              setState(() => selectedPart = val);
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Content Type Dropdown
                      const Text(
                        "نوع المحتوى",
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<bool>(
                            value: isSingleVideo,
                            isExpanded: true,
                            items: const [
                              DropdownMenuItem(value: false, child: Text("قائمة فيديوهات (كورس كامل)")),
                              DropdownMenuItem(value: true, child: Text("فيديو واحد (محاضرة منفردة)")),
                            ],
                            onChanged: (val) {
                              if (val != null) {
                                setState(() => isSingleVideo = val);
                              }
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // General Video Switch/Checkbox
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "عرض كفيديو عام للجميع في الرئيسية",
                            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                          Switch(
                            value: isGeneral,
                            onChanged: (val) {
                              setState(() => isGeneral = val);
                            },
                            activeTrackColor: const Color(0xFF2F6BFF).withValues(alpha: 0.5),
                            activeThumbColor: const Color(0xFF2F6BFF),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // Google Drive Video Link (Required if Single Video or General Video)
                      if (isSingleVideo || isGeneral) ...[
                        TextField(
                          controller: driveLinkController,
                          textDirection: TextDirection.ltr,
                          decoration: InputDecoration(
                            labelText: "رابط فيديو Google Drive",
                            hintText: "https://drive.google.com/...",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                            prefixIcon: const Icon(Icons.link, color: Color(0xFF1976D2)),
                          ),
                        ),
                        const SizedBox(height: 12),
                      ],
                      const SizedBox(height: 10),

                      // Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () => Get.back(),
                            child: const Text("إلغاء", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {
                              final title = titleController.text.trim();
                              final link = driveLinkController.text.trim();

                              if (title.isEmpty || selectedBatch == null || selectedPart == null) {
                                Get.snackbar(
                                  "خطأ",
                                  "يرجى ملء جميع الحقول المطلوبة واختيار الدفعة والجزء",
                                  backgroundColor: Colors.red.withValues(alpha: 0.9),
                                  colorText: Colors.white,
                                );
                                return;
                              }

                              if ((isSingleVideo || isGeneral) && link.isEmpty) {
                                Get.snackbar(
                                  "خطأ",
                                  "يرجى إدخال رابط فيديو جوجل درايف",
                                  backgroundColor: Colors.red.withValues(alpha: 0.9),
                                  colorText: Colors.white,
                                );
                                return;
                              }

                              if (link.isNotEmpty && !link.contains("drive.google.com")) {
                                Get.snackbar(
                                  "رابط غير صالح",
                                  "يرجى وضع رابط مشاركة صحيح من Google Drive للفيديو",
                                  backgroundColor: Colors.amber.withValues(alpha: 0.9),
                                  colorText: Colors.white,
                                );
                                return;
                              }

                              // If it is marked as general, insert into StudentHomeController's list
                              if (isGeneral) {
                                final genId = "GEN-${GeneralVideosState.generalVideos.length + 101}";
                                final newGenVideo = GeneralVideoModel(
                                  id: genId,
                                  title: title,
                                  stage: selectedBatch!,
                                  part: selectedPart!,
                                  videoUrl: link,
                                );
                                GeneralVideosState.generalVideos.insert(0, newGenVideo);
                              }

                              // Create new course model
                              final newId = "CH-${state.value.courses.length + 301}";
                              final contentTypeText = isSingleVideo ? "فيديو فردي" : "قائمة فيديوهات";
                              final newCourse = CourseModel(
                                id: newId,
                                title: title,
                                stage: "$selectedBatch - $selectedPart ($contentTypeText)",
                                videosCount: isSingleVideo ? 1 : 0,
                                publishDate: DateTime.now(),
                                coverUrl: "",
                                isActive: true,
                                durationHours: isSingleVideo ? 1 : 0,
                                price: 0,
                                views: 0,
                                enrolled: 0,
                              );

                              // Add to GetX state (forces reactive update of the view)
                              final updatedList = List<CourseModel>.from(state.value.courses)..insert(0, newCourse);
                              state.value = state.value.copyWith(courses: updatedList);

                              Get.back(); // Close Dialog
                              Get.snackbar(
                                "تم إنشاء الكورس بنجاح",
                                "تم إنشاء كورس/فيديو '$title' للدفعة '$selectedBatch' بنجاح.",
                                backgroundColor: const Color(0xFF4CAF50).withValues(alpha: 0.9),
                                colorText: Colors.white,
                                duration: const Duration(seconds: 4),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF2F6BFF),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                            child: const Text("تأكيد الإنشاء", style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
