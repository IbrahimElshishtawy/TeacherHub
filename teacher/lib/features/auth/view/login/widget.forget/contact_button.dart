// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class ContactButton extends StatelessWidget {
  final String textfrist;
  final String texttwo;
  final String imageAsset;
  final Color color;
  final VoidCallback onTap;

  const ContactButton({
    super.key,
    required this.texttwo,
    required this.textfrist,
    required this.imageAsset,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: const Color.fromARGB(242, 255, 255, 255),
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  texttwo,
                  style: TextStyle(
                    fontSize: 11,
                    color: color,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  textfrist,
                  style: TextStyle(
                    fontSize: 11,
                    color: color,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Image.asset(imageAsset, width: 20, height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
