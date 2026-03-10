import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/notification_student_controller.dart';
import '../widgets/notification_student_card.dart';

class NotificationStudentScreen extends GetView<NotificationStudentController> {
  const NotificationStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = controller.state.value;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF2F3F7),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Column(
              children: [
                Row(
                  textDirection: TextDirection.ltr,
                  children: [
                    IconButton(
                      onPressed: controller.backHome,
                      icon: const Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: Color(0xFF9A1111),
                      ),
                    ),
                    const Expanded(
                      child: Column(
                        children: [
                          Text(
                            'الاشعارات',
                            style: TextStyle(
                              color: Color(0xFF161616),
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'تابع آخر التحديثات والتنبيهات المتعلقة بحسابك أولًا بأول.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF767676),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 48),
                  ],
                ),
                const SizedBox(height: 18),
                Expanded(
                  child: ListView.separated(
                    itemCount: state.items.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 10),
                    itemBuilder: (_, index) {
                      return NotificationStudentCard(item: state.items[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
