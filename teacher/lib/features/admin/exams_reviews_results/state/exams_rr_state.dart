class QuestionModel {
  final String id;
  final String text;
  final String type; // اختيار من متعدد / صواب وخطأ / مقالي / إكمال الفراغ / توصيل / ترتيب / سؤال صورة / سؤال معادلة
  final List<String> options;
  final String correctAnswer;
  final String difficulty; // سهل / متوسط / صعب
  final int marks;

  const QuestionModel({
    required this.id,
    required this.text,
    required this.type,
    required this.options,
    required this.correctAnswer,
    required this.difficulty,
    required this.marks,
  });
}

class QuestionFolderModel {
  final String subject;
  final String chapter;
  final String lesson;
  final int questionCount;
  final int easyCount;
  final int mediumCount;
  final int hardCount;
  final List<QuestionModel> questions;

  const QuestionFolderModel({
    required this.subject,
    required this.chapter,
    required this.lesson,
    required this.questionCount,
    required this.easyCount,
    required this.mediumCount,
    required this.hardCount,
    required this.questions,
  });
}

class ExamModel {
  final String id;
  final String name;
  final String subject;
  final String grade;
  final String batch;
  final String chapter;
  final String lesson;
  final String type; // Quiz / الواجب / امتحان شهري / امتحان نهائي / مراجعة
  final int questionCount;
  final int totalMarks;
  final int durationMinutes;
  final String availableFrom;
  final String availableUntil;
  final int studentsAssignedCount;
  final int submissionCount;
  final double avgScore;
  final String status; // نشط / مجدول / منتهي

  // Wizard settings properties
  final bool shuffleQuestions;
  final bool shuffleAnswers;
  final bool differentOrder;
  final bool randomFromBank;
  final bool allowMultipleAttempts;
  final bool preventGoingBack;
  final bool showScoreAfterFinish;
  final bool showCorrectAnswers;
  final bool allowReview;
  final bool enableTimer;
  final bool autoSubmit;

  const ExamModel({
    required this.id,
    required this.name,
    required this.subject,
    required this.grade,
    required this.batch,
    required this.chapter,
    required this.lesson,
    required this.type,
    required this.questionCount,
    required this.totalMarks,
    required this.durationMinutes,
    required this.availableFrom,
    required this.availableUntil,
    required this.studentsAssignedCount,
    required this.submissionCount,
    required this.avgScore,
    required this.status,
    this.shuffleQuestions = true,
    this.shuffleAnswers = true,
    this.differentOrder = false,
    this.randomFromBank = false,
    this.allowMultipleAttempts = false,
    this.preventGoingBack = true,
    this.showScoreAfterFinish = true,
    this.showCorrectAnswers = true,
    this.allowReview = true,
    this.enableTimer = true,
    this.autoSubmit = true,
  });

  ExamModel copyWith({
    String? id,
    String? name,
    String? subject,
    String? grade,
    String? batch,
    String? chapter,
    String? lesson,
    String? type,
    int? questionCount,
    int? totalMarks,
    int? durationMinutes,
    String? availableFrom,
    String? availableUntil,
    int? studentsAssignedCount,
    int? submissionCount,
    double? avgScore,
    String? status,
    bool? shuffleQuestions,
    bool? shuffleAnswers,
    bool? differentOrder,
    bool? randomFromBank,
    bool? allowMultipleAttempts,
    bool? preventGoingBack,
    bool? showScoreAfterFinish,
    bool? showCorrectAnswers,
    bool? allowReview,
    bool? enableTimer,
    bool? autoSubmit,
  }) {
    return ExamModel(
      id: id ?? this.id,
      name: name ?? this.name,
      subject: subject ?? this.subject,
      grade: grade ?? this.grade,
      batch: batch ?? this.batch,
      chapter: chapter ?? this.chapter,
      lesson: lesson ?? this.lesson,
      type: type ?? this.type,
      questionCount: questionCount ?? this.questionCount,
      totalMarks: totalMarks ?? this.totalMarks,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      availableFrom: availableFrom ?? this.availableFrom,
      availableUntil: availableUntil ?? this.availableUntil,
      studentsAssignedCount: studentsAssignedCount ?? this.studentsAssignedCount,
      submissionCount: submissionCount ?? this.submissionCount,
      avgScore: avgScore ?? this.avgScore,
      status: status ?? this.status,
      shuffleQuestions: shuffleQuestions ?? this.shuffleQuestions,
      shuffleAnswers: shuffleAnswers ?? this.shuffleAnswers,
      differentOrder: differentOrder ?? this.differentOrder,
      randomFromBank: randomFromBank ?? this.randomFromBank,
      allowMultipleAttempts: allowMultipleAttempts ?? this.allowMultipleAttempts,
      preventGoingBack: preventGoingBack ?? this.preventGoingBack,
      showScoreAfterFinish: showScoreAfterFinish ?? this.showScoreAfterFinish,
      showCorrectAnswers: showCorrectAnswers ?? this.showCorrectAnswers,
      allowReview: allowReview ?? this.allowReview,
      enableTimer: enableTimer ?? this.enableTimer,
      autoSubmit: autoSubmit ?? this.autoSubmit,
    );
  }
}

class ReviewPackageModel {
  final String id;
  final String title;
  final String subject;
  final String batch;
  final String chapter;
  final String lesson;
  final String videoUrl;
  final String pdfNotesName;
  final String summary;
  final int assignmentsCount;
  final int practiceQuestionsCount;
  final String examTitle;
  final List<String> attachments;

  const ReviewPackageModel({
    required this.id,
    required this.title,
    required this.subject,
    required this.batch,
    required this.chapter,
    required this.lesson,
    required this.videoUrl,
    required this.pdfNotesName,
    required this.summary,
    required this.assignmentsCount,
    required this.practiceQuestionsCount,
    required this.examTitle,
    required this.attachments,
  });

  ReviewPackageModel copyWith({
    String? id,
    String? title,
    String? subject,
    String? batch,
    String? chapter,
    String? lesson,
    String? videoUrl,
    String? pdfNotesName,
    String? summary,
    int? assignmentsCount,
    int? practiceQuestionsCount,
    String? examTitle,
    List<String>? attachments,
  }) {
    return ReviewPackageModel(
      id: id ?? this.id,
      title: title ?? this.title,
      subject: subject ?? this.subject,
      batch: batch ?? this.batch,
      chapter: chapter ?? this.chapter,
      lesson: lesson ?? this.lesson,
      videoUrl: videoUrl ?? this.videoUrl,
      pdfNotesName: pdfNotesName ?? this.pdfNotesName,
      summary: summary ?? this.summary,
      assignmentsCount: assignmentsCount ?? this.assignmentsCount,
      practiceQuestionsCount: practiceQuestionsCount ?? this.practiceQuestionsCount,
      examTitle: examTitle ?? this.examTitle,
      attachments: attachments ?? this.attachments,
    );
  }
}

class QuestionAnalysisModel {
  final String questionText;
  final String studentAnswer;
  final String correctAnswer;
  final int marksObtained;
  final int totalMarks;
  final int timeSpentSeconds;
  final String teacherNotes;

  const QuestionAnalysisModel({
    required this.questionText,
    required this.studentAnswer,
    required this.correctAnswer,
    required this.marksObtained,
    required this.totalMarks,
    required this.timeSpentSeconds,
    this.teacherNotes = "",
  });

  QuestionAnalysisModel copyWith({
    String? questionText,
    String? studentAnswer,
    String? correctAnswer,
    int? marksObtained,
    int? totalMarks,
    int? timeSpentSeconds,
    String? teacherNotes,
  }) {
    return QuestionAnalysisModel(
      questionText: questionText ?? this.questionText,
      studentAnswer: studentAnswer ?? this.studentAnswer,
      correctAnswer: correctAnswer ?? this.correctAnswer,
      marksObtained: marksObtained ?? this.marksObtained,
      totalMarks: totalMarks ?? this.totalMarks,
      timeSpentSeconds: timeSpentSeconds ?? this.timeSpentSeconds,
      teacherNotes: teacherNotes ?? this.teacherNotes,
    );
  }
}

class StudentResultModel {
  final String studentId;
  final String studentName;
  final String batch;
  final String examId;
  final String examName;
  final String submissionTime;
  final int durationMinutes;
  final int score;
  final int totalScore;
  final double percentage;
  final int rank;
  final bool isPassed;
  final List<QuestionAnalysisModel> questionAnalyses;

  const StudentResultModel({
    required this.studentId,
    required this.studentName,
    required this.batch,
    required this.examId,
    required this.examName,
    required this.submissionTime,
    required this.durationMinutes,
    required this.score,
    required this.totalScore,
    required this.percentage,
    required this.rank,
    required this.isPassed,
    required this.questionAnalyses,
  });

  StudentResultModel copyWith({
    String? studentId,
    String? studentName,
    String? batch,
    String? examId,
    String? examName,
    String? submissionTime,
    int? durationMinutes,
    int? score,
    int? totalScore,
    double? percentage,
    int? rank,
    bool? isPassed,
    List<QuestionAnalysisModel>? questionAnalyses,
  }) {
    return StudentResultModel(
      studentId: studentId ?? this.studentId,
      studentName: studentName ?? this.studentName,
      batch: batch ?? this.batch,
      examId: examId ?? this.examId,
      examName: examName ?? this.examName,
      submissionTime: submissionTime ?? this.submissionTime,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      score: score ?? this.score,
      totalScore: totalScore ?? this.totalScore,
      percentage: percentage ?? this.percentage,
      rank: rank ?? this.rank,
      isPassed: isPassed ?? this.isPassed,
      questionAnalyses: questionAnalyses ?? this.questionAnalyses,
    );
  }
}

class ExamsRRState {
  final int examsCount;
  final int reviewsCount;
  final int resultsCount;
  final int questionBankCount;

  final List<ExamModel> exams;
  final List<ReviewPackageModel> reviewPackages;
  final List<QuestionFolderModel> questionFolders;
  final List<StudentResultModel> studentResults;

  // Wizard state
  final int wizardStep;
  final Map<String, dynamic> tempWizardData;

  // Filters
  final String examQuery;
  final String selectedExamBatch;
  final String selectedExamType;
  final String selectedExamStatus;
  
  final Map<String, bool> enabledAutoReports;

  const ExamsRRState({
    required this.examsCount,
    required this.reviewsCount,
    required this.resultsCount,
    required this.questionBankCount,
    required this.exams,
    required this.reviewPackages,
    required this.questionFolders,
    required this.studentResults,
    this.wizardStep = 0,
    this.tempWizardData = const {},
    this.examQuery = "",
    this.selectedExamBatch = "الكل",
    this.selectedExamType = "الكل",
    this.selectedExamStatus = "الكل",
    this.enabledAutoReports = const {
      "تقرير الحضور والغياب": true,
      "درجات الاختبارات": true,
      "إتمام الواجبات": true,
      "إتمام المراجعات": false,
      "تحليل الأداء التعليمي": true,
      "تنبيه تجديد الاشتراك": false,
    },
  });

  static const initial = ExamsRRState(
    examsCount: 0,
    reviewsCount: 0,
    resultsCount: 0,
    questionBankCount: 0,
    exams: [],
    reviewPackages: [],
    questionFolders: [],
    studentResults: [],
  );

  ExamsRRState copyWith({
    int? examsCount,
    int? reviewsCount,
    int? resultsCount,
    int? questionBankCount,
    List<ExamModel>? exams,
    List<ReviewPackageModel>? reviewPackages,
    List<QuestionFolderModel>? questionFolders,
    List<StudentResultModel>? studentResults,
    int? wizardStep,
    Map<String, dynamic>? tempWizardData,
    String? examQuery,
    String? selectedExamBatch,
    String? selectedExamType,
    String? selectedExamStatus,
    Map<String, bool>? enabledAutoReports,
  }) {
    return ExamsRRState(
      examsCount: examsCount ?? this.examsCount,
      reviewsCount: reviewsCount ?? this.reviewsCount,
      resultsCount: resultsCount ?? this.resultsCount,
      questionBankCount: questionBankCount ?? this.questionBankCount,
      exams: exams ?? this.exams,
      reviewPackages: reviewPackages ?? this.reviewPackages,
      questionFolders: questionFolders ?? this.questionFolders,
      studentResults: studentResults ?? this.studentResults,
      wizardStep: wizardStep ?? this.wizardStep,
      tempWizardData: tempWizardData ?? this.tempWizardData,
      examQuery: examQuery ?? this.examQuery,
      selectedExamBatch: selectedExamBatch ?? this.selectedExamBatch,
      selectedExamType: selectedExamType ?? this.selectedExamType,
      selectedExamStatus: selectedExamStatus ?? this.selectedExamStatus,
      enabledAutoReports: enabledAutoReports ?? this.enabledAutoReports,
    );
  }
}
