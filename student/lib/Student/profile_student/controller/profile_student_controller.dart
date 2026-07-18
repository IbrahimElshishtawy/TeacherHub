import 'package:get/get.dart';
import 'package:student/Student/profile_student/state/profile_student_state.dart';

class ProfileStudentController extends GetxController {
  final state = const ProfileStudentState(
    studentName: 'مصطفى أحمد السيد هيكل',
    studentCode: '1253564',
    email: 'sasahekal**@gmail.com',
    phone: '01019038129',
    parentPhone: '01094078941',
    grade: 'الصف الثالث الثانوي',
    joinDate: '7/5/2025',
    avatarUrl:
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=300',
    totalCourses: '5 كورسات',
    completedExams: 'الامتحانات المكتملة',
    attendanceRate: 'نسبة الحضور والغياب',
  ).obs;
}
