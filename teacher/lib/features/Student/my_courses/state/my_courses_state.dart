class MyCourseItem {
  final String id;
  final String title;
  final String subtitle;
  final String dateText;
  final String lessonsCount;
  final String imageStyle;

  const MyCourseItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.dateText,
    required this.lessonsCount,
    required this.imageStyle,
  });
}

class MyCourseLessonItem {
  final String title;
  final String subtitle;
  final String dateText;
  final String duration;
  final String imageStyle;

  const MyCourseLessonItem({
    required this.title,
    required this.subtitle,
    required this.dateText,
    required this.duration,
    required this.imageStyle,
  });
}

class MyCoursesState {
  final String title;
  final String subtitle;
  final List<MyCourseItem> courses;
  final List<MyCourseLessonItem> lessons;

  const MyCoursesState({
    required this.title,
    required this.subtitle,
    required this.courses,
    required this.lessons,
  });

  factory MyCoursesState.initial() {
    return const MyCoursesState(
      title: 'كورساتي المشتركة',
      subtitle: 'تابع تقدّمك في المناهج التي اشتركت بها واستكمل دروسك.',
      courses: [
        MyCourseItem(
          id: 'chemistry_1',
          title: 'مقدمة في الكيمياء',
          subtitle: 'التعرف على المفاهيم الأساسية ومقدمة الباب الأول',
          dateText: 'الثلاثاء 2 فبراير',
          lessonsCount: '10 فيديوهات',
          imageStyle: 'amber',
        ),
        MyCourseItem(
          id: 'chemistry_2',
          title: 'مقدمة في الكيمياء',
          subtitle: 'التعرف على المفاهيم الأساسية ومقدمة الباب الأول',
          dateText: 'الثلاثاء 2 فبراير',
          lessonsCount: '10 فيديوهات',
          imageStyle: 'amber',
        ),
        MyCourseItem(
          id: 'chemistry_3',
          title: 'مقدمة في الكيمياء',
          subtitle: 'التعرف على المفاهيم الأساسية ومقدمة الباب الأول',
          dateText: 'الثلاثاء 2 فبراير',
          lessonsCount: '10 فيديوهات',
          imageStyle: 'amber',
        ),
      ],
      lessons: [
        MyCourseLessonItem(
          title: 'مقدمة في الكيمياء',
          subtitle: 'التعرف على المفاهيم الأساسية ومقدمة الباب الأول',
          dateText: 'الثلاثاء 2 فبراير',
          duration: '40:00',
          imageStyle: 'lab',
        ),
        MyCourseLessonItem(
          title: 'الذرة وبنيتها',
          subtitle: 'مكونات الذرة والإلكترونات والطاقة',
          dateText: 'الثلاثاء 2 فبراير',
          duration: '40:00',
          imageStyle: 'blue_lab',
        ),
        MyCourseLessonItem(
          title: 'الجدول الدوري للعناصر',
          subtitle: 'تصنيف العناصر وفهم المجموعات والدورات',
          dateText: 'الثلاثاء 2 فبراير',
          duration: '40:00',
          imageStyle: 'molecule',
        ),
        MyCourseLessonItem(
          title: 'الروابط الكيميائية',
          subtitle: 'الروابط الأيونية والتساهمية وكيفية تكوينها',
          dateText: 'الثلاثاء 2 فبراير',
          duration: '40:00',
          imageStyle: 'glass',
        ),
        MyCourseLessonItem(
          title: 'المركبات الكيميائية',
          subtitle: 'التعرف على المركبات وأنواعها',
          dateText: 'الثلاثاء 2 فبراير',
          duration: '40:00',
          imageStyle: 'dna',
        ),
        MyCourseLessonItem(
          title: 'التفاعلات الكيميائية',
          subtitle: 'أنواع التفاعلات والقوانين الأساسية',
          dateText: 'الثلاثاء 2 فبراير',
          duration: '40:00',
          imageStyle: 'beaker',
        ),
      ],
    );
  }
}
