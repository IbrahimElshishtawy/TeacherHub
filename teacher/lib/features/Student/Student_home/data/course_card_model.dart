enum CourseStatus {
  available, // متاح (اشتراك + دخول)
  purchased, // تم الشراء (متابعة التقدم)
  locked, // اختياري: مقفول/غير متاح
}

class CourseCardModel {
  final String id;
  final String title;
  final String imageUrl;

  // Meta
  final String scheduleText;
  final String lessonsText;
  final String? subtitle;

  // Price
  final int priceEGP;

  final CourseStatus status;

  const CourseCardModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.scheduleText,
    required this.lessonsText,
    required this.priceEGP,
    required this.status,
    this.subtitle,
  });
}
