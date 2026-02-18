import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../state/user_management_state.dart';

class UserManagementController extends GetxController {
  final Rx<UserManagementState> state = UserManagementState.initial.obs;

  @override
  void onInit() {
    super.onInit();
    loadStudentsData();
  }

  // =========================
  // Students: load / seed
  // =========================
  void loadStudentsData() {
    // Overview numbers (زي الصورة)
    const overview = StudentsOverview(
      active: 299,
      total: 320,
      suspended: 6,
      warned: 15,
    );

    // Table rows (زي الصور بتاعة الجدول)
    const students = [
      StudentRowModel(
        id: "#3352",
        fullName: "مصطفى أحمد هيكل",
        email: "MostafaH56@example.com",
        avatarUrl: "",
        phone: "01019038129",
        parentPhone: "01019038129",
        grade: "الصف الأول - إعدادي",
        isActive: true,
      ),
      StudentRowModel(
        id: "#3351",
        fullName: "إبراهيم أحمد سند",
        email: "IbrahimA9@example.com",
        avatarUrl: "",
        phone: "01099932151",
        parentPhone: "01099932151",
        grade: "الصف الثاني - ثانوي",
        isActive: true,
      ),
      StudentRowModel(
        id: "#3350",
        fullName: "هيام السيد مجدي",
        email: "HiamM50@example.com",
        avatarUrl: "",
        phone: "01136363691",
        parentPhone: "01136363691",
        grade: "الصف الأول - ثانوي",
        isActive: true,
      ),
      StudentRowModel(
        id: "#3349",
        fullName: "وفاء إبراهيم محمود",
        email: "WafaaG6@example.com",
        avatarUrl: "",
        phone: "01252521221",
        parentPhone: "01252521221",
        grade: "الصف الثالث - ثانوي",
        isActive: false,
      ),
    ];

    state.value = state.value.copyWith(
      studentsOverview: overview,
      students: students,
    );
  }

  // =========================
  // Students: view mode
  // =========================
  void openStudentsOverview() {
    state.value = state.value.copyWith(studentsMode: StudentsViewMode.overview);
  }

  void openStudentsTable() {
    state.value = state.value.copyWith(studentsMode: StudentsViewMode.table);
  }

  // =========================
  // Students: search
  // =========================
  void setStudentsQuery(String q) {
    state.value = state.value.copyWith(studentsQuery: q);
  }

  List<StudentRowModel> get filteredStudents {
    final q = state.value.studentsQuery.trim().toLowerCase();
    if (q.isEmpty) return state.value.students;

    return state.value.students.where((s) {
      return s.id.toLowerCase().contains(q) ||
          s.fullName.toLowerCase().contains(q) ||
          s.email.toLowerCase().contains(q) ||
          s.phone.toLowerCase().contains(q) ||
          s.parentPhone.toLowerCase().contains(q) ||
          s.grade.toLowerCase().contains(q) ||
          (s.isActive ? "نشط" : "موقوف").contains(q);
    }).toList();
  }

  // =========================
  // Students: actions
  // =========================
  void onStudentActions(StudentRowModel s) {
    // BottomSheet للإجراءات (زي زر الإجراءات في الجدول)
    Get.bottomSheet(
      _StudentActionsSheet(
            student: s,
            onToggleStatus: () => toggleStudentStatus(s.id),
            onViewProfile: () {
              Get.back();
              Get.snackbar("الطالب", "فتح ملف ${s.fullName} (لسه هنعملها)");
            },
            onEdit: () {
              Get.back();
              Get.snackbar("تعديل", "تعديل بيانات ${s.fullName} (لسه هنعملها)");
            },
          )
          as Widget,
      isScrollControlled: false,
      backgroundColor: const Color(0x00000000),
    );
  }

  void toggleStudentStatus(String id) {
    final current = state.value.students;
    final updated = current.map((s) {
      if (s.id == id) {
        return StudentRowModel(
          id: s.id,
          fullName: s.fullName,
          email: s.email,
          avatarUrl: s.avatarUrl,
          phone: s.phone,
          parentPhone: s.parentPhone,
          grade: s.grade,
          isActive: !s.isActive,
        );
      }
      return s;
    }).toList();

    // تحديث overview سريع (اختياري) على حسب الحالة
    final newActiveCount = updated.where((e) => e.isActive).length;
    final newSuspendedCount = updated.where((e) => !e.isActive).length;

    state.value = state.value.copyWith(
      students: updated,
      studentsOverview: state.value.studentsOverview.copyWith(
        active: newActiveCount,
        suspended: newSuspendedCount,
        total: updated.length,
      ),
    );

    Get.back();
    Get.snackbar("تم", "تم تغيير حالة الطالب");
  }

  // =========================
  // Export
  // =========================
  void exportStudents() {
    Get.snackbar("Export", "تصدير البيانات (قريباً)");
  }
}

// ======================================================
// Bottom Sheet Widget (داخل نفس الملف عشان يكون سهل)
// ======================================================
class _StudentActionsSheet extends StatelessWidget {
  final StudentRowModel student;
  final VoidCallback onToggleStatus;
  final VoidCallback onViewProfile;
  final VoidCallback onEdit;

  const _StudentActionsSheet({
    required this.student,
    required this.onToggleStatus,
    required this.onViewProfile,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 18),
      decoration: const BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 42,
            height: 5,
            decoration: BoxDecoration(
              color: const Color(0xFFE6E8F0),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "إجراءات ${student.id}",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 12),

          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text("عرض الملف"),
            onTap: onViewProfile,
          ),
          ListTile(
            leading: const Icon(Icons.edit_outlined),
            title: const Text("تعديل البيانات"),
            onTap: onEdit,
          ),
          ListTile(
            leading: Icon(
              student.isActive
                  ? Icons.block_outlined
                  : Icons.check_circle_outline,
              color: student.isActive
                  ? const Color(0xFFE53935)
                  : const Color(0xFF19B66A),
            ),
            title: Text(student.isActive ? "إيقاف الحساب" : "تفعيل الحساب"),
            onTap: onToggleStatus,
          ),

          const SizedBox(height: 6),
        ],
      ),
    );
  }
}
