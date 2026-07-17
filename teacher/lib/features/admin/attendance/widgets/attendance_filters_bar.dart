// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class AttendanceFiltersBar extends StatelessWidget {
  final String query;
  final String filterGrade;
  final String filterBatch;
  final String filterSubject;
  final String filterSession;
  final String filterStatus;
  final ValueChanged<String> onQueryChanged;
  final ValueChanged<String> onGradeChanged;
  final ValueChanged<String> onBatchChanged;
  final ValueChanged<String> onSubjectChanged;
  final ValueChanged<String> onSessionChanged;
  final ValueChanged<String> onStatusChanged;
  final VoidCallback onClearFilters;

  const AttendanceFiltersBar({
    super.key,
    required this.query,
    required this.filterGrade,
    required this.filterBatch,
    required this.filterSubject,
    required this.filterSession,
    required this.filterStatus,
    required this.onQueryChanged,
    required this.onGradeChanged,
    required this.onBatchChanged,
    required this.onSubjectChanged,
    required this.onSessionChanged,
    required this.onStatusChanged,
    required this.onClearFilters,
  });

  static const _grades = [
    'الكل',
    'الصف الأول الثانوي',
    'الصف الثاني الثانوي',
    'الصف الثالث الثانوي',
  ];
  static const _batches = [
    'الكل',
    'الدفعة الأولى 2026',
    'الدفعة الثانية 2026',
    'الدفعة الثالثة 2026',
  ];
  static const _subjects = [
    'الكل',
    'الرياضيات',
    'الفيزياء',
    'الكيمياء',
    'الأحياء',
    'اللغة العربية',
    'اللغة الإنجليزية',
  ];
  static const _sessions = [
    'الكل',
    'الحصة الأولى',
    'الحصة الثانية',
    'الحصة الثالثة',
  ];
  static const _statuses = ['الكل', 'حاضر', 'غائب', 'متأخر'];

  @override
  Widget build(BuildContext context) {
    final hasActiveFilters = filterGrade != 'الكل' ||
        filterBatch != 'الكل' ||
        filterSubject != 'الكل' ||
        filterSession != 'الكل' ||
        filterStatus != 'الكل';

    return Column(
      children: [
        // Search
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: TextField(
            onChanged: onQueryChanged,
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              hintText: 'ابحث باسم الطالب أو رقمه أو الكود...',
              hintStyle:
                  TextStyle(fontSize: 13.5, color: Colors.grey.shade400),
              prefixIcon:
                  Icon(Icons.search_rounded, color: Colors.grey.shade400),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 14),
            ),
          ),
        ),
        const SizedBox(height: 10),
        // Filter chips row
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              if (hasActiveFilters) ...[
                _ClearChip(onTap: onClearFilters),
                const SizedBox(width: 8),
              ],
              _FilterDropdown(
                label: 'الصف',
                icon: Icons.school_rounded,
                value: filterGrade,
                items: _grades,
                onChanged: onGradeChanged,
                color: const Color(0xFF6366F1),
              ),
              const SizedBox(width: 8),
              _FilterDropdown(
                label: 'الدفعة',
                icon: Icons.group_rounded,
                value: filterBatch,
                items: _batches,
                onChanged: onBatchChanged,
                color: const Color(0xFF0891B2),
              ),
              const SizedBox(width: 8),
              _FilterDropdown(
                label: 'المادة',
                icon: Icons.book_rounded,
                value: filterSubject,
                items: _subjects,
                onChanged: onSubjectChanged,
                color: const Color(0xFF7C3AED),
              ),
              const SizedBox(width: 8),
              _FilterDropdown(
                label: 'الحصة',
                icon: Icons.access_time_rounded,
                value: filterSession,
                items: _sessions,
                onChanged: onSessionChanged,
                color: const Color(0xFFF59E0B),
              ),
              const SizedBox(width: 8),
              _FilterDropdown(
                label: 'الحالة',
                icon: Icons.filter_list_rounded,
                value: filterStatus,
                items: _statuses,
                onChanged: onStatusChanged,
                color: const Color(0xFF22C55E),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _FilterDropdown extends StatelessWidget {
  final String label;
  final IconData icon;
  final String value;
  final List<String> items;
  final ValueChanged<String> onChanged;
  final Color color;

  const _FilterDropdown({
    required this.label,
    required this.icon,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isActive = value != 'الكل';
    return GestureDetector(
      onTap: () async {
        final result = await showModalBottomSheet<String>(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (_) => _FilterBottomSheet(
            title: label,
            items: items,
            selected: value,
            color: color,
          ),
        );
        if (result != null) onChanged(result);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? color : Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isActive ? color : Colors.grey.shade200,
            width: 1.5,
          ),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: color.withOpacity(0.25),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  )
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  )
                ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon,
                size: 14,
                color: isActive ? Colors.white : Colors.grey.shade600),
            const SizedBox(width: 5),
            Text(
              isActive ? value : label,
              style: TextStyle(
                fontSize: 12.5,
                fontWeight: FontWeight.w600,
                color: isActive ? Colors.white : Colors.grey.shade700,
              ),
            ),
            const SizedBox(width: 3),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 14,
              color: isActive ? Colors.white : Colors.grey.shade500,
            ),
          ],
        ),
      ),
    );
  }
}

class _ClearChip extends StatelessWidget {
  final VoidCallback onTap;
  const _ClearChip({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFEF4444).withOpacity(0.1),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
              color: const Color(0xFFEF4444).withOpacity(0.3)),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.clear_rounded,
                size: 13, color: Color(0xFFEF4444)),
            SizedBox(width: 4),
            Text(
              'مسح الفلاتر',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFFEF4444),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterBottomSheet extends StatefulWidget {
  final String title;
  final List<String> items;
  final String selected;
  final Color color;
  const _FilterBottomSheet({
    required this.title,
    required this.items,
    required this.selected,
    required this.color,
  });

  @override
  State<_FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<_FilterBottomSheet> {
  late String _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Icon(Icons.filter_list_rounded,
                    color: widget.color, size: 20),
                const SizedBox(width: 8),
                Text(
                  'تصفية: ${widget.title}',
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1E293B),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ...widget.items.map((item) {
            final isSelected = item == _selected;
            return ListTile(
              onTap: () {
                setState(() => _selected = item);
                Navigator.pop(context, item);
              },
              leading: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? widget.color : Colors.transparent,
                  border: Border.all(
                    color: isSelected ? widget.color : Colors.grey.shade300,
                    width: 2,
                  ),
                ),
                child: isSelected
                    ? const Icon(Icons.check, size: 14, color: Colors.white)
                    : null,
              ),
              title: Text(
                item,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight:
                      isSelected ? FontWeight.w700 : FontWeight.w500,
                  color: isSelected ? widget.color : const Color(0xFF374151),
                ),
              ),
            );
          }),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
