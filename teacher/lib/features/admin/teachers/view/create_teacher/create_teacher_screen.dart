import 'package:flutter/material.dart';
import 'package:teacher/features/admin/teachers/view/create_teacher/steps/widgets/Create_Teacher_Header.dart';

class CreateTeacherScreen extends StatelessWidget {
  const CreateTeacherScreen({super.key, required String selectedOption});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('إنشاء حساب مدرس جديد')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Display the header and step indicator
            const CreateTeacherHeaderWidget(),

            // Add other content and form fields here...
          ],
        ),
      ),
    );
  }
}
