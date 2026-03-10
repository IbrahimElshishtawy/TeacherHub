enum SavedItemsTab { courses, files, previousTests }

class SavedTestItem {
  final String title;
  final String code;
  final int score;
  final int total;

  const SavedTestItem({
    required this.title,
    required this.code,
    required this.score,
    required this.total,
  });
}

class SavedFileItem {
  final String title;
  final String subtitle;

  const SavedFileItem({required this.title, required this.subtitle});
}

class SavedCourseItem {
  final String title;
  final String subtitle;
  final String dateText;

  const SavedCourseItem({
    required this.title,
    required this.subtitle,
    required this.dateText,
  });
}

class SubscribedLessonItem {
  final String title;
  final String subtitle;
  final String dateText;
  final String duration;

  const SubscribedLessonItem({
    required this.title,
    required this.subtitle,
    required this.dateText,
    required this.duration,
  });
}

class SavedItemsState {
  SavedItemsTab selectedTab = SavedItemsTab.courses;
  String query = '';

  final String title = 'العناصر المحفوظة';
  final String subtitle =
      'قائمة بكافة الدروس والملفات التي قمت بحفظها للرجوع إليها لاحقًا.';

  final List<SavedTestItem> tests = const [
    SavedTestItem(
      title: 'اختبار الباب الثاني',
      code: '#54321',
      score: 25,
      total: 30,
    ),
    SavedTestItem(
      title: 'اختبار الباب الثاني',
      code: '#54321',
      score: 25,
      total: 30,
    ),
    SavedTestItem(
      title: 'اختبار الباب الثاني',
      code: '#54321',
      score: 25,
      total: 30,
    ),
    SavedTestItem(
      title: 'اختبار الباب الثاني',
      code: '#54321',
      score: 15,
      total: 30,
    ),
  ];

  final List<SavedFileItem> files = const [
    SavedFileItem(
      title: 'ملخص حصة الكيمياء',
      subtitle: 'الروابط الكيميائية والجدول الدوري',
    ),
    SavedFileItem(
      title: 'ملخص حصة الكيمياء',
      subtitle: 'الروابط الكيميائية والجدول الدوري',
    ),
    SavedFileItem(
      title: 'ملخص حصة الكيمياء',
      subtitle: 'الروابط الكيميائية والجدول الدوري',
    ),
    SavedFileItem(
      title: 'ملخص حصة الكيمياء',
      subtitle: 'الروابط الكيميائية والجدول الدوري',
    ),
    SavedFileItem(
      title: 'ملخص حصة الكيمياء',
      subtitle: 'الروابط الكيميائية والجدول الدوري',
    ),
    SavedFileItem(
      title: 'ملخص حصة الكيمياء',
      subtitle: 'الروابط الكيميائية والجدول الدوري',
    ),
  ];

  final List<SavedCourseItem> courses = const [
    SavedCourseItem(
      title: 'مقدمة في الكيمياء',
      subtitle: 'التعرف على المفاهيم الأساسية ومقدمة الباب الأول',
      dateText: 'الثلاثاء 2 فبراير',
    ),
    SavedCourseItem(
      title: 'مقدمة في الكيمياء',
      subtitle: 'التعرف على المفاهيم الأساسية ومقدمة الباب الأول',
      dateText: 'الثلاثاء 2 فبراير',
    ),
  ];

  final List<SubscribedLessonItem> subscribedLessons = const [
    SubscribedLessonItem(
      title: 'مقدمة في الكيمياء',
      subtitle: 'التعرف على المفاهيم الأساسية',
      dateText: 'الثلاثاء 2 فبراير',
      duration: '40:00',
    ),
    SubscribedLessonItem(
      title: 'الذرة وبنيتها',
      subtitle: 'مكونات الذرة والإلكترونات والطاقة',
      dateText: 'الثلاثاء 2 فبراير',
      duration: '40:00',
    ),
    SubscribedLessonItem(
      title: 'الجدول الدوري للعناصر',
      subtitle: 'تصنيف العناصر وفهم المجموعات والدورات',
      dateText: 'الثلاثاء 2 فبراير',
      duration: '40:00',
    ),
    SubscribedLessonItem(
      title: 'الروابط الكيميائية',
      subtitle: 'الروابط الأيونية والتساهمية وكيفية تكوينها',
      dateText: 'الثلاثاء 2 فبراير',
      duration: '40:00',
    ),
    SubscribedLessonItem(
      title: 'المركبات الكيميائية',
      subtitle: 'أنواع المركبات وخواصها',
      dateText: 'الثلاثاء 2 فبراير',
      duration: '40:00',
    ),
    SubscribedLessonItem(
      title: 'التفاعلات الكيميائية',
      subtitle: 'أنواع التفاعلات والقوانين الأساسية',
      dateText: 'الثلاثاء 2 فبراير',
      duration: '40:00',
    ),
  ];

  List<SavedTestItem> get filteredTests {
    if (query.trim().isEmpty) return tests;
    final q = query.trim();
    return tests
        .where((e) => e.title.contains(q) || e.code.contains(q))
        .toList();
  }

  List<SavedFileItem> get filteredFiles {
    if (query.trim().isEmpty) return files;
    final q = query.trim();
    return files
        .where((e) => e.title.contains(q) || e.subtitle.contains(q))
        .toList();
  }

  List<SavedCourseItem> get filteredCourses {
    if (query.trim().isEmpty) return courses;
    final q = query.trim();
    return courses
        .where((e) => e.title.contains(q) || e.subtitle.contains(q))
        .toList();
  }
}
