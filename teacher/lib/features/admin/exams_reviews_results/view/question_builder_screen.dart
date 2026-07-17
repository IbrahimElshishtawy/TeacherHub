// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/exams_rr_controller.dart';
import '../state/exams_rr_state.dart';

class QuestionBuilderScreen extends StatefulWidget {
  final QuestionFolderModel? folderContext;

  const QuestionBuilderScreen({super.key, this.folderContext});

  @override
  State<QuestionBuilderScreen> createState() => _QuestionBuilderScreenState();
}

// Defining local state controllers for wizard steps and forms
class _QuestionBuilderScreenState extends State<QuestionBuilderScreen> {
  int currentStep = 0;

  // Step 1 Controllers
  final titleController = TextEditingController();
  String subject = "الكيمياء";
  String grade = "الصف الثالث الثانوي";
  String batch = "Third Secondary 2026";
  String chapter = "الباب الخامس: الكيمياء العضوية";
  String lesson = "تسمية الألكانات والخواص العامة";
  double marks = 2.0;
  String difficulty = "متوسط";
  final tagsController = TextEditingController();

  // Step 2 Selection
  String selectedType = "اختيار من متعدد";

  final List<Map<String, String>> questionTypes = [
    {"title": "اختيار من متعدد", "emoji": "📝", "desc": "سؤال خيارات متعددة مع خيار واحد صحيح"},
    {"title": "صح أو خطأ", "emoji": "✔️", "desc": "سؤال تحديد مدى صحة العبارة"},
    {"title": "أكمل الفراغ", "emoji": "✏️", "desc": "كتابة الكلمة أو العبارة المفقودة"},
    {"title": "مقالي", "emoji": "✍️", "desc": "إجابة إنشائية حرة يقوم المعلم بتصحيحها"},
    {"title": "توصيل", "emoji": "🔗", "desc": "مطابقة عناصر العمود الأيمن بالأيسر"},
    {"title": "ترتيب", "emoji": "🔢", "desc": "ترتيب العناصر تصاعدياً أو تنازلياً أو زمنياً"},
    {"title": "اختيار متعدد الإجابات", "emoji": "☑️", "desc": "سؤال يحتمل أكثر من إجابة صحيحة"},
    {"title": "رفع صورة والإجابة عليها", "emoji": "🖼️", "desc": "سؤال يعتمد على استخلاص تفاصيل صورة"},
    {"title": "معادلة رياضية", "emoji": "🧮", "desc": "مسائل رياضية ومعادلات كيميائية"},
    {"title": "سؤال صوتي", "emoji": "🎤", "desc": "سؤال استماع للغات والتجويد"},
    {"title": "سؤال فيديو", "emoji": "🎥", "desc": "سؤال مرئي يعتمد على مقطع تعليمي"},
  ];

  // Step 3 Rich Text & Dynamic Editors state
  final richEditorController = TextEditingController(text: "اكتب نص السؤال هنا...");
  
  // MCQ state
  final optionA = TextEditingController(text: "خيار أ");
  final optionB = TextEditingController(text: "خيار ب");
  final optionC = TextEditingController(text: "خيار ج");
  final optionD = TextEditingController(text: "خيار د");
  final optionE = TextEditingController(text: "خيار هـ");
  String mcqCorrectOption = "A";

  // True/False state
  bool tfCorrectAnswer = true;

  // Fill in Blank
  final fibCorrectAnswer = TextEditingController();
  final fibAlternativeAnswers = TextEditingController();

  // Essay
  int maxWords = 150;
  bool teacherManualCorrection = true;

  // Matching columns
  final matchLeft1 = TextEditingController(text: "العنصر 1");
  final matchRight1 = TextEditingController(text: "المطابق 1");
  final matchLeft2 = TextEditingController(text: "العنصر 2");
  final matchRight2 = TextEditingController(text: "المطابق 2");

  // Ordering
  final orderItem1 = TextEditingController(text: "الترتيب الأول");
  final orderItem2 = TextEditingController(text: "الترتيب الثاني");
  final orderItem3 = TextEditingController(text: "الترتيب الثالث");

  // Settings
  bool isRequired = true;
  bool isRandomizable = true;
  bool showHint = false;
  bool allowPartialMarks = false;
  double negativeMarks = 0.0;
  bool showExplanation = true;
  final explanationText = TextEditingController();
  int estimatedSolvingTimeSeconds = 90;

  @override
  void initState() {
    super.initState();
    if (widget.folderContext != null) {
      subject = widget.folderContext!.subject;
      chapter = widget.folderContext!.chapter;
      lesson = widget.folderContext!.lesson;
    }
  }

  Widget _buildStepIndicator(int idx, String title) {
    bool isActive = currentStep == idx;
    bool isCompleted = currentStep > idx;

    return Expanded(
      child: Column(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: isCompleted ? Colors.green : (isActive ? const Color(0xFF2563EB) : Colors.white),
              shape: BoxShape.circle,
              border: Border.all(color: isActive ? const Color(0xFF2563EB) : const Color(0xFFE2E8F0), width: 2),
            ),
            child: Center(
              child: isCompleted
                  ? const Icon(Icons.check, size: 16, color: Colors.white)
                  : Text("${idx + 1}", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: isActive ? Colors.white : Colors.grey)),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: TextStyle(
              fontSize: 11,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              color: isActive ? const Color(0xFF1E293B) : const Color(0xFF64748B),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // ----------------------------------------------------
  // Form Steps Builders
  // ----------------------------------------------------
  Widget _buildStep1Info() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text("1. تصنيف وبيانات السؤال الأساسية", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
        const SizedBox(height: 14),
        TextField(
          controller: titleController,
          decoration: InputDecoration(
            labelText: "عنوان أو رمز السؤال التوضيحي",
            hintText: "مثال: سؤال 15 عضوية",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        const SizedBox(height: 12),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(labelText: "المادة الدراسية", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
          value: subject,
          items: [subject].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
          onChanged: (val) => setState(() => subject = val ?? subject),
        ),
        const SizedBox(height: 12),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(labelText: "المرحلة الدراسية", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
          value: grade,
          items: const [
            DropdownMenuItem(value: "الصف الأول الثانوي", child: Text("الصف الأول الثانوي")),
            DropdownMenuItem(value: "الصف الثاني الثانوي", child: Text("الصف الثاني الثانوي")),
            DropdownMenuItem(value: "الصف الثالث الثانوي", child: Text("الصف الثالث الثانوي")),
          ],
          onChanged: (val) => setState(() => grade = val ?? grade),
        ),
        const SizedBox(height: 12),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(labelText: "الدفعة الدراسية", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
          value: batch,
          items: const [
            DropdownMenuItem(value: "Third Secondary 2026", child: Text("Third Secondary 2026")),
            DropdownMenuItem(value: "Third Secondary 2027", child: Text("Third Secondary 2027")),
            DropdownMenuItem(value: "Second Secondary", child: Text("Second Secondary")),
            DropdownMenuItem(value: "First Secondary", child: Text("First Secondary")),
          ],
          onChanged: (val) => setState(() => batch = val ?? batch),
        ),
        const SizedBox(height: 12),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(labelText: "الباب / الوحدة الفصلية", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
          value: chapter,
          items: [chapter, "الباب الأول: العناصر الانتقالية"].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
          onChanged: (val) => setState(() => chapter = val ?? chapter),
        ),
        const SizedBox(height: 12),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(labelText: "الدرس التعليمي", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
          value: lesson,
          items: [lesson, "خامات الحديد والسبائك"].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
          onChanged: (val) => setState(() => lesson = val ?? lesson),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                initialValue: "$marks",
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "درجة السؤال الافتراضية",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onChanged: (val) => marks = double.tryParse(val) ?? 2.0,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: "مستوى الصعوبة", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                value: difficulty,
                items: const [
                  DropdownMenuItem(value: "سهل", child: Text("سهل")),
                  DropdownMenuItem(value: "متوسط", child: Text("متوسط")),
                  DropdownMenuItem(value: "صعب", child: Text("صعب")),
                ],
                onChanged: (val) => setState(() => difficulty = val ?? difficulty),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        TextField(
          controller: tagsController,
          decoration: InputDecoration(
            labelText: "الوسوم والكلمات الدلالية (فصل بالفواصل)",
            hintText: "عضوية, الكانات, تسمية",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }

  Widget _buildStep2Types() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text("2. اختر نمط وهيكل السؤال المفضل", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
        const SizedBox(height: 14),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.4,
          ),
          itemCount: questionTypes.length,
          itemBuilder: (context, idx) {
            final type = questionTypes[idx];
            bool isSelected = selectedType == type["title"];

            return InkWell(
              onTap: () => setState(() => selectedType = type["title"] ?? selectedType),
              borderRadius: BorderRadius.circular(16),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFFEFF6FF) : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isSelected ? const Color(0xFF2563EB) : const Color(0xFFE2E8F0),
                    width: isSelected ? 2.0 : 1.0,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(type["emoji"] ?? "📝", style: const TextStyle(fontSize: 22)),
                        if (isSelected) const Icon(Icons.check_circle, color: Color(0xFF2563EB), size: 18),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      type["title"] ?? "",
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      type["desc"] ?? "",
                      style: const TextStyle(fontSize: 9, color: Color(0xFF64748B)),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  // Formatting Toolbar Helper
  Widget _buildFormattingButton(IconData icon, String tooltip) {
    return IconButton(
      icon: Icon(icon, size: 18, color: const Color(0xFF475569)),
      onPressed: () {
        Get.snackbar("تنسيق النصوص", "تم محاكاة أداة التنسيق: $tooltip");
      },
      tooltip: tooltip,
    );
  }

  Widget _buildStep3Editor() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text("3. تحرير محتوى السؤال وإعدادات الأمان", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
        const SizedBox(height: 12),

        // Rich Text Formatting toolbar simulation
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: const BoxDecoration(
            color: Color(0xFFF1F5F9),
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildFormattingButton(Icons.format_bold, "خط عريض"),
                _buildFormattingButton(Icons.format_italic, "خط مائل"),
                _buildFormattingButton(Icons.format_underline, "مسطر"),
                const VerticalDivider(width: 1, color: Colors.grey),
                _buildFormattingButton(Icons.format_list_bulleted, "قائمة نقطية"),
                _buildFormattingButton(Icons.format_align_right, "محاذاة لليمين"),
                _buildFormattingButton(Icons.functions, "محرر المعادلات الرياضية"),
                _buildFormattingButton(Icons.insert_photo_outlined, "إدراج صورة توضيحية"),
                _buildFormattingButton(Icons.table_chart_outlined, "إدراج جدول"),
                _buildFormattingButton(Icons.code_rounded, "كود برمجي"),
                _buildFormattingButton(Icons.mic_none_outlined, "ملف صوتي"),
              ],
            ),
          ),
        ),
        TextField(
          controller: richEditorController,
          maxLines: 4,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
        const SizedBox(height: 20),

        // ----------------------------------------------------
        // Dynamic Question Forms
        // ----------------------------------------------------
        const Text("تفاصيل خيارات الإجابة للنمط المختار:", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF2563EB))),
        const SizedBox(height: 10),

        if (selectedType == "اختيار من متعدد" || selectedType == "اختيار متعدد الإجابات") ...[
          TextField(controller: optionA, decoration: const InputDecoration(labelText: "الخيار أ")),
          TextField(controller: optionB, decoration: const InputDecoration(labelText: "الخيار ب")),
          TextField(controller: optionC, decoration: const InputDecoration(labelText: "الخيار ج")),
          TextField(controller: optionD, decoration: const InputDecoration(labelText: "الخيار د")),
          TextField(controller: optionE, decoration: const InputDecoration(labelText: "الخيار هـ (اختياري)")),
          const SizedBox(height: 10),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(labelText: "اختر الإجابة الصحيحة المعتمدة", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
            value: mcqCorrectOption,
            items: const [
              DropdownMenuItem(value: "A", child: Text("الخيار أ")),
              DropdownMenuItem(value: "B", child: Text("الخيار ب")),
              DropdownMenuItem(value: "C", child: Text("الخيار ج")),
              DropdownMenuItem(value: "D", child: Text("الخيار د")),
              DropdownMenuItem(value: "E", child: Text("الخيار هـ")),
            ],
            onChanged: (val) => setState(() => mcqCorrectOption = val ?? mcqCorrectOption),
          ),
        ] else if (selectedType == "صح أو خطأ") ...[
          const Text("تحديد الإجابة الصحيحة للعبارة:", style: TextStyle(fontSize: 12)),
          RadioListTile<bool>(
            title: const Text("عبارة صحيحة (صواب)"),
            value: true,
            groupValue: tfCorrectAnswer,
            onChanged: (val) => setState(() => tfCorrectAnswer = val ?? true),
          ),
          RadioListTile<bool>(
            title: const Text("عبارة خاطئة (خطأ)"),
            value: false,
            groupValue: tfCorrectAnswer,
            onChanged: (val) => setState(() => tfCorrectAnswer = val ?? false),
          ),
        ] else if (selectedType == "أكمل الفراغ") ...[
          TextField(controller: fibCorrectAnswer, decoration: const InputDecoration(labelText: "الكلمة أو القيمة الصحيحة")),
          TextField(controller: fibAlternativeAnswers, decoration: const InputDecoration(labelText: "الإجابات البديلة المقبولة (افصل بفواصل)")),
        ] else if (selectedType == "مقالي") ...[
          TextFormField(
            initialValue: "$maxWords",
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "الحد الأقصى للكلمات المقبولة"),
            onChanged: (val) => maxWords = int.tryParse(val) ?? 150,
          ),
          SwitchListTile(
            title: const Text("يتطلب تصحيح يدوي من المعلم", style: TextStyle(fontSize: 12)),
            value: teacherManualCorrection,
            onChanged: (val) => setState(() => teacherManualCorrection = val),
          ),
        ] else if (selectedType == "توصيل") ...[
          Row(
            children: [
              Expanded(child: TextField(controller: matchLeft1, decoration: const InputDecoration(labelText: "اليمين 1"))),
              const SizedBox(width: 8),
              Expanded(child: TextField(controller: matchRight1, decoration: const InputDecoration(labelText: "اليسار 1 المطابق"))),
            ],
          ),
          Row(
            children: [
              Expanded(child: TextField(controller: matchLeft2, decoration: const InputDecoration(labelText: "اليمين 2"))),
              const SizedBox(width: 8),
              Expanded(child: TextField(controller: matchRight2, decoration: const InputDecoration(labelText: "اليسار 2 المطابق"))),
            ],
          ),
        ] else if (selectedType == "ترتيب") ...[
          TextField(controller: orderItem1, decoration: const InputDecoration(labelText: "العنصر الأول في الترتيب الصحيح")),
          TextField(controller: orderItem2, decoration: const InputDecoration(labelText: "العنصر الثاني")),
          TextField(controller: orderItem3, decoration: const InputDecoration(labelText: "العنصر الثالث")),
        ] else ...[
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Text("هذا النمط يعتمد على التحميلات وإعدادات المعلم التفاعلية في شاشة الامتحان.", style: TextStyle(fontSize: 12, color: Colors.blueGrey)),
          ),
        ],

        const SizedBox(height: 24),

        // Attachments
        const Text("تحميل المرفقات والملفات التوضيحية:", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
        const SizedBox(height: 10),
        Row(
          children: [
            ElevatedButton.icon(
              onPressed: () => Get.snackbar("رفع مرفق", "تم محاكاة اختيار صورة أو رسم هندسي"),
              icon: const Icon(Icons.image_outlined, size: 16),
              label: const Text("صورة / رسم", style: TextStyle(fontSize: 11)),
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFF1F5F9), foregroundColor: const Color(0xFF475569), elevation: 0),
            ),
            const SizedBox(width: 8),
            ElevatedButton.icon(
              onPressed: () => Get.snackbar("رفع مرفق", "تم محاكاة رفع مستند مرجعي PDF"),
              icon: const Icon(Icons.picture_as_pdf_outlined, size: 16),
              label: const Text("ملف PDF", style: TextStyle(fontSize: 11)),
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFF1F5F9), foregroundColor: const Color(0xFF475569), elevation: 0),
            ),
            const SizedBox(width: 8),
            ElevatedButton.icon(
              onPressed: () => Get.snackbar("رفع ملف صوتي", "تم رفع مقطع استماع صوتي"),
              icon: const Icon(Icons.volume_up_outlined, size: 16),
              label: const Text("صوت", style: TextStyle(fontSize: 11)),
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFF1F5F9), foregroundColor: const Color(0xFF475569), elevation: 0),
            ),
          ],
        ),

        const SizedBox(height: 24),

        // Advanced Settings
        const Text("إعدادات السؤال التعليمية:", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
        const SizedBox(height: 10),
        SwitchListTile(
          title: const Text("سؤال إجباري للحل", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          value: isRequired,
          activeColor: const Color(0xFF2563EB),
          onChanged: (val) => setState(() => isRequired = val),
        ),
        SwitchListTile(
          title: const Text("ترتيب خيارات عشوائي", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          value: isRandomizable,
          activeColor: const Color(0xFF2563EB),
          onChanged: (val) => setState(() => isRandomizable = val),
        ),
        SwitchListTile(
          title: const Text("السماح باحتساب درجات جزئية", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          value: allowPartialMarks,
          activeColor: const Color(0xFF2563EB),
          onChanged: (val) => setState(() => allowPartialMarks = val),
        ),
        SwitchListTile(
          title: const Text("عرض التفسير والحل النموذجي بعد الإجابة", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          value: showExplanation,
          activeColor: const Color(0xFF2563EB),
          onChanged: (val) => setState(() => showExplanation = val),
        ),
        if (showExplanation) ...[
          const SizedBox(height: 8),
          TextField(
            controller: explanationText,
            maxLines: 2,
            decoration: InputDecoration(
              labelText: "تفسير الإجابة النموذجية للطلاب",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ],
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                initialValue: "$negativeMarks",
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "الدرجة السالبة في حال الخطأ"),
                onChanged: (val) => negativeMarks = double.tryParse(val) ?? 0.0,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextFormField(
                initialValue: "$estimatedSolvingTimeSeconds",
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "زمن الحل المتوقع بالثواني"),
                onChanged: (val) => estimatedSolvingTimeSeconds = int.tryParse(val) ?? 90,
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ExamsRRController>();

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              const SizedBox(height: 16),

              // Title Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.arrow_forward_ios, size: 20),
                    ),
                    Column(
                      children: const [
                        Text(
                          "إنشاء سؤال جديد للبنك",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "قم بإنشاء وتصميم سؤال جديد لضمه إلى بنك الأسئلة المعتمد.",
                          style: TextStyle(fontSize: 10, color: Colors.black54),
                        ),
                      ],
                    ),
                    const SizedBox(width: 48), // spacer
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Step Indicators
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    _buildStepIndicator(0, "التصنيف والبيانات"),
                    _buildStepIndicator(1, "نمط وهيكل السؤال"),
                    _buildStepIndicator(2, "المحتوى والإعدادات"),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Divider(height: 1, color: Color(0xFFE2E8F0)),
              const SizedBox(height: 16),

              // Form Content
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        if (currentStep == 0) _buildStep1Info(),
                        if (currentStep == 1) _buildStep2Types(),
                        if (currentStep == 2) _buildStep3Editor(),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),

              // Stepper Navigation Footer Buttons
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    if (currentStep > 0)
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => setState(() => currentStep--),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xFF94A3B8)),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          child: const Text("السابق", style: TextStyle(color: Color(0xFF64748B), fontWeight: FontWeight.bold)),
                        ),
                      )
                    else
                      const Spacer(),
                    const SizedBox(width: 8),
                    if (currentStep < 2)
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if (currentStep == 0 && titleController.text.trim().isEmpty) {
                              Get.snackbar("حقل مطلوب", "يرجى كتابة عنوان السؤال التوضيحي");
                              return;
                            }
                            setState(() => currentStep++);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2563EB),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          child: const Text("التالي", style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      )
                    else
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // Construct and save the new question
                            final qText = richEditorController.text.trim();
                            if (qText.isEmpty) {
                              Get.snackbar("خطأ", "يرجى كتابة نص السؤال");
                              return;
                            }

                            final newQ = QuestionModel(
                              id: "Q-${DateTime.now().millisecondsSinceEpoch}",
                              text: qText,
                              type: selectedType,
                              options: selectedType == "اختيار من متعدد"
                                  ? [optionA.text, optionB.text, optionC.text, optionD.text]
                                  : [],
                              correctAnswer: selectedType == "اختيار من متعدد"
                                  ? mcqCorrectOption
                                  : (selectedType == "صح أو خطأ" ? (tfCorrectAnswer ? "صواب" : "خطأ") : fibCorrectAnswer.text),
                              difficulty: difficulty,
                              marks: marks.toInt(),
                            );

                            // Add to first folder context in seed (mock folder context matching chapter)
                            final matchedFolder = controller.state.value.questionFolders.firstWhere(
                              (f) => f.chapter.contains(chapter.split(":").first),
                              orElse: () => controller.state.value.questionFolders.first,
                            );

                            controller.addQuestionToFolder(matchedFolder, newQ);
                            Get.back(); // close QuestionBuilderScreen
                          },
                          icon: const Icon(Icons.save_outlined),
                          label: const Text("حفظ ونشر بالبنك", style: TextStyle(fontWeight: FontWeight.bold)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
