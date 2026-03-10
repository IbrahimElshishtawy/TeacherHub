class StudentNotificationItem {
  final String id;
  final String title;
  final String subtitle;
  final bool highlighted;

  const StudentNotificationItem({
    required this.id,
    required this.title,
    required this.subtitle,
    this.highlighted = false,
  });
}

class NotificationStudentState {
  final String title;
  final String subtitle;
  final List<StudentNotificationItem> items;

  const NotificationStudentState({
    required this.title,
    required this.subtitle,
    required this.items,
  });

  factory NotificationStudentState.initial() {
    return const NotificationStudentState(
      title: 'الاشعارات',
      subtitle: 'تابع آخر التحديثات والتنبيهات المتعلقة بحسابك أولًا بأول.',
      items: [
        StudentNotificationItem(
          id: 'n1',
          title: 'قام المسؤول بإضافة موعد جديد',
          subtitle: 'انقر لعرض التفاصيل',
        ),
        StudentNotificationItem(
          id: 'n2',
          title: 'قام المسؤول بإضافة موعد جديد',
          subtitle: 'انقر لعرض التفاصيل',
        ),
        StudentNotificationItem(
          id: 'n3',
          title: 'قام المسؤول بإضافة موعد جديد',
          subtitle: 'انقر لعرض التفاصيل',
        ),
        StudentNotificationItem(
          id: 'n4',
          title: 'قام المسؤول بإضافة موعد جديد',
          subtitle: 'انقر لعرض التفاصيل',
        ),
        StudentNotificationItem(
          id: 'n5',
          title: 'قام المسؤول بإضافة موعد جديد',
          subtitle: 'انقر لعرض التفاصيل',
        ),
        StudentNotificationItem(
          id: 'n6',
          title: 'قام المسؤول بإضافة موعد جديد',
          subtitle: 'انقر لعرض التفاصيل',
          highlighted: true,
        ),
      ],
    );
  }
}
