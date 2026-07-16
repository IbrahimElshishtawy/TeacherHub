import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../state/exams_rr_state.dart';

class ExamsRRController extends GetxController {
  final Rx<ExamsRRState> state = ExamsRRState.initial.obs;

  @override
  void onInit() {
    super.onInit();
    _seedData();
  }

  void _seedData() {
    // 1. Mock Questions
    final mockQuestions = [
      const QuestionModel(
        id: "Q-1",
        text: "ما هو الاسم الكيميائي الصحيح للمركب العضوي CH3-CH2-CH3 بحسب نظام الأيوباك؟",
        type: "اختيار من متعدد",
        options: ["ميثان", "إيثان", "بروبان", "بيوتان"],
        correctAnswer: "بروبان",
        difficulty: "سهل",
        marks: 2,
      ),
      const QuestionModel(
        id: "Q-2",
        text: "تتكون الرابطة التساهمية الأحادية في الألكانات من نوع سيجما القوية وصعبة الكسر.",
        type: "صواب وخطأ",
        options: ["صواب", "خطأ"],
        correctAnswer: "صواب",
        difficulty: "سهل",
        marks: 2,
      ),
      const QuestionModel(
        id: "Q-3",
        text: "اكتب معادلة تحضير غاز الميثان في المختبر بالتقطير الجاف مع التوضيح بالرسم وكتابة الشروط.",
        type: "مقالي",
        options: [],
        correctAnswer: "تفاعل أسيتات الصوديوم اللامائية مع الصودا الكاوية بالتسخين في وجود الجير الحي.",
        difficulty: "صعب",
        marks: 5,
      ),
      const QuestionModel(
        id: "Q-4",
        text: "تتميز الألكينات بوجود رابطة ثنائية بين ذرتي كربون وتحتوي على رابطة واحدة من النوع باي.",
        type: "إكمال الفراغ",
        options: [],
        correctAnswer: "باي",
        difficulty: "متوسط",
        marks: 3,
      ),
    ];

    // 2. Mock Exams
    final exams = [
      const ExamModel(
        id: "EX-301",
        name: "اختبار الكيمياء العضوية الشامل",
        subject: "الكيمياء",
        grade: "الصف الثالث الثانوي",
        batch: "Third Secondary 2026",
        chapter: "الباب الخامس",
        lesson: "العضوية كاملة",
        type: "امتحان شهري",
        questionCount: 20,
        totalMarks: 40,
        durationMinutes: 60,
        availableFrom: "2026/07/15 08:00 ص",
        availableUntil: "2026/07/20 10:00 م",
        studentsAssignedCount: 150,
        submissionCount: 120,
        avgScore: 32.5,
        status: "نشط",
      ),
      const ExamModel(
        id: "EX-302",
        name: "واجب تسمية الألكانات والألكينات",
        subject: "الكيمياء",
        grade: "الصف الثالث الثانوي",
        batch: "Third Secondary 2026",
        chapter: "الباب الخامس",
        lesson: "تسمية المركبات العضوية",
        type: "الواجب",
        questionCount: 10,
        totalMarks: 10,
        durationMinutes: 20,
        availableFrom: "2026/07/16 12:00 ص",
        availableUntil: "2026/07/25 12:00 م",
        studentsAssignedCount: 150,
        submissionCount: 95,
        avgScore: 8.4,
        status: "نشط",
      ),
      const ExamModel(
        id: "EX-303",
        name: "امتحان شامل الباب الأول والباب الثاني",
        subject: "الكيمياء",
        grade: "الصف الثالث الثانوي",
        batch: "Third Secondary 2027",
        chapter: "الباب الأول والثاني",
        lesson: "مراجعة العناصر والتحليل",
        type: "امتحان نهائي",
        questionCount: 30,
        totalMarks: 60,
        durationMinutes: 90,
        availableFrom: "2026/08/01 09:00 ص",
        availableUntil: "2026/08/02 09:00 م",
        studentsAssignedCount: 120,
        submissionCount: 0,
        avgScore: 0.0,
        status: "مجدول",
      ),
      const ExamModel(
        id: "EX-304",
        name: "Quiz الكيمياء الحرارية السريع",
        subject: "الكيمياء",
        grade: "الصف الأول الثانوي",
        batch: "First Secondary",
        chapter: "الباب الرابع",
        lesson: "المحتوى الحراري",
        type: "Quiz",
        questionCount: 5,
        totalMarks: 10,
        durationMinutes: 15,
        availableFrom: "2026/06/10 08:00 ص",
        availableUntil: "2026/06/11 08:00 م",
        studentsAssignedCount: 80,
        submissionCount: 78,
        avgScore: 7.9,
        status: "منتهي",
      ),
    ];

    // 3. Mock Review Packages
    final reviews = [
      const ReviewPackageModel(
        id: "REV-401",
        title: "مراجعة الكيمياء العضوية المكثفة",
        subject: "الكيمياء",
        batch: "Third Secondary 2026",
        chapter: "الباب الخامس",
        lesson: "العضوية كاملة",
        videoUrl: "https://www.youtube.com/watch?v=mock1",
        pdfNotesName: "ملخص_العضوية_الذهبي.pdf",
        summary: "مراجعة كاملة تشمل شرحاً تفصيلياً لكافة التفاعلات وتسمية الأيوباك مع حل 50 سؤالاً هماً من امتحانات الوزارة السابقة.",
        assignmentsCount: 2,
        practiceQuestionsCount: 20,
        examTitle: "اختبار الكيمياء العضوية الشامل",
        attachments: ["ملخص_العضوية.pdf", "خريطة_التفاعلات_والتحويلات.pdf", "سؤال_وجواب.pdf"],
      ),
      const ReviewPackageModel(
        id: "REV-402",
        title: "مراجعة الباب الأول: العناصر الانتقالية",
        subject: "الكيمياء",
        batch: "Third Secondary 2026",
        chapter: "الباب الأول",
        lesson: "الحديد والسبائك",
        videoUrl: "https://www.youtube.com/watch?v=mock2",
        pdfNotesName: "عناصر_انتقالية_شرح.pdf",
        summary: "شرح مبسط لخواص الحديد الفيزيائية والكيميائية وطرق استخلاصه من خاماته بالإضافة إلى مقارنة شاملة للسبائك.",
        assignmentsCount: 1,
        practiceQuestionsCount: 15,
        examTitle: "اختبار الحديد والسبائك السريع",
        attachments: ["أنواع_السبائك_مخطط.pdf", "شرح_خامات_الحديد.pdf"],
      ),
    ];

    // 4. Mock Question folders
    final folders = [
      QuestionFolderModel(
        subject: "الكيمياء",
        chapter: "الباب الخامس: الكيمياء العضوية",
        lesson: "تسمية الألكانات والخواص العامة",
        questionCount: 80,
        easyCount: 25,
        mediumCount: 40,
        hardCount: 15,
        questions: mockQuestions,
      ),
      QuestionFolderModel(
        subject: "الكيمياء",
        chapter: "الباب الأول: العناصر الانتقالية",
        lesson: "خامات الحديد والسبائك",
        questionCount: 55,
        easyCount: 20,
        mediumCount: 25,
        hardCount: 10,
        questions: mockQuestions.sublist(0, 2),
      ),
    ];

    // 5. Mock Student Results and breakdown analysis
    final qAnalysesST101 = [
      const QuestionAnalysisModel(
        questionText: "ما هو الاسم الكيميائي الصحيح للمركب العضوي CH3-CH2-CH3 بحسب نظام الأيوباك؟",
        studentAnswer: "بروبان",
        correctAnswer: "بروبان",
        marksObtained: 2,
        totalMarks: 2,
        timeSpentSeconds: 45,
        teacherNotes: "إجابة ممتازة وسريعة.",
      ),
      const QuestionAnalysisModel(
        questionText: "تتكون الرابطة التساهمية الأحادية في الألكانات من نوع سيجما القوية وصعبة الكسر.",
        studentAnswer: "صواب",
        correctAnswer: "صواب",
        marksObtained: 2,
        totalMarks: 2,
        timeSpentSeconds: 15,
        teacherNotes: "",
      ),
      const QuestionAnalysisModel(
        questionText: "اكتب معادلة تحضير غاز الميثان في المختبر بالتقطير الجاف مع التوضيح بالرسم وكتابة الشروط.",
        studentAnswer: "تفاعل أسيتات الصوديوم اللامائية مع الصودا الكاوية بالتسخين في وجود الجير الحي.",
        correctAnswer: "تفاعل أسيتات الصوديوم اللامائية مع الصودا الكاوية بالتسخين في وجود الجير الحي.",
        marksObtained: 4,
        totalMarks: 5,
        timeSpentSeconds: 180,
        teacherNotes: "الرسم يحتاج لدقة أكثر وتوضيح كتابة شروط الحرارة.",
      ),
    ];

    final qAnalysesST104 = [
      const QuestionAnalysisModel(
        questionText: "ما هو الاسم الكيميائي الصحيح للمركب العضوي CH3-CH2-CH3 بحسب نظام الأيوباك؟",
        studentAnswer: "بيوتان",
        correctAnswer: "بروبان",
        marksObtained: 0,
        totalMarks: 2,
        timeSpentSeconds: 90,
        teacherNotes: "راجع التسمية حسب عدد ذرات الكربون.",
      ),
      const QuestionAnalysisModel(
        questionText: "تتكون الرابطة التساهمية الأحادية في الألكانات من نوع سيجما القوية وصعبة الكسر.",
        studentAnswer: "صواب",
        correctAnswer: "صواب",
        marksObtained: 2,
        totalMarks: 2,
        timeSpentSeconds: 30,
        teacherNotes: "",
      ),
      const QuestionAnalysisModel(
        questionText: "اكتب معادلة تحضير غاز الميثان في المختبر بالتقطير الجاف مع التوضيح بالرسم وكتابة الشروط.",
        studentAnswer: "تفاعل أسيتات الصوديوم مع الجير الصودي فقط.",
        correctAnswer: "تفاعل أسيتات الصوديوم اللامائية مع الصودا الكاوية بالتسخين في وجود الجير الحي.",
        marksObtained: 1,
        totalMarks: 5,
        timeSpentSeconds: 240,
        teacherNotes: "لم يقم بالرسم أو ذكر الجير الحي كعامل حفاز يقلل درجة الانصهار.",
      ),
    ];

    final results = [
      StudentResultModel(
        studentId: "ST-101",
        studentName: "أحمد محمد كمال",
        batch: "Third Secondary 2026",
        examId: "EX-301",
        examName: "اختبار الكيمياء العضوية الشامل",
        submissionTime: "منذ ساعتين",
        durationMinutes: 45,
        score: 38,
        totalScore: 40,
        percentage: 95.0,
        rank: 2,
        isPassed: true,
        questionAnalyses: qAnalysesST101,
      ),
      StudentResultModel(
        studentId: "ST-103",
        studentName: "سارة محمود السيد",
        batch: "Third Secondary 2026",
        examId: "EX-301",
        examName: "اختبار الكيمياء العضوية الشامل",
        submissionTime: "منذ ساعة",
        durationMinutes: 42,
        score: 40,
        totalScore: 40,
        percentage: 100.0,
        rank: 1,
        isPassed: true,
        questionAnalyses: qAnalysesST101, // mock reuse
      ),
      StudentResultModel(
        studentId: "ST-102",
        studentName: "يوسف أحمد علي",
        batch: "Third Secondary 2026",
        examId: "EX-301",
        examName: "اختبار الكيمياء العضوية الشامل",
        submissionTime: "منذ 5 ساعات",
        durationMinutes: 55,
        score: 28,
        totalScore: 40,
        percentage: 70.0,
        rank: 45,
        isPassed: true,
        questionAnalyses: qAnalysesST101, // mock reuse
      ),
      StudentResultModel(
        studentId: "ST-104",
        studentName: "عمر خالد عبدالرحمن",
        batch: "Third Secondary 2026",
        examId: "EX-301",
        examName: "اختبار الكيمياء العضوية الشامل",
        submissionTime: "منذ يوم",
        durationMinutes: 60,
        score: 18,
        totalScore: 40,
        percentage: 45.0,
        rank: 110,
        isPassed: false,
        questionAnalyses: qAnalysesST104,
      ),
    ];

    state.value = state.value.copyWith(
      examsCount: exams.length,
      reviewsCount: reviews.length,
      resultsCount: results.length,
      questionBankCount: 135,
      exams: exams,
      reviewPackages: reviews,
      questionFolders: folders,
      studentResults: results,
    );
  }

  // ----------------------------------------------------
  // Stepper steps
  // ----------------------------------------------------
  void nextWizardStep() {
    if (state.value.wizardStep < 4) {
      state.value = state.value.copyWith(wizardStep: state.value.wizardStep + 1);
    }
  }

  void prevWizardStep() {
    if (state.value.wizardStep > 0) {
      state.value = state.value.copyWith(wizardStep: state.value.wizardStep - 1);
    }
  }

  void setWizardStep(int step) {
    state.value = state.value.copyWith(wizardStep: step);
  }

  void resetWizard() {
    state.value = state.value.copyWith(wizardStep: 0, tempWizardData: {});
  }

  void updateTempWizardData(String key, dynamic val) {
    final current = Map<String, dynamic>.from(state.value.tempWizardData);
    current[key] = val;
    state.value = state.value.copyWith(tempWizardData: current);
  }

  // ----------------------------------------------------
  // Exams Actions
  // ----------------------------------------------------
  void setExamQuery(String query) => state.value = state.value.copyWith(examQuery: query);
  void setExamBatch(String batch) => state.value = state.value.copyWith(selectedExamBatch: batch);
  void setExamType(String type) => state.value = state.value.copyWith(selectedExamType: type);
  void setExamStatus(String status) => state.value = state.value.copyWith(selectedExamStatus: status);

  List<ExamModel> get filteredExams {
    final query = state.value.examQuery.trim().toLowerCase();
    final batch = state.value.selectedExamBatch;
    final type = state.value.selectedExamType;
    final status = state.value.selectedExamStatus;

    return state.value.exams.where((e) {
      if (query.isNotEmpty && !e.name.toLowerCase().contains(query)) return false;
      if (batch != "الكل" && e.batch != batch) return false;
      if (type != "الكل" && e.type != type) return false;
      if (status != "الكل" && e.status != status) return false;
      return true;
    }).toList();
  }

  void duplicateExam(ExamModel exam) {
    final newId = "EX-${300 + state.value.exams.length + 1}";
    final duplicated = exam.copyWith(
      id: newId,
      name: "${exam.name} (نسخة مكررة)",
      submissionCount: 0,
      avgScore: 0.0,
    );
    final list = List<ExamModel>.from(state.value.exams)..add(duplicated);
    state.value = state.value.copyWith(exams: list, examsCount: list.length);
    Get.snackbar("تكرار الاختبار", "تم إنشاء نسخة مكررة من الاختبار بنجاح.");
  }

  void hideExam(ExamModel exam) {
    Get.snackbar("تحديث الحالة", "تم إخفاء الاختبار عن الطلاب بنجاح.");
  }

  void deleteExam(ExamModel exam) {
    final list = List<ExamModel>.from(state.value.exams)..removeWhere((e) => e.id == exam.id);
    state.value = state.value.copyWith(exams: list, examsCount: list.length);
    Get.snackbar("حذف الاختبار", "تم حذف الاختبار بنجاح من النظام.", backgroundColor: Colors.red, colorText: Colors.white);
  }

  void createNewExam(ExamModel newExam) {
    final list = List<ExamModel>.from(state.value.exams)..insert(0, newExam);
    state.value = state.value.copyWith(exams: list, examsCount: list.length);
    Get.snackbar("إنشاء اختبار", "تم إنشاء ونشر الاختبار بنجاح في الجدول الزمني.", backgroundColor: Colors.green, colorText: Colors.white);
  }

  // ----------------------------------------------------
  // Reviews Package Actions
  // ----------------------------------------------------
  void deleteReviewPackage(ReviewPackageModel package) {
    final list = List<ReviewPackageModel>.from(state.value.reviewPackages)..removeWhere((r) => r.id == package.id);
    state.value = state.value.copyWith(reviewPackages: list, reviewsCount: list.length);
    Get.snackbar("حذف حزمة مراجعة", "تم حذف الحزمة بنجاح.", backgroundColor: Colors.red, colorText: Colors.white);
  }

  void addReviewPackage(ReviewPackageModel package) {
    final list = List<ReviewPackageModel>.from(state.value.reviewPackages)..insert(0, package);
    state.value = state.value.copyWith(reviewPackages: list, reviewsCount: list.length);
    Get.snackbar("إضافة حزمة", "تم نشر حزمة المراجعة بنجاح للأبناء.");
  }

  // ----------------------------------------------------
  // Results & Reports Toggles & Analytics Actions
  // ----------------------------------------------------
  void toggleAutoReport(String key) {
    final reports = Map<String, bool>.from(state.value.enabledAutoReports);
    reports[key] = !(reports[key] ?? false);
    state.value = state.value.copyWith(enabledAutoReports: reports);
    Get.snackbar("تحديث التقارير التلقائية", "تم تعديل حالة الإرسال التلقائي للتقرير '$key'.");
  }

  void exportResults(String type) {
    Get.snackbar(
      "تصدير البيانات",
      "تم تصدير ملف نتائج الاختبار بصيغة ($type) وحفظه في مجلد التنزيلات بنجاح.",
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  void notifyBulk(String channel, String recipientType) {
    Get.snackbar(
      "إرسال إشعار",
      "تم إرسال إشعار النتائج لجميع (${recipientType == 'student' ? 'الطلاب' : 'أولياء الأمور'}) بنجاح عبر قناة ($channel).",
      backgroundColor: const Color(0xFF7C3AED),
      colorText: Colors.white,
    );
  }

  void saveTeacherFeedback(StudentResultModel result, String notes) {
    final list = List<StudentResultModel>.from(state.value.studentResults);
    final idx = list.indexWhere((r) => r.studentId == result.studentId && r.examId == result.examId);
    if (idx != -1) {
      final updated = list[idx].copyWith(
        questionAnalyses: list[idx].questionAnalyses.map((q) {
          // Add notes to the first question as a mock feedback
          return q.copyWith(teacherNotes: notes);
        }).toList(),
      );
      list[idx] = updated;
      state.value = state.value.copyWith(studentResults: list);
      Get.snackbar("تم الحفظ", "تم حفظ الملاحظات ومراجعة المعلم بنجاح.");
    }
  }

  // ----------------------------------------------------
  // Question Bank Actions
  // ----------------------------------------------------
  void addQuestionToFolder(QuestionFolderModel folder, QuestionModel q) {
    final list = List<QuestionFolderModel>.from(state.value.questionFolders);
    final idx = list.indexWhere((f) => f.chapter == folder.chapter && f.lesson == folder.lesson);
    if (idx != -1) {
      final currentFolder = list[idx];
      final currentQuestions = List<QuestionModel>.from(currentFolder.questions)..add(q);
      
      int easy = currentFolder.easyCount + (q.difficulty == "سهل" ? 1 : 0);
      int med = currentFolder.mediumCount + (q.difficulty == "متوسط" ? 1 : 0);
      int hard = currentFolder.hardCount + (q.difficulty == "صعب" ? 1 : 0);

      list[idx] = QuestionFolderModel(
        subject: currentFolder.subject,
        chapter: currentFolder.chapter,
        lesson: currentFolder.lesson,
        questionCount: currentQuestions.length,
        easyCount: easy,
        mediumCount: med,
        hardCount: hard,
        questions: currentQuestions,
      );
      state.value = state.value.copyWith(questionFolders: list, questionBankCount: state.value.questionBankCount + 1);
      Get.snackbar("إضافة سؤال", "تم إضافة السؤال الجديد إلى بنك الأسئلة بنجاح.");
    }
  }

  void deleteQuestionFromFolder(QuestionFolderModel folder, QuestionModel q) {
    final list = List<QuestionFolderModel>.from(state.value.questionFolders);
    final idx = list.indexWhere((f) => f.chapter == folder.chapter && f.lesson == folder.lesson);
    if (idx != -1) {
      final currentFolder = list[idx];
      final currentQuestions = List<QuestionModel>.from(currentFolder.questions)..removeWhere((item) => item.id == q.id);

      int easy = currentFolder.easyCount - (q.difficulty == "سهل" ? 1 : 0);
      int med = currentFolder.mediumCount - (q.difficulty == "متوسط" ? 1 : 0);
      int hard = currentFolder.hardCount - (q.difficulty == "صعب" ? 1 : 0);

      list[idx] = QuestionFolderModel(
        subject: currentFolder.subject,
        chapter: currentFolder.chapter,
        lesson: currentFolder.lesson,
        questionCount: currentQuestions.length,
        easyCount: easy,
        mediumCount: med,
        hardCount: hard,
        questions: currentQuestions,
      );
      state.value = state.value.copyWith(questionFolders: list, questionBankCount: state.value.questionBankCount - 1);
      Get.snackbar("حذف سؤال", "تم حذف السؤال بنجاح من بنك الأسئلة.");
    }
  }
}
