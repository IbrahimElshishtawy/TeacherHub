import 'package:flutter/material.dart';

class ManagementMonthSelector extends StatelessWidget {
  const ManagementMonthSelector({
    super.key,
    required this.months,
    required this.selectedMonth,
    required this.onSelected,
    this.reverse = true,
  });

  final List<String> months;
  final String selectedMonth;
  final ValueChanged<String> onSelected;
  final bool reverse;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: 38,
        child: ListView.separated(
          reverse: reverse,
          scrollDirection: Axis.horizontal,
          itemCount: months.length,
          separatorBuilder: (_, __) => const SizedBox(width: 4),
          padding: const EdgeInsets.symmetric(horizontal: 6),
          itemBuilder: (context, i) {
            final m = months[i];
            final isSelected = m == selectedMonth;

            return InkWell(
              borderRadius: BorderRadius.circular(22),
              onTap: () => onSelected(m),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFF2F78FF) : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSelected
                        ? const Color(0xFF2F78FF)
                        : const Color(0xFFE0E0E0),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 10,
                      offset: Offset(0, 6),
                      color: Color(0x14000000),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    m,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: isSelected
                          ? Colors.white
                          : const Color(0xFF202020),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
