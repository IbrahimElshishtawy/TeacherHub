import 'package:flutter/material.dart';
import 'widgets/user_chosea_typelogin.dart';

class UserTypeScreen extends StatefulWidget {
  const UserTypeScreen({super.key});

  @override
  State<UserTypeScreen> createState() => _UserTypeScreenState();
}

class _UserTypeScreenState extends State<UserTypeScreen> {
  int selectedIndex = -1;
  String selectedRoute = '';

  // دالة لإنشاء العناصر بشكل ديناميكي
  Widget _buildUserTypeOption(
    String title,
    String subtitle,
    String lottieAsset,
    int index,
    String route,
  ) {
    return UserChoseaTypelogin(
      title: title,
      subtitle: subtitle,
      lottieAsset: lottieAsset,
      isSelected: selectedIndex == index,
      onTap: () {
        setState(() {
          selectedIndex = index;
          selectedRoute = route;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),

              const Text(
                "من سيستخدم التطبيق؟",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 10),

              const Text(
                'يساعدنا هذا في تخصيص تجربتك داخل التطبيق',
                style: TextStyle(fontSize: 18, color: Colors.black54),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 20),

              // خيارات المستخدمين باستخدام الدالة _buildUserTypeOption
              _buildUserTypeOption(
                'Admin',
                'إدارة النظام والمستخدمين',
                'assets/lottie/admin.json',
                0,
                '/admin_login',
              ),
              _buildUserTypeOption(
                'Teacher',
                'إنشاء وإدارة الدروس',
                'assets/lottie/Teacher.json',
                1,
                '/teacher_login',
              ),
              _buildUserTypeOption(
                'Student',
                'التعلّم ومتابعة الدروس',
                'assets/lottie/Student transparent.json',
                2,
                '/student_login',
              ),
              _buildUserTypeOption(
                'Parent',
                'تابع تعلم أبنك ومتابعة دروسه بسهولة',
                'assets/lottie/Book loading.json',
                3,
                '/parent_login',
              ),

              const SizedBox(
                height: 20,
              ), // إضافة مسافة بين المحتوى وزر المتابعة
              // زر المتابعة يظهر بعد اختيار نوع المستخدم
              if (selectedIndex != -1)
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, selectedRoute);
                    },
                    child: const Text(
                      "متابعة",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
