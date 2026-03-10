import 'package:flutter/material.dart';

class TeacherMessageItem {
  final String text;
  final String attachmentTitle;
  final String attachmentSubtitle;

  const TeacherMessageItem({
    required this.text,
    required this.attachmentTitle,
    required this.attachmentSubtitle,
  });
}

class TeacherChannelItem {
  final String id;
  final String teacherName;
  final String subjectName;
  final String initials;
  final Color avatarColor;
  final List<TeacherMessageItem> messages;

  const TeacherChannelItem({
    required this.id,
    required this.teacherName,
    required this.subjectName,
    required this.initials,
    required this.avatarColor,
    required this.messages,
  });

  String get previewText {
    if (messages.isEmpty) return 'لا توجد تنبيهات حالية';
    return messages.first.text.replaceAll('\n', ' ');
  }
}

class CommunicationChannelState {
  final String title;
  final String subtitle;
  final String footerText;
  final List<TeacherChannelItem> teachers;
  final String? selectedTeacherId;

  const CommunicationChannelState({
    required this.title,
    required this.subtitle,
    required this.footerText,
    required this.teachers,
    required this.selectedTeacherId,
  });

  factory CommunicationChannelState.initial() {
    return const CommunicationChannelState(
      title: 'قناة التنبيهات',
      subtitle: 'تابع آخر أخبار المادة، المذكّرات، ومواعيد المحاضرات من المدرس',
      footerText: 'يمكن للمدرس فقط إرسال الرسائل في هذه القناة.',
      selectedTeacherId: null,
      teachers: [
        TeacherChannelItem(
          id: 'teacher_1',
          teacherName: 'أ / مصطفى هيكل',
          subjectName: 'الكيمياء',
          initials: 'م',
          avatarColor: Color(0xFF9CA98C),
          messages: [
            TeacherMessageItem(
              text:
                  'اليوم قمنا بمراجعة درس الروابط الكيميائية وتطبيق التمارين على الجدول الدوري.\nتذكّروا حل تمارين صفحة 45-47 للحصة القادمة.',
              attachmentTitle: 'ملخص حصة الكيمياء',
              attachmentSubtitle: 'الروابط الكيميائية والجدول الدوري',
            ),
            TeacherMessageItem(
              text:
                  'راجعوا النقاط الأساسية في الباب الثاني، وركّزوا على أمثلة الجدول الدوري قبل المحاضرة القادمة.',
              attachmentTitle: 'مذكرة المراجعة',
              attachmentSubtitle: 'أهم أسئلة الباب الثاني',
            ),
          ],
        ),
        TeacherChannelItem(
          id: 'teacher_2',
          teacherName: 'أ / أحمد سالم',
          subjectName: 'الفيزياء',
          initials: 'أ',
          avatarColor: Color(0xFF8AA6B6),
          messages: [
            TeacherMessageItem(
              text:
                  'تم رفع ورقة قوانين الحركة والسرعة. تأكدوا من مراجعتها قبل الاختبار القصير.',
              attachmentTitle: 'ورقة قوانين الفيزياء',
              attachmentSubtitle: 'الحركة والسرعة والتسارع',
            ),
          ],
        ),
        TeacherChannelItem(
          id: 'teacher_3',
          teacherName: 'أ / سارة نبيل',
          subjectName: 'الأحياء',
          initials: 'س',
          avatarColor: Color(0xFFB9908A),
          messages: [
            TeacherMessageItem(
              text:
                  'تم إضافة ملخص الجهاز الدوري، وسنناقش الأسئلة المقالية في المحاضرة القادمة.',
              attachmentTitle: 'ملخص الأحياء',
              attachmentSubtitle: 'الجهاز الدوري والتنفس',
            ),
          ],
        ),
      ],
    );
  }

  CommunicationChannelState copyWith({
    String? title,
    String? subtitle,
    String? footerText,
    List<TeacherChannelItem>? teachers,
    Object? selectedTeacherId = _sentinel,
  }) {
    return CommunicationChannelState(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      footerText: footerText ?? this.footerText,
      teachers: teachers ?? this.teachers,
      selectedTeacherId: selectedTeacherId == _sentinel
          ? this.selectedTeacherId
          : selectedTeacherId as String?,
    );
  }
}

const Object _sentinel = Object();
