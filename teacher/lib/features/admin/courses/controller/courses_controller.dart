import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../state/courses_state.dart';
import 'package:student/Student/Student_home/controller/Student_home_controller.dart';

class CoursesController extends GetxController {
  final Rx<CoursesState> state = CoursesState.initial.obs;

  @override
  void onInit() {
    super.onInit();
    _seedCourses();
  }

  void _seedCourses() {
    final items = <ContentModel>[
      ContentModel(
        id: "CH-301",
        title: "شرح الباب الأول في الكيمياء",
        contentType: "كورسات",
        subject: "الكيمياء",
        stage: "الصف الثالث الثانوي",
        batches: const ["Third Secondary 2026", "Third Secondary 2027"],
        sourceType: "Upload Video",
        videosCount: 8,
        duration: "06:00:00",
        publishDate: DateTime(2025, 1, 16),
        isActive: true,
        views: 320,
        enrolled: 350,
      ),
      ContentModel(
        id: "VID-302",
        title: "مقدمة الكيمياء التحليلية",
        contentType: "فيديو مستقل",
        subject: "الكيمياء",
        stage: "الصف الثالث الثانوي",
        batches: const ["Third Secondary 2026"],
        sourceType: "Google Drive",
        videoUrl: "https://drive.google.com/file/d/sample/view",
        duration: "02:15:00",
        publishDate: DateTime(2025, 1, 16),
        isActive: true,
        views: 240,
        enrolled: 180,
      ),
      ContentModel(
        id: "REV-303",
        title: "مراجعة شاملة ليلة الامتحان",
        contentType: "مراجعات",
        subject: "الكيمياء",
        stage: "الصف الثالث الثانوي",
        batches: const ["Third Secondary 2026", "Third Secondary 2027"],
        sourceType: "YouTube",
        videoUrl: "https://youtube.com/watch?v=sample",
        duration: "03:45:00",
        publishDate: DateTime(2025, 1, 17),
        isActive: true,
        views: 890,
        enrolled: 760,
      ),
      ContentModel(
        id: "PDF-304",
        title: "ملخص الباب الأول كيمياء عضوية",
        contentType: "PDF",
        subject: "الكيمياء",
        stage: "الصف الثاني الثانوي",
        batches: const ["Second Secondary"],
        sourceType: "PDF",
        videoUrl: "https://drive.google.com/file/d/pdf_sample/view",
        publishDate: DateTime(2025, 1, 15),
        isActive: true,
        views: 120,
        enrolled: 90,
      ),
      ContentModel(
        id: "TST-305",
        title: "اختبار الباب الأول التفاعلات الكيميائية",
        contentType: "اختبارات",
        subject: "الكيمياء",
        stage: "الصف الثالث الثانوي",
        batches: const ["Third Secondary 2026"],
        sourceType: "PDF",
        publishDate: DateTime(2025, 1, 14),
        isActive: true,
        views: 450,
        enrolled: 400,
      ),
    ];

    state.value = state.value.copyWith(courses: items);
  }

  // ----------------------------------------------------
  // Statistics Calculations
  // ----------------------------------------------------
  int get coursesCount => state.value.courses.where((c) => c.contentType == "كورسات").length;
  int get videosCount => state.value.courses.where((c) => c.contentType == "فيديو مستقل" || c.contentType == "مراجعات" || c.contentType == "حل امتحانات" || c.contentType == "حل واجبات").length;
  int get testsCount => state.value.courses.where((c) => c.contentType == "اختبارات").length;
  int get pdfsCount => state.value.courses.where((c) => c.contentType == "PDF" || c.contentType == "ملخصات").length;
  int get homeCount => state.value.courses.where((c) => c.showInHome).length;

  // ----------------------------------------------------
  // Search & Filter Setters
  // ----------------------------------------------------
  void setQuery(String q) {
    state.value = state.value.copyWith(query: q);
  }

  void setFilterType(String type) {
    state.value = state.value.copyWith(selectedType: type);
  }

  void setFilterSubject(String sub) {
    state.value = state.value.copyWith(selectedSubject: sub);
  }

  void setFilterBatch(String batch) {
    state.value = state.value.copyWith(selectedBatch: batch);
  }

  void setFilterStage(String stage) {
    state.value = state.value.copyWith(selectedStage: stage);
  }

  void setFilterStatus(String status) {
    state.value = state.value.copyWith(selectedStatus: status);
  }

  List<ContentModel> get filteredCourses {
    final query = state.value.query.trim().toLowerCase();
    final type = state.value.selectedType;
    final subject = state.value.selectedSubject;
    final batch = state.value.selectedBatch;
    final stage = state.value.selectedStage;
    final status = state.value.selectedStatus;

    return state.value.courses.where((c) {
      // 1. Search Query
      if (query.isNotEmpty) {
        final matchesQuery = c.title.toLowerCase().contains(query) ||
            c.subject.toLowerCase().contains(query) ||
            c.stage.toLowerCase().contains(query);
        if (!matchesQuery) return false;
      }

      // 2. Type Filter
      if (type != "الكل") {
        if (type == "الصفحة الرئيسية") {
          if (!c.showInHome) return false;
        } else {
          if (c.contentType != type) return false;
        }
      }

      // 3. Subject Filter
      if (subject != "الكل") {
        if (c.subject != subject) return false;
      }

      // 4. Batch Filter
      if (batch != "الكل") {
        if (!c.batches.contains(batch)) return false;
      }

      // 5. Stage Filter
      if (stage != "الكل") {
        if (c.stage != stage) return false;
      }

      // 6. Status Filter
      if (status != "الكل") {
        final isPublished = c.isAvailableForStudents;
        if (status == "منشور" && !isPublished) return false;
        if (status == "مسودة" && isPublished) return false;
      }

      return true;
    }).toList();
  }

  void openDetails(ContentModel content) {
    Get.toNamed('/home_admin/courses/details', arguments: content);
  }

  // ----------------------------------------------------
  // Actions
  // ----------------------------------------------------
  void previewCourse(ContentModel content) {
    Get.snackbar("معاينة", "معاينة المحتوى: ${content.title}");
  }

  void changeStatus(ContentModel content) {
    final updated = ContentModel(
      id: content.id,
      title: content.title,
      description: content.description,
      contentType: content.contentType,
      subject: content.subject,
      stage: content.stage,
      batches: content.batches,
      sourceType: content.sourceType,
      videoUrl: content.videoUrl,
      belongsToCourse: content.belongsToCourse,
      courseName: content.courseName,
      sectionName: content.sectionName,
      videosCount: content.videosCount,
      duration: content.duration,
      coverUrl: content.coverUrl,
      showInHome: content.showInHome,
      isAvailableForStudents: !content.isAvailableForStudents, // Toggle status
      isFree: content.isFree,
      requiresSubscription: content.requiresSubscription,
      publishDate: content.publishDate,
      views: content.views,
      enrolled: content.enrolled,
      isActive: content.isActive,
    );

    final idx = state.value.courses.indexWhere((c) => c.id == content.id);
    if (idx != -1) {
      final updatedList = List<ContentModel>.from(state.value.courses)..[idx] = updated;
      state.value = state.value.copyWith(courses: updatedList);
      Get.snackbar("تحديث", "تم تغيير حالة النشر بنجاح.");
    }
  }

  void hideContent(ContentModel content) {
    final updated = ContentModel(
      id: content.id,
      title: content.title,
      description: content.description,
      contentType: content.contentType,
      subject: content.subject,
      stage: content.stage,
      batches: content.batches,
      sourceType: content.sourceType,
      videoUrl: content.videoUrl,
      belongsToCourse: content.belongsToCourse,
      courseName: content.courseName,
      sectionName: content.sectionName,
      videosCount: content.videosCount,
      duration: content.duration,
      coverUrl: content.coverUrl,
      showInHome: content.showInHome,
      isAvailableForStudents: content.isAvailableForStudents,
      isFree: content.isFree,
      requiresSubscription: content.requiresSubscription,
      publishDate: content.publishDate,
      views: content.views,
      enrolled: content.enrolled,
      isActive: !content.isActive, // Toggle visibility
    );

    final idx = state.value.courses.indexWhere((c) => c.id == content.id);
    if (idx != -1) {
      final updatedList = List<ContentModel>.from(state.value.courses)..[idx] = updated;
      state.value = state.value.copyWith(courses: updatedList);
      Get.snackbar("تحديث", content.isActive ? "تم إخفاء المحتوى عن العرض." : "تم إظهار المحتوى للعرض.");
    }
  }

  void deleteContent(ContentModel content) {
    final updatedList = List<ContentModel>.from(state.value.courses)..removeWhere((c) => c.id == content.id);
    state.value = state.value.copyWith(courses: updatedList);
    Get.snackbar("حذف", "تم حذف المحتوى بنجاح.", backgroundColor: Colors.red.withValues(alpha: 0.9), colorText: Colors.white);
  }

  void copyContent(ContentModel content) {
    final copy = ContentModel(
      id: "${content.id}-COPY",
      title: "${content.title} - نسخة",
      description: content.description,
      contentType: content.contentType,
      subject: content.subject,
      stage: content.stage,
      batches: content.batches,
      sourceType: content.sourceType,
      videoUrl: content.videoUrl,
      belongsToCourse: content.belongsToCourse,
      courseName: content.courseName,
      sectionName: content.sectionName,
      videosCount: content.videosCount,
      duration: content.duration,
      coverUrl: content.coverUrl,
      showInHome: content.showInHome,
      isAvailableForStudents: content.isAvailableForStudents,
      isFree: content.isFree,
      requiresSubscription: content.requiresSubscription,
      publishDate: DateTime.now(),
      views: 0,
      enrolled: 0,
      isActive: content.isActive,
    );

    final updatedList = List<ContentModel>.from(state.value.courses)..insert(0, copy);
    state.value = state.value.copyWith(courses: updatedList);
    Get.snackbar("نسخ", "تم تكرار المحتوى بنجاح.");
  }

  void changeBatches(ContentModel content) {
    final allBatches = ["Third Secondary 2026", "Third Secondary 2027", "Second Secondary", "First Secondary"];
    final selected = List<String>.from(content.batches);

    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: StatefulBuilder(
              builder: (context, setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "تعديل الدفعات المستهدفة",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    ...allBatches.map((b) {
                      return CheckboxListTile(
                        title: Text(b),
                        value: selected.contains(b),
                        onChanged: (val) {
                          setState(() {
                            if (val == true) {
                              selected.add(b);
                            } else {
                              selected.remove(b);
                            }
                          });
                        },
                      );
                    }),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => Get.back(),
                          child: const Text("إلغاء"),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {
                            final updated = ContentModel(
                              id: content.id,
                              title: content.title,
                              description: content.description,
                              contentType: content.contentType,
                              subject: content.subject,
                              stage: content.stage,
                              batches: selected,
                              sourceType: content.sourceType,
                              videoUrl: content.videoUrl,
                              belongsToCourse: content.belongsToCourse,
                              courseName: content.courseName,
                              sectionName: content.sectionName,
                              videosCount: content.videosCount,
                              duration: content.duration,
                              coverUrl: content.coverUrl,
                              showInHome: content.showInHome,
                              isAvailableForStudents: content.isAvailableForStudents,
                              isFree: content.isFree,
                              requiresSubscription: content.requiresSubscription,
                              publishDate: content.publishDate,
                              views: content.views,
                              enrolled: content.enrolled,
                              isActive: content.isActive,
                            );

                            final idx = state.value.courses.indexWhere((c) => c.id == content.id);
                            if (idx != -1) {
                              final updatedList = List<ContentModel>.from(state.value.courses)..[idx] = updated;
                              state.value = state.value.copyWith(courses: updatedList);
                            }
                            Get.back();
                            Get.snackbar("تحديث", "تم تحديث الدفعات المستهدفة بنجاح.");
                          },
                          child: const Text("حفظ"),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void assignVideoListToBatch() {
    String? selectedCourseId;
    String? selectedBatch;

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
                          const Icon(Icons.share_outlined, color: Color(0xFF7C3AED), size: 28),
                          const SizedBox(width: 10),
                          const Text(
                            "إسناد المحتوى لدفعة",
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "اختر المحتوى التعليمي، وحدد الدفعة الدراسية التي ترغب في إسناده إليها.",
                        style: TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                      const SizedBox(height: 16),

                      const Text("اختر المحتوى/الكورس", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
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
                            hint: const Text("اختر من القائمة المتاحة"),
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

                      const Text("اختر الدفعة المستهدفة", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
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
                              DropdownMenuItem(value: "Third Secondary 2026", child: Text("Third Secondary 2026")),
                              DropdownMenuItem(value: "Third Secondary 2027", child: Text("Third Secondary 2027")),
                              DropdownMenuItem(value: "Second Secondary", child: Text("Second Secondary")),
                              DropdownMenuItem(value: "First Secondary", child: Text("First Secondary")),
                            ],
                            onChanged: (val) {
                              setState(() => selectedBatch = val);
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

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
                                Get.snackbar("خطأ", "يرجى اختيار المحتوى والدفعة الدراسية", backgroundColor: Colors.red.withValues(alpha: 0.9), colorText: Colors.white);
                                return;
                              }

                              final item = state.value.courses.firstWhere((c) => c.id == selectedCourseId);
                              if (!item.batches.contains(selectedBatch!)) {
                                final updatedBatches = List<String>.from(item.batches)..add(selectedBatch!);
                                final updated = ContentModel(
                                  id: item.id,
                                  title: item.title,
                                  description: item.description,
                                  contentType: item.contentType,
                                  subject: item.subject,
                                  stage: item.stage,
                                  batches: updatedBatches,
                                  sourceType: item.sourceType,
                                  videoUrl: item.videoUrl,
                                  belongsToCourse: item.belongsToCourse,
                                  courseName: item.courseName,
                                  sectionName: item.sectionName,
                                  videosCount: item.videosCount,
                                  duration: item.duration,
                                  coverUrl: item.coverUrl,
                                  showInHome: item.showInHome,
                                  isAvailableForStudents: item.isAvailableForStudents,
                                  isFree: item.isFree,
                                  requiresSubscription: item.requiresSubscription,
                                  publishDate: item.publishDate,
                                  views: item.views,
                                  enrolled: item.enrolled,
                                  isActive: item.isActive,
                                );
                                final idx = state.value.courses.indexWhere((c) => c.id == item.id);
                                if (idx != -1) {
                                  final updatedList = List<ContentModel>.from(state.value.courses)..[idx] = updated;
                                  state.value = state.value.copyWith(courses: updatedList);
                                }
                              }

                              Get.back();
                              Get.snackbar("تم الإسناد بنجاح", "تم إسناد المحتوى '${item.title}' لدفعة '$selectedBatch' بنجاح.");
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF7C3AED),
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

  void uploadVideoFromGoogleDrive(ContentModel content) {
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
                  
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      labelText: "عنوان الفيديو",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  const SizedBox(height: 12),

                  TextField(
                    controller: descController,
                    decoration: InputDecoration(
                      labelText: "وصف الفيديو",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  const SizedBox(height: 12),

                  TextField(
                    controller: linkController,
                    textDirection: TextDirection.ltr,
                    decoration: InputDecoration(
                      labelText: "رابط فيديو Google Drive",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      prefixIcon: const Icon(Icons.link, color: Color(0xFF1976D2)),
                    ),
                  ),
                  const SizedBox(height: 12),

                  TextField(
                    controller: durationController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "مدة الفيديو (بالدقائق)",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  const SizedBox(height: 20),

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
                            Get.snackbar("خطأ", "يرجى إدخال البيانات المطلوبة", backgroundColor: Colors.red.withValues(alpha: 0.9), colorText: Colors.white);
                            return;
                          }

                          if (!link.contains("drive.google.com")) {
                            Get.snackbar("رابط غير صالح", "يرجى إدخال رابط جوجل درايف صحيح", backgroundColor: Colors.amber.withValues(alpha: 0.9), colorText: Colors.white);
                            return;
                          }

                          Get.back();
                          Get.snackbar("تم الرفع بنجاح", "تم إضافة فيديو '$title' من Google Drive بنجاح.");
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

  // ----------------------------------------------------
  // Interactive Form: Create/Edit content
  // ----------------------------------------------------
  void openContentForm({ContentModel? existingItem}) {
    final titleController = TextEditingController(text: existingItem?.title);
    final descController = TextEditingController(text: existingItem?.description);
    final videoUrlController = TextEditingController(text: existingItem?.videoUrl);
    final durationController = TextEditingController(text: existingItem?.duration ?? "02:15:00");

    String selectedType = existingItem?.contentType ?? "كورسات";
    String selectedSubject = existingItem?.subject ?? "الكيمياء";
    String selectedStage = existingItem?.stage ?? "الصف الثالث الثانوي";
    String selectedSource = existingItem?.sourceType ?? "Google Drive";

    bool belongsToCourse = existingItem?.belongsToCourse ?? false;
    String selectedCourseName = existingItem?.courseName ?? "شرح الكيمياء";
    String selectedSectionName = existingItem?.sectionName ?? "الباب الأول";

    List<String> selectedBatches = existingItem != null ? List<String>.from(existingItem.batches) : ["Third Secondary 2026"];

    bool showInHome = existingItem?.showInHome ?? false;
    bool isAvailable = existingItem?.isAvailableForStudents ?? true;
    bool isFree = existingItem?.isFree ?? false;
    bool requiresSub = existingItem?.requiresSubscription ?? true;

    final contentTypes = [
      "كورسات",
      "فيديو مستقل",
      "مراجعات",
      "ملخصات",
      "حل امتحانات",
      "حل واجبات",
      "اختبارات",
      "PDF",
      "فيديو الصفحة الرئيسية"
    ];

    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: StatefulBuilder(
              builder: (context, setState) {
                final showLinkField = selectedSource != "Upload Video" && selectedType != "كورسات";

                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Icon(existingItem == null ? Icons.add_box_outlined : Icons.edit_outlined, color: const Color(0xFF2563EB), size: 28),
                          const SizedBox(width: 10),
                          Text(
                            existingItem == null ? "إضافة محتوى تعليمي جديد" : "تعديل المحتوى التعليمي",
                            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Divider(height: 1, color: Color(0xFFE6E8F0)),
                      const SizedBox(height: 16),

                      const Text("نوع المحتوى", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade400), borderRadius: BorderRadius.circular(10)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedType,
                            isExpanded: true,
                            items: contentTypes.map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(),
                            onChanged: (val) {
                              if (val != null) setState(() => selectedType = val);
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      TextField(
                        controller: titleController,
                        decoration: InputDecoration(
                          labelText: "عنوان المحتوى",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: descController,
                        maxLines: 2,
                        decoration: InputDecoration(
                          labelText: "وصف المحتوى",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(height: 12),

                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("المادة", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                                const SizedBox(height: 6),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade400), borderRadius: BorderRadius.circular(10)),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: selectedSubject,
                                      isExpanded: true,
                                      items: const [
                                        DropdownMenuItem(value: "الكيمياء", child: Text("الكيمياء")),
                                        DropdownMenuItem(value: "الفيزياء", child: Text("الفيزياء")),
                                        DropdownMenuItem(value: "الأحياء", child: Text("الأحياء")),
                                      ],
                                      onChanged: (val) {
                                        if (val != null) setState(() => selectedSubject = val);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("الصف الدراسي", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                                const SizedBox(height: 6),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade400), borderRadius: BorderRadius.circular(10)),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: selectedStage,
                                      isExpanded: true,
                                      items: const [
                                        DropdownMenuItem(value: "الصف الأول الثانوي", child: Text("الصف الأول الثانوي")),
                                        DropdownMenuItem(value: "الصف الثاني الثانوي", child: Text("الصف الثاني الثانوي")),
                                        DropdownMenuItem(value: "الصف الثالث الثانوي", child: Text("الصف الثالث الثانوي")),
                                      ],
                                      onChanged: (val) {
                                        if (val != null) setState(() => selectedStage = val);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      if (selectedType != "كورسات") ...[
                        Row(
                          children: [
                            Checkbox(
                              value: belongsToCourse,
                              onChanged: (val) {
                                setState(() => belongsToCourse = val ?? false);
                              },
                            ),
                            const Text("هل يتبع كورس / قائمة معينة؟", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        if (belongsToCourse) ...[
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("اختر الكورس", style: TextStyle(fontSize: 12, color: Colors.black54)),
                                    const SizedBox(height: 4),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                      decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade400), borderRadius: BorderRadius.circular(10)),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          value: selectedCourseName,
                                          isExpanded: true,
                                          items: const [
                                            DropdownMenuItem(value: "شرح الكيمياء", child: Text("شرح الكيمياء")),
                                            DropdownMenuItem(value: "كورس الباب الأول", child: Text("كورس الباب الأول")),
                                          ],
                                          onChanged: (val) {
                                            if (val != null) setState(() => selectedCourseName = val);
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("اختر القسم", style: TextStyle(fontSize: 12, color: Colors.black54)),
                                    const SizedBox(height: 4),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                      decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade400), borderRadius: BorderRadius.circular(10)),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          value: selectedSectionName,
                                          isExpanded: true,
                                          items: const [
                                            DropdownMenuItem(value: "الباب الأول", child: Text("الباب الأول")),
                                            DropdownMenuItem(value: "الباب الثاني", child: Text("الباب الثاني")),
                                          ],
                                          onChanged: (val) {
                                            if (val != null) setState(() => selectedSectionName = val);
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                        ],
                      ],

                      const Text("الدفعات المستهدفة", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 6),
                      Wrap(
                        spacing: 8,
                        children: ["Third Secondary 2026", "Third Secondary 2027", "Second Secondary", "First Secondary"].map((b) {
                          final isSelected = selectedBatches.contains(b);
                          return FilterChip(
                            label: Text(b, style: TextStyle(fontSize: 11, color: isSelected ? Colors.white : Colors.black)),
                            selected: isSelected,
                            selectedColor: const Color(0xFF2563EB),
                            checkmarkColor: Colors.white,
                            onSelected: (val) {
                              setState(() {
                                if (val) {
                                  selectedBatches.add(b);
                                } else {
                                  selectedBatches.remove(b);
                                }
                              });
                            },
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 12),

                      const Text("مصدر المحتوى", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade400), borderRadius: BorderRadius.circular(10)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedSource,
                            isExpanded: true,
                            items: const [
                              DropdownMenuItem(value: "Upload Video", child: Text("Upload Video (رفع فيديو مباشرة)")),
                              DropdownMenuItem(value: "YouTube", child: Text("YouTube")),
                              DropdownMenuItem(value: "Google Drive", child: Text("Google Drive")),
                              DropdownMenuItem(value: "PDF", child: Text("PDF File")),
                            ],
                            onChanged: (val) {
                              if (val != null) setState(() => selectedSource = val);
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      if (showLinkField) ...[
                        TextField(
                          controller: videoUrlController,
                          textDirection: TextDirection.ltr,
                          decoration: InputDecoration(
                            labelText: "رابط المحتوى (URL)",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        const SizedBox(height: 12),
                      ],

                      if (selectedType != "كورسات" && selectedType != "PDF") ...[
                        TextField(
                          controller: durationController,
                          decoration: InputDecoration(
                            labelText: "مدة الفيديو (ساعة:دقيقة:ثانية)",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        const SizedBox(height: 12),
                      ],

                      const Text("خيارات العرض والنشر", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 6),
                      CheckboxListTile(
                        title: const Text("يظهر في الصفحة الرئيسية للطلاب"),
                        value: showInHome,
                        dense: true,
                        onChanged: (val) => setState(() => showInHome = val ?? false),
                      ),
                      CheckboxListTile(
                        title: const Text("متاح للطلاب (نشط)"),
                        value: isAvailable,
                        dense: true,
                        onChanged: (val) => setState(() => isAvailable = val ?? true),
                      ),
                      CheckboxListTile(
                        title: const Text("محتوى مجاني"),
                        value: isFree,
                        dense: true,
                        onChanged: (val) => setState(() => isFree = val ?? false),
                      ),
                      CheckboxListTile(
                        title: const Text("يتطلب اشتراك"),
                        value: requiresSub,
                        dense: true,
                        onChanged: (val) => setState(() => requiresSub = val ?? true),
                      ),
                      const SizedBox(height: 20),

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
                              if (title.isEmpty) {
                                Get.snackbar("خطأ", "يرجى إدخال عنوان المحتوى", backgroundColor: Colors.red.withValues(alpha: 0.9), colorText: Colors.white);
                                return;
                              }

                              if (showInHome && videoUrlController.text.trim().isNotEmpty) {
                                final genId = "GEN-${GeneralVideosState.generalVideos.length + 101}";
                                final newGenVideo = GeneralVideoModel(
                                  id: genId,
                                  title: title,
                                  stage: selectedStage,
                                  part: selectedSubject,
                                  videoUrl: videoUrlController.text.trim(),
                                );
                                if (!GeneralVideosState.generalVideos.any((v) => v.videoUrl == newGenVideo.videoUrl)) {
                                  GeneralVideosState.generalVideos.insert(0, newGenVideo);
                                }
                              }

                              final newItem = ContentModel(
                                id: existingItem?.id ?? "CON-${state.value.courses.length + 301}",
                                title: title,
                                description: descController.text.trim(),
                                contentType: selectedType,
                                subject: selectedSubject,
                                stage: selectedStage,
                                batches: selectedBatches,
                                sourceType: selectedSource,
                                videoUrl: videoUrlController.text.trim(),
                                belongsToCourse: belongsToCourse,
                                courseName: belongsToCourse ? selectedCourseName : null,
                                sectionName: belongsToCourse ? selectedSectionName : null,
                                videosCount: selectedType == "كورسات" ? 8 : 0,
                                duration: durationController.text.trim(),
                                coverUrl: existingItem?.coverUrl ?? "",
                                showInHome: showInHome,
                                isAvailableForStudents: isAvailable,
                                isFree: isFree,
                                requiresSubscription: requiresSub,
                                publishDate: existingItem?.publishDate ?? DateTime.now(),
                                views: existingItem?.views ?? 0,
                                enrolled: existingItem?.enrolled ?? 0,
                                isActive: existingItem?.isActive ?? true,
                              );

                              final updatedList = List<ContentModel>.from(state.value.courses);
                              if (existingItem != null) {
                                final idx = updatedList.indexWhere((c) => c.id == existingItem.id);
                                if (idx != -1) updatedList[idx] = newItem;
                              } else {
                                updatedList.insert(0, newItem);
                              }

                              state.value = state.value.copyWith(courses: updatedList);
                              Get.back();
                              Get.snackbar(
                                "نجاح",
                                existingItem == null ? "تم إضافة المحتوى بنجاح." : "تم تحديث المحتوى بنجاح.",
                                backgroundColor: const Color(0xFF4CAF50).withValues(alpha: 0.9),
                                colorText: Colors.white,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF2563EB),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                            child: Text(existingItem == null ? "حفظ" : "تحديث", style: const TextStyle(fontWeight: FontWeight.bold)),
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
