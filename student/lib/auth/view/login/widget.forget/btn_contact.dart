import 'package:flutter/material.dart';
import 'package:teacher/features/auth/view/login/widget.forget/contact_button.dart';

class BtnContact extends StatelessWidget {
  const BtnContact({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ContactButton(
          textfrist: " تواصل معنا عبر ",
          texttwo: 'Facebook',
          imageAsset: 'assets/images/faccebook.png',
          color: Colors.blue,
          onTap: () {},
        ),
        ContactButton(
          textfrist: " تواصل معنا عبر ",
          texttwo: 'WhatsApp',
          imageAsset: 'assets/images/whatsapp.png',
          color: Colors.green,
          onTap: () {},
        ),
      ],
    );
  }
}
