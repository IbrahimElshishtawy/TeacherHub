import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../state/user_management_state.dart';

class UserManagementController extends GetxController {
  final Rx<UserManagementState> state = UserManagementState.initial.obs;

  @override
  void onInit() {
    super.onInit();
    _initializeData();
  }

  // =========================================================
  // ========================= Initialization =================
  // =========================================================

  void _initializeData() {
    loadStudentsData();
    loadParentsData();
  }

  // =========================================================
  // ========================= Students =======================
  // =========================================================

  void loadStudentsData() {
    const overview = StudentsOverview(
      active: 299,
      total: 320,
      suspended: 6,
      warned: 15,
    );

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

  void openStudentsOverview() {
    state.value = state.value.copyWith(studentsMode: StudentsViewMode.overview);
  }

  void openStudentsTable() {
    state.value = state.value.copyWith(studentsMode: StudentsViewMode.table);
  }

  void setStudentsQuery(String query) {
    state.value = state.value.copyWith(studentsQuery: query);
  }

  List<StudentRowModel> get filteredStudents {
    final query = state.value.studentsQuery.trim().toLowerCase();
    if (query.isEmpty) return state.value.students;

    return state.value.students.where((student) {
      return _studentMatchesQuery(student, query);
    }).toList();
  }

  bool _studentMatchesQuery(StudentRowModel student, String query) {
    final statusText = student.isActive ? "نشط" : "موقوف";
    return student.id.toLowerCase().contains(query) ||
        student.fullName.toLowerCase().contains(query) ||
        student.email.toLowerCase().contains(query) ||
        student.phone.toLowerCase().contains(query) ||
        student.parentPhone.toLowerCase().contains(query) ||
        student.grade.toLowerCase().contains(query) ||
        statusText.contains(query);
  }

  void onStudentActions(StudentRowModel student) {
    _showActionsBottomSheet(
      title: "إجراءات ${student.id}",
      isActive: student.isActive,
      onToggleStatus: () => toggleStudentStatus(student.id),
      onViewProfile: () => _viewStudentProfile(student),
      onEdit: () => _editStudent(student),
    );
  }

  void _viewStudentProfile(StudentRowModel student) {
    Get.back();
    _showSuccessSnackbar("الطالب", "فتح ملف ${student.fullName}");
  }

  void _editStudent(StudentRowModel student) {
    Get.back();
    _showSuccessSnackbar("تعديل", "تعديل بيانات ${student.fullName}");
  }

  void toggleStudentStatus(String id) {
    final updatedStudents = _updateStudentStatus(id);
    final newStats = _calculateStudentStats(updatedStudents);

    state.value = state.value.copyWith(
      students: updatedStudents,
      studentsOverview: state.value.studentsOverview.copyWith(
        active: newStats.active,
        suspended: newStats.suspended,
        total: newStats.total,
      ),
    );

    Get.back();
    _showSuccessSnackbar("تم", "تم تغيير حالة الطالب بنجاح");
  }

  List<StudentRowModel> _updateStudentStatus(String id) {
    return state.value.students.map((student) {
      if (student.id == id) {
        return student.copyWith(isActive: !student.isActive);
      }
      return student;
    }).toList();
  }

  ({int active, int suspended, int total}) _calculateStudentStats(
    List<StudentRowModel> students,
  ) {
    final active = students.where((s) => s.isActive).length;
    final suspended = students.where((s) => !s.isActive).length;
    return (active: active, suspended: suspended, total: students.length);
  }

  void exportStudents() {
    _showInfoSnackbar("Export", "تصدير بيانات الطلاب (قريباً)");
  }

  // =========================================================
  // ========================= Parents ========================
  // =========================================================

  void loadParentsData() {
    const overview = ParentsOverview(
      active: 299,
      total: 320,
      suspended: 6,
      warned: 15,
    );

    const parents = [
      ParentRowModel(
        id: "#3352",
        fullName: "أحمد السيد هيكل",
        avatarUrl: "",
        phone: "01019038129",
        whatsapp: "01019038129",
        linkedStudentId: "#3352",
        isActive: true,
      ),
      ParentRowModel(
        id: "#3351",
        fullName: "أحمد محمد سند",
        avatarUrl: "",
        phone: "01099932151",
        whatsapp: "01099932151",
        linkedStudentId: "#3351",
        isActive: true,
      ),
      ParentRowModel(
        id: "#3350",
        fullName: "السيد محمود مجدي",
        avatarUrl: "",
        phone: "01136363691",
        whatsapp: "01136363691",
        linkedStudentId: "#3350",
        isActive: true,
      ),
      ParentRowModel(
        id: "#3349",
        fullName: "محمد إبراهيم السيد",
        avatarUrl: "",
        phone: "01252521221",
        whatsapp: "01252521221",
        linkedStudentId: "#3349",
        isActive: false,
      ),
    ];

    state.value = state.value.copyWith(
      parentsOverview: overview,
      parents: parents,
    );
  }

  void openParentsOverview() {
    state.value = state.value.copyWith(parentsMode: ParentsViewMode.overview);
  }

  void openParentsTable() {
    state.value = state.value.copyWith(parentsMode: ParentsViewMode.table);
  }

  void setParentsQuery(String query) {
    state.value = state.value.copyWith(parentsQuery: query);
  }

  List<ParentRowModel> get filteredParents {
    final query = state.value.parentsQuery.trim().toLowerCase();
    if (query.isEmpty) return state.value.parents;

    return state.value.parents.where((parent) {
      return _parentMatchesQuery(parent, query);
    }).toList();
  }

  bool _parentMatchesQuery(ParentRowModel parent, String query) {
    final statusText = parent.isActive ? "نشط" : "موقوف";
    return parent.id.toLowerCase().contains(query) ||
        parent.fullName.toLowerCase().contains(query) ||
        parent.phone.toLowerCase().contains(query) ||
        parent.whatsapp.toLowerCase().contains(query) ||
        parent.linkedStudentId.toLowerCase().contains(query) ||
        statusText.contains(query);
  }

  void onParentActions(ParentRowModel parent) {
    _showActionsBottomSheet(
      title: "إجراءات ${parent.id}",
      isActive: parent.isActive,
      onToggleStatus: () => toggleParentStatus(parent.id),
      onViewProfile: () => _viewParentProfile(parent),
      onEdit: () => _editParent(parent),
      onSendStudentInfo: () => sendStudentInfoToParent(parent),
    );
  }

  void sendStudentInfoToParent(ParentRowModel parent) {
    Get.back();
    _showSuccessSnackbar(
      "تم الإرسال",
      "تم إرسال تقرير الطالب (الحضور، الدرجات، والمذاكرة) إلى ولي الأمر ${parent.fullName} بنجاح عبر الشات بوت.",
    );
  }

  void _viewParentProfile(ParentRowModel parent) {
    Get.back();
    _showSuccessSnackbar("ولي الأمر", "فتح ملف ${parent.fullName}");
  }

  void _editParent(ParentRowModel parent) {
    Get.back();
    _showSuccessSnackbar("تعديل", "تعديل بيانات ${parent.fullName}");
  }

  void toggleParentStatus(String id) {
    final updatedParents = _updateParentStatus(id);
    final newStats = _calculateParentStats(updatedParents);

    state.value = state.value.copyWith(
      parents: updatedParents,
      parentsOverview: state.value.parentsOverview.copyWith(
        active: newStats.active,
        suspended: newStats.suspended,
        total: newStats.total,
      ),
    );

    Get.back();
    _showSuccessSnackbar("تم", "تم تغيير حالة ولي الأمر بنجاح");
  }

  List<ParentRowModel> _updateParentStatus(String id) {
    return state.value.parents.map((parent) {
      if (parent.id == id) {
        return parent.copyWith(isActive: !parent.isActive);
      }
      return parent;
    }).toList();
  }

  ({int active, int suspended, int total}) _calculateParentStats(
    List<ParentRowModel> parents,
  ) {
    final active = parents.where((p) => p.isActive).length;
    final suspended = parents.where((p) => !p.isActive).length;
    return (active: active, suspended: suspended, total: parents.length);
  }

  void exportParents() {
    _showInfoSnackbar("Export", "تصدير بيانات أولياء الأمور (قريباً)");
  }

  void sendReportsToAllParents() {
    _showSuccessSnackbar(
      "إرسال جماعي",
      "تم إرسال تقارير الطلاب لجميع أولياء الأمور المسجلين بنجاح عبر الشات بوت.",
    );
  }

  // =========================================================
  // ========================= Helpers ========================
  // =========================================================

  void _showActionsBottomSheet({
    required String title,
    required bool isActive,
    required VoidCallback onToggleStatus,
    required VoidCallback onViewProfile,
    required VoidCallback onEdit,
    VoidCallback? onSendStudentInfo,
  }) {
    Get.bottomSheet(
      _ActionsBottomSheet(
        title: title,
        isActive: isActive,
        onToggleStatus: onToggleStatus,
        onViewProfile: onViewProfile,
        onEdit: onEdit,
        onSendStudentInfo: onSendStudentInfo,
      ),
      isScrollControlled: false,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      enableDrag: true,
    );
  }

  void _showSuccessSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF4CAF50).withValues(alpha: 0.9),
      colorText: Colors.white,
      borderRadius: 12,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 3),
      icon: const Icon(Icons.check_circle, color: Colors.white),
    );
  }

  void _showInfoSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF2196F3).withValues(alpha: 0.9),
      colorText: Colors.white,
      borderRadius: 12,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 3),
      icon: const Icon(Icons.info, color: Colors.white),
    );
  }
}

// ======================================================
// =================== Bottom Sheet =====================
// ======================================================

class _ActionsBottomSheet extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback onToggleStatus;
  final VoidCallback onViewProfile;
  final VoidCallback onEdit;
  final VoidCallback? onSendStudentInfo;

  const _ActionsBottomSheet({
    required this.title,
    required this.isActive,
    required this.onToggleStatus,
    required this.onViewProfile,
    required this.onEdit,
    this.onSendStudentInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: const Color(0xFFE6E8F0),
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Title
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w900,
                color: Color(0xFF1E2A3B),
                letterSpacing: 0.2,
              ),
            ),
          ),

          const Divider(height: 1, thickness: 1, color: Color(0xFFE6E8F0)),

          // Actions
          _ActionTile(
            icon: Icons.person_outline_rounded,
            iconColor: const Color(0xFF2F6BFF),
            title: "عرض الملف الشخصي",
            onTap: onViewProfile,
          ),
          _ActionTile(
            icon: Icons.edit_outlined,
            iconColor: const Color(0xFF9C27B0),
            title: "تعديل البيانات",
            onTap: onEdit,
          ),
          if (onSendStudentInfo != null)
            _ActionTile(
              icon: Icons.send_and_archive_outlined,
              iconColor: const Color(0xFFE65100),
              title: "إرسال تقرير الطالب لولي الأمر",
              onTap: onSendStudentInfo!,
            ),
          _ActionTile(
            icon: isActive
                ? Icons.block_outlined
                : Icons.check_circle_outline_rounded,
            iconColor: isActive
                ? const Color(0xFFE53935)
                : const Color(0xFF19B66A),
            title: isActive ? "إيقاف الحساب" : "تفعيل الحساب",
            onTap: onToggleStatus,
            isDestructive: isActive,
          ),

          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _ActionTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final VoidCallback onTap;
  final bool isDestructive;

  const _ActionTile({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.onTap,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: iconColor, size: 22),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: isDestructive
                        ? const Color(0xFFE53935)
                        : const Color(0xFF1E2A3B),
                    letterSpacing: 0.2,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: const Color(0xFFB0B5C3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
