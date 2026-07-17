import 'package:flutter/material.dart';
import '../state/attendance_state.dart';
import '../controller/attendance_controller.dart';

class ManualAttendanceSheet extends StatefulWidget {
  final AttendanceController controller;
  final AttendanceRecord? editRecord; // if editing existing

  const ManualAttendanceSheet({
    super.key,
    required this.controller,
    this.editRecord,
  });

  @override
  State<ManualAttendanceSheet> createState() => _ManualAttendanceSheetState();
}

class _ManualAttendanceSheetState extends State<ManualAttendanceSheet> {
  String _searchQuery = '';
  MockStudentEntry? _selectedStudent;
  AttendanceStatus _status = AttendanceStatus.present;
  String _notes = '';

  List<MockStudentEntry> get _filteredStudents {
    if (_searchQuery.isEmpty) {
      return widget.controller.state.value.students;
    }
    final q = _searchQuery.toLowerCase();
    return widget.controller.state.value.students
        .where((s) =>
            s.name.toLowerCase().contains(q) ||
            s.code.toLowerCase().contains(q))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.88,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        children: [
          // Handle
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF7C3AED), Color(0xFFA78BFA)],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.edit_note_rounded,
                      color: Colors.white, size: 22),
                ),
                const SizedBox(width: 12),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'تسجيل يدوي',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    Text(
                      'اختر الطالب وحدد الحالة',
                      style: TextStyle(
                          fontSize: 12.5, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Divider(height: 1),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Step 1: Search & Select Student
                  _SectionTitle(
                      number: '١', title: 'ابحث عن الطالب'),
                  const SizedBox(height: 10),
                  TextField(
                    onChanged: (v) => setState(() => _searchQuery = v),
                    decoration: InputDecoration(
                      hintText: 'اكتب اسم الطالب أو الكود...',
                      prefixIcon: const Icon(Icons.search_rounded),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide:
                            BorderSide(color: Colors.grey.shade200),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide:
                            BorderSide(color: Colors.grey.shade200),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(
                            color: Color(0xFF7C3AED), width: 2),
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade50,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Student list
                  Container(
                    constraints: const BoxConstraints(maxHeight: 220),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade100),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: _filteredStudents.length,
                        separatorBuilder: (_, _s) =>
                            Divider(height: 1, color: Colors.grey.shade100),
                        itemBuilder: (_, i) {
                          final s = _filteredStudents[i];
                          final isSelected = _selectedStudent?.id == s.id;
                          return ListTile(
                            onTap: () =>
                                setState(() => _selectedStudent = s),
                            dense: true,
                            selected: isSelected,
                            selectedTileColor: const Color(0xFF7C3AED)
                                .withOpacity(0.07),
                            leading: CircleAvatar(
                              radius: 18,
                              backgroundColor: const Color(0xFF7C3AED)
                                  .withOpacity(0.12),
                              child: Text(
                                s.name[0],
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF7C3AED),
                                ),
                              ),
                            ),
                            title: Text(
                              s.name,
                              style: TextStyle(
                                fontSize: 13.5,
                                fontWeight: isSelected
                                    ? FontWeight.w700
                                    : FontWeight.w500,
                                color: isSelected
                                    ? const Color(0xFF7C3AED)
                                    : const Color(0xFF1E293B),
                              ),
                            ),
                            subtitle: Text(
                              '${s.code} • ${s.batch}',
                              style: TextStyle(
                                  fontSize: 11, color: Colors.grey.shade500),
                            ),
                            trailing: isSelected
                                ? const Icon(Icons.check_circle_rounded,
                                    color: Color(0xFF7C3AED), size: 20)
                                : null,
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Step 2: Status
                  _SectionTitle(number: '٢', title: 'حدد حالة الحضور'),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                          child: _StatusOption(
                        label: 'حاضر',
                        icon: Icons.check_circle_rounded,
                        color: const Color(0xFF22C55E),
                        isSelected: _status == AttendanceStatus.present,
                        onTap: () =>
                            setState(() => _status = AttendanceStatus.present),
                      )),
                      const SizedBox(width: 10),
                      Expanded(
                          child: _StatusOption(
                        label: 'غائب',
                        icon: Icons.cancel_rounded,
                        color: const Color(0xFFEF4444),
                        isSelected: _status == AttendanceStatus.absent,
                        onTap: () =>
                            setState(() => _status = AttendanceStatus.absent),
                      )),
                      const SizedBox(width: 10),
                      Expanded(
                          child: _StatusOption(
                        label: 'متأخر',
                        icon: Icons.access_time_rounded,
                        color: const Color(0xFFF59E0B),
                        isSelected: _status == AttendanceStatus.late,
                        onTap: () =>
                            setState(() => _status = AttendanceStatus.late),
                      )),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Step 3: Notes
                  _SectionTitle(number: '٣', title: 'ملاحظات (اختياري)'),
                  const SizedBox(height: 10),
                  TextField(
                    onChanged: (v) => setState(() => _notes = v),
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'أضف ملاحظة أو سبب الغياب...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide:
                            BorderSide(color: Colors.grey.shade200),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide:
                            BorderSide(color: Colors.grey.shade200),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(
                            color: Color(0xFF7C3AED), width: 2),
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade50,
                    ),
                  ),
                  const SizedBox(height: 28),

                  // Save Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _selectedStudent == null
                          ? null
                          : () {
                              widget.controller.registerManualAttendance(
                                student: _selectedStudent!,
                                status: _status,
                                notes: _notes.isEmpty ? null : _notes,
                              );
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7C3AED),
                        foregroundColor: Colors.white,
                        disabledBackgroundColor: Colors.grey.shade200,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'حفظ الحضور',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String number;
  final String title;
  const _SectionTitle({required this.number, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: const Color(0xFF7C3AED),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              number,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1E293B),
          ),
        ),
      ],
    );
  }
}

class _StatusOption extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  const _StatusOption({
    required this.label,
    required this.icon,
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ? color : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? color : Colors.grey.shade200,
            width: 2,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: color.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  )
                ]
              : [],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,
                color: isSelected ? Colors.white : color, size: 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: isSelected ? Colors.white : color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
