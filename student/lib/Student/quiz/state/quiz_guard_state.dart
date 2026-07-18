import 'package:get/get.dart';

class QuizGuardState {
  final RxBool isExamActive = false.obs;
  final RxBool isStarting = false.obs;
  final RxBool isCheckingDevice = true.obs;
  final RxBool isBlockedDevice = false.obs;
  final RxInt currentQuestionIndex = 0.obs;
  final RxInt remainingSeconds = 1800.obs;
  final RxnInt selectedAnswerIndex = RxnInt();
  final RxString deviceLabel = 'جاري فحص الجهاز...'.obs;
  final RxString blockReason = ''.obs;
  final RxList<int?> answers = <int?>[].obs;

  final List<QuizQuestion> questions = const [
    QuizQuestion(
      question: 'أي من العناصر التالية يمتلك أعلى حالة تأكسد شائعة في عناصر السلسلة الانتقالية الأولى؟',
      options: ['الحديد (Fe)', 'المنجنيز (Mn)', 'الكروم (Cr)', 'الفاناديوم (V)'],
      correctAnswerIndex: 1,
    ),
    QuizQuestion(
      question: 'أي المركبات التالية يُعد من الأحماض القوية في الماء؟',
      options: [
        'حمض الخليك',
        'حمض الهيدروكلوريك',
        'الأمونيا',
        'كربونات الصوديوم',
      ],
      correctAnswerIndex: 1,
    ),
    QuizQuestion(
      question: 'ما هو ناتج أكسدة الإيثانال؟',
      options: ['إيثانول', 'إيثان', 'حمض أسيتيك', 'أسيتون'],
      correctAnswerIndex: 2,
    ),
    QuizQuestion(
      question: 'أي الجسيمات التالية توجد داخل نواة الذرة فقط؟',
      options: ['الإلكترونات', 'البروتونات والنيوترونات', 'الأيونات', 'الفوتونات'],
      correctAnswerIndex: 1,
    ),
    QuizQuestion(
      question: 'إذا زاد تركيز المتفاعلات في نظام متزن، فالاتزان يتحرك غالبًا نحو:',
      options: ['المتفاعلات', 'النواتج', 'لا يتغير', 'التوقف التام'],
      correctAnswerIndex: 1,
    ),
    QuizQuestion(
      question: 'ما الوحدة المستخدمة غالبًا لقياس سرعة التفاعل الكيميائي؟',
      options: ['مول/لتر.ثانية', 'جرام/سم', 'نيوتن', 'وات'],
      correctAnswerIndex: 0,
    ),
    QuizQuestion(
      question: 'أي الروابط التالية تُعد رابطة تساهمية قطبية؟',
      options: ['H2', 'O2', 'HCl', 'N2'],
      correctAnswerIndex: 2,
    ),
    QuizQuestion(
      question: 'ما الغاز الذي يستخدم لإطفاء الحرائق في بعض الطفايات؟',
      options: ['الأكسجين', 'ثاني أكسيد الكربون', 'الهيدروجين', 'الكلور'],
      correctAnswerIndex: 1,
    ),
  ];
}

class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  const QuizQuestion({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
  });
}

class QuizDeviceInfo {
  final bool isPhysicalDevice;
  final String deviceLabel;

  const QuizDeviceInfo({
    required this.isPhysicalDevice,
    required this.deviceLabel,
  });
}
