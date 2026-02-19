import 'package:flutter/material.dart';

class SearchFilterRow extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final VoidCallback onFilter;

  const SearchFilterRow({
    super.key,
    required this.onChanged,
    required this.onFilter,
  });

  static const Color primaryBlue = Color(0xFF2F6BFF);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onFilter,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: primaryBlue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.filter_alt_outlined, color: Colors.white),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextField(
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: "ابحث بالاسم أو الرقم التعريفي أو الطالب",
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(vertical: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFFE6E8F0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFFE6E8F0)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
