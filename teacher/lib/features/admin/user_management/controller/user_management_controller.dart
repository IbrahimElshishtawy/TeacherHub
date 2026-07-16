import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../state/user_management_state.dart';

class UserManagementController extends GetxController {
  final Rx<UserManagementState> state = UserManagementState.initial.obs;

  @override
  void onInit() {
    super.onInit();
    _seedData();
  }

  void _seedData() {
    final students = [
      const StudentModel(
        id: "ST-101",
        fullName: "أحمد محمد كمال",
        phone: "01011223344",
        parentPhone: "01099887766",
        parentWhatsapp: "01099887766",
        grade: "الصف الثالث الثانوي",
        batch: "Third Secondary 2026",
        schoolYear: "2025/2026",
        isActive: true,
        subscriptionStatus: "نشط",
        attendanceRate: 92.5,
        latestExamScore: "19/20",
        attendanceCount: 12,
        absenceCount: 1,
        latestAttendanceDate: "2026/07/15",
        examCount: 5,
        avgExamScore: 18.2,
        highestExamScore: 20.0,
        latestExamName: "شامل الكيمياء العضوية",
        homeworkCount: 10,
        completedHomework: 9,
        delayedHomework: 1,
        purchasedCoursesCount: 2,
        courseProgress: 80.0,
        completedLessons: 16,
        remainingLessons: 4,
        internalNotes: "طالب ممتاز ومتفاعل جداً في الحصص البث المباشر وقاعات المحاضرات.",
        lastLogin: "منذ ساعتين",
        lastWatch: "منذ 4 ساعات",
        lastExam: "أمس",
        lastHomework: "أمس",
      ),
      const StudentModel(
        id: "ST-102",
        fullName: "يوسف أحمد علي",
        phone: "01122334455",
        parentPhone: "01288776655",
        parentWhatsapp: "01288776655",
        grade: "الصف الثالث الثانوي",
        batch: "Third Secondary 2026",
        schoolYear: "2025/2026",
        isActive: true,
        subscriptionStatus: "منتهي",
        attendanceRate: 75.0,
        latestExamScore: "12/20",
        attendanceCount: 9,
        absenceCount: 3,
        latestAttendanceDate: "2026/07/12",
        examCount: 5,
        avgExamScore: 14.5,
        highestExamScore: 17.0,
        latestExamName: "شامل الكيمياء العضوية",
        homeworkCount: 10,
        completedHomework: 7,
        delayedHomework: 3,
        purchasedCoursesCount: 1,
        courseProgress: 45.0,
        completedLessons: 9,
        remainingLessons: 11,
        internalNotes: "يحتاج لمتابعة في حل الواجبات المتأخرة وتجديد الاشتراك الشهري.",
        lastLogin: "منذ 3 أيام",
        lastWatch: "منذ 5 أيام",
        lastExam: "منذ أسبوع",
        lastHomework: "منذ أسبوع",
      ),
      const StudentModel(
        id: "ST-103",
        fullName: "سارة محمود السيد",
        phone: "01233445566",
        parentPhone: "01177665544",
        parentWhatsapp: "01177665544",
        grade: "الصف الثاني الثانوي",
        batch: "Second Secondary",
        schoolYear: "2025/2026",
        isActive: true,
        subscriptionStatus: "نشط",
        attendanceRate: 98.0,
        latestExamScore: "20/20",
        attendanceCount: 15,
        absenceCount: 0,
        latestAttendanceDate: "2026/07/16",
        examCount: 6,
        avgExamScore: 19.5,
        highestExamScore: 20.0,
        latestExamName: "اختبار الباب الثاني",
        homeworkCount: 12,
        completedHomework: 12,
        delayedHomework: 0,
        purchasedCoursesCount: 3,
        courseProgress: 95.0,
        completedLessons: 24,
        remainingLessons: 1,
        internalNotes: "أداء متميز وثابت، دائماً تشارك بحيوية وتلتزم بكل الواجبات والاختبارات.",
        lastLogin: "منذ ساعة",
        lastWatch: "منذ ساعتين",
        lastExam: "أمس",
        lastHomework: "أمس",
      ),
      const StudentModel(
        id: "ST-104",
        fullName: "عمر خالد عبدالرحمن",
        phone: "01544556677",
        parentPhone: "01066554433",
        parentWhatsapp: "01066554433",
        grade: "الصف الأول الثانوي",
        batch: "First Secondary",
        schoolYear: "2025/2026",
        isActive: false,
        subscriptionStatus: "غير مشترك",
        attendanceRate: 60.0,
        latestExamScore: "9/20",
        attendanceCount: 6,
        absenceCount: 4,
        latestAttendanceDate: "2026/07/08",
        examCount: 4,
        avgExamScore: 10.0,
        highestExamScore: 12.0,
        latestExamName: "اختبار الباب الأول",
        homeworkCount: 8,
        completedHomework: 4,
        delayedHomework: 4,
        purchasedCoursesCount: 0,
        courseProgress: 0.0,
        completedLessons: 0,
        remainingLessons: 0,
        internalNotes: "تم إيقاف الحساب مؤقتاً لعدم سداد مصروفات الشهر والغياب المتكرر.",
        lastLogin: "منذ أسبوعين",
        lastWatch: "منذ أسبوعين",
        lastExam: "منذ أسبوعين",
        lastHomework: "منذ أسبوعين",
      ),
    ];

    final parents = [
      const ParentModel(
        id: "PR-201",
        fullName: "محمد كمال الدين",
        phone: "01099887766",
        whatsapp: "01099887766",
        childrenIds: ["ST-101"],
      ),
      const ParentModel(
        id: "PR-202",
        fullName: "أحمد علي حسين",
        phone: "01288776655",
        whatsapp: "01288776655",
        childrenIds: ["ST-102"],
      ),
      const ParentModel(
        id: "PR-203",
        fullName: "محمود السيد البشري",
        phone: "01177665544",
        whatsapp: "01177665544",
        childrenIds: ["ST-103"],
      ),
      const ParentModel(
        id: "PR-204",
        fullName: "خالد عبدالرحمن غانم",
        phone: "01066554433",
        whatsapp: "01066554433",
        childrenIds: ["ST-104"],
      ),
    ];

    state.value = state.value.copyWith(
      students: students,
      parents: parents,
    );
  }

  // ----------------------------------------------------
  // Statistics Calculations
  // ----------------------------------------------------
  int get totalStudents => state.value.students.length;
  int get activeStudents => state.value.students.where((s) => s.isActive).length;
  int get expiredSubStudents => state.value.students.where((s) => s.subscriptionStatus == "منتهي" || s.subscriptionStatus == "غير مشترك").length;
  int get totalBatches {
    final list = state.value.students.map((s) => s.batch).toSet();
    return list.length;
  }

  // ----------------------------------------------------
  // Student Filter Setters
  // ----------------------------------------------------
  void setStudentQuery(String val) => state.value = state.value.copyWith(studentQuery: val);
  void setStudentBatch(String val) => state.value = state.value.copyWith(selectedStudentBatch: val);
  void setStudentGrade(String val) => state.value = state.value.copyWith(selectedStudentGrade: val);
  void setStudentYear(String val) => state.value = state.value.copyWith(selectedStudentYear: val);
  void setStudentStatus(String val) => state.value = state.value.copyWith(selectedStudentStatus: val);
  void setStudentSub(String val) => state.value = state.value.copyWith(selectedStudentSub: val);
  void setStudentAttendance(String val) => state.value = state.value.copyWith(selectedStudentAttendance: val);

  // Filtered Student List
  List<StudentModel> get filteredStudents {
    final query = state.value.studentQuery.trim().toLowerCase();
    final batch = state.value.selectedStudentBatch;
    final grade = state.value.selectedStudentGrade;
    final year = state.value.selectedStudentYear;
    final status = state.value.selectedStudentStatus;
    final sub = state.value.selectedStudentSub;
    final att = state.value.selectedStudentAttendance;

    return state.value.students.where((s) {
      if (query.isNotEmpty) {
        final matches = s.fullName.toLowerCase().contains(query) ||
            s.id.toLowerCase().contains(query) ||
            s.phone.contains(query);
        if (!matches) return false;
      }
      if (batch != "الكل" && s.batch != batch) return false;
      if (grade != "الكل" && s.grade != grade) return false;
      if (year != "الكل" && s.schoolYear != year) return false;
      if (status != "الكل") {
        if (status == "نشط" && !s.isActive) return false;
        if (status == "موقوف" && s.isActive) return false;
      }
      if (sub != "الكل" && s.subscriptionStatus != sub) return false;
      if (att != "الكل") {
        if (att == "ممتاز" && s.attendanceRate < 90.0) return false;
        if (att == "مقبول" && (s.attendanceRate < 75.0 || s.attendanceRate >= 90.0)) return false;
        if (att == "ضعيف" && s.attendanceRate >= 75.0) return false;
      }
      return true;
    }).toList();
  }

  // ----------------------------------------------------
  // Parent Filter Setters
  // ----------------------------------------------------
  void setParentQuery(String val) => state.value = state.value.copyWith(parentQuery: val);
  void setParentBatch(String val) => state.value = state.value.copyWith(selectedParentBatch: val);
  void setParentGrade(String val) => state.value = state.value.copyWith(selectedParentGrade: val);
  void setParentYear(String val) => state.value = state.value.copyWith(selectedParentYear: val);
  void setParentChildrenCount(String val) => state.value = state.value.copyWith(selectedParentChildrenCount: val);

  // Filtered Parent List
  List<ParentModel> get filteredParents {
    final query = state.value.parentQuery.trim().toLowerCase();
    final batch = state.value.selectedParentBatch;
    final grade = state.value.selectedParentGrade;
    final year = state.value.selectedParentYear;
    final count = state.value.selectedParentChildrenCount;

    return state.value.parents.where((p) {
      if (query.isNotEmpty) {
        final matches = p.fullName.toLowerCase().contains(query) ||
            p.phone.contains(query) ||
            p.whatsapp.contains(query);
        if (!matches) return false;
      }

      // Check linked children details
      final childrenList = state.value.students.where((s) => p.childrenIds.contains(s.id)).toList();
      if (batch != "الكل" && !childrenList.any((c) => c.batch == batch)) return false;
      if (grade != "الكل" && !childrenList.any((c) => c.grade == grade)) return false;
      if (year != "الكل" && !childrenList.any((c) => c.schoolYear == year)) return false;

      if (count != "الكل") {
        final len = p.childrenIds.length;
        if (count == "1" && len != 1) return false;
        if (count == "2" && len != 2) return false;
        if (count == "3+" && len < 3) return false;
      }

      return true;
    }).toList();
  }

  // ----------------------------------------------------
  // Student Actions
  // ----------------------------------------------------
  void toggleStudentStatus(StudentModel student) {
    final updated = student.copyWith(isActive: !student.isActive);
    final list = List<StudentModel>.from(state.value.students);
    final idx = list.indexWhere((s) => s.id == student.id);
    if (idx != -1) {
      list[idx] = updated;
      state.value = state.value.copyWith(students: list);
      Get.snackbar(
        "تحديث الحالة",
        updated.isActive ? "تم تفعيل حساب الطالب بنجاح" : "تم إيقاف حساب الطالب بنجاح",
        backgroundColor: updated.isActive ? Colors.green : Colors.orange,
        colorText: Colors.white,
      );
    }
  }

  void saveNotes(StudentModel student, String note) {
    final updated = student.copyWith(internalNotes: note);
    final list = List<StudentModel>.from(state.value.students);
    final idx = list.indexWhere((s) => s.id == student.id);
    if (idx != -1) {
      list[idx] = updated;
      state.value = state.value.copyWith(students: list);
      Get.snackbar("تم الحفظ", "تم حفظ الملاحظات الداخلية بنجاح.");
    }
  }

  void deleteStudent(StudentModel student) {
    final list = List<StudentModel>.from(state.value.students)..removeWhere((s) => s.id == student.id);
    state.value = state.value.copyWith(students: list);
    Get.snackbar("حذف", "تم حذف الطالب بنجاح من النظام.", backgroundColor: Colors.red, colorText: Colors.white);
  }

  // ----------------------------------------------------
  // Chatbot Toggles
  // ----------------------------------------------------
  void toggleReport(String reportName) {
    final current = Map<String, bool>.from(state.value.enabledReports);
    current[reportName] = !(current[reportName] ?? false);
    state.value = state.value.copyWith(enabledReports: current);
    Get.snackbar("تحديث الإعدادات", "تم تغيير حالة تقرير '$reportName'.");
  }

  // ----------------------------------------------------
  // Student Registration Form
  // ----------------------------------------------------
  void registerStudent({
    required String name,
    required String studentPhone,
    required String parentPhone,
    required String parentWhatsapp,
    required String grade,
    required String batch,
    required String schoolYear,
  }) {
    final studentId = "ST-${100 + state.value.students.length + 1}";
    
    // 1. Create Student
    final newStudent = StudentModel(
      id: studentId,
      fullName: name,
      phone: studentPhone,
      parentPhone: parentPhone,
      parentWhatsapp: parentWhatsapp,
      grade: grade,
      batch: batch,
      schoolYear: schoolYear,
      subscriptionStatus: "نشط",
      publishDate: DateTime.now(), // dummy fallback
    );

    // 2. Link or create Parent Account
    final parentList = List<ParentModel>.from(state.value.parents);
    final existingIdx = parentList.indexWhere((p) => p.phone == parentPhone);

    if (existingIdx != -1) {
      // Link child to existing parent
      final parent = parentList[existingIdx];
      final kids = List<String>.from(parent.childrenIds);
      if (!kids.contains(studentId)) kids.add(studentId);
      parentList[existingIdx] = parent.copyWith(childrenIds: kids);
    } else {
      // Create new parent
      final parentId = "PR-${200 + parentList.length + 1}";
      final newParent = ParentModel(
        id: parentId,
        fullName: "ولي أمر $name",
        phone: parentPhone,
        whatsapp: parentWhatsapp,
        childrenIds: [studentId],
      );
      parentList.add(newParent);
    }

    final studentList = List<StudentModel>.from(state.value.students)..insert(0, newStudent);
    state.value = state.value.copyWith(
      students: studentList,
      parents: parentList,
    );

    Get.snackbar(
      "تسجيل ناجح",
      "تم تسجيل الطالب '$name' وإنشاء/تحديث حساب ولي الأمر بنجاح.",
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  // ----------------------------------------------------
  // Bulk WhatsApp Messaging
  // ----------------------------------------------------
  void sendBulkWhatsapp({
    required List<String> targetGroups,
    required String messageType,
    required String messageText,
  }) {
    Get.snackbar(
      "إرسال ناجح",
      "جاري معالجة وإرسال الرسائل الجماعية لـ (${targetGroups.join(', ')}) عبر الشات بوت بنجاح.",
      backgroundColor: const Color(0xFF7C3AED),
      colorText: Colors.white,
      duration: const Duration(seconds: 4),
    );
  }

  void sendParentWhatsapp(ParentModel parent, String text) {
    Get.snackbar(
      "إرسال WhatsApp",
      "تم إرسال الرسالة إلى ولي الأمر ${parent.fullName} بنجاح.",
      backgroundColor: const Color(0xFF2563EB),
      colorText: Colors.white,
    );
  }
}
