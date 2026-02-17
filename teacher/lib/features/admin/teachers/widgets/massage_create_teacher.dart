import 'package:flutter/material.dart';
import 'package:teacher/features/admin/teachers/view/create_teacher/steps/step_basic_info.dart';

void showCreateTeacherDialog(BuildContext parentContext) {
  // Create a StatefulDialog to manage the button visibility
  showDialog(
    context: parentContext,
    barrierDismissible: true,
    builder: (BuildContext dialogContext) {
      return StatefulBuilder(
        builder: (context, setState) {
          String selectedOption = ""; // Store selected option's description
          Color optionOneColor = const Color(0xFF2F6FED);

          // Dynamic message
          String message =
              'اختر الطريقة المناسبة لإنشاء حساب المدرس قبل المتابعة';

          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: SizedBox(
              width: 394,
              height: 300, // Adjusted the height to fit all buttons
              child: AlertDialog(
                insetPadding: EdgeInsets.zero,
                contentPadding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                actionsPadding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                title: Column(
                  children: [
                    Text(
                      "كيفية إنشاء حساب المدرس الجديد",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      message,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Option 1: Create teacher account without affecting the current account
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedOption =
                                "new_account"; // Track option selection
                            optionOneColor = const Color(
                              0xFF1E3D99,
                            ); // Highlight the selected button
                            // Dim the other button
                            message =
                                'تم اختيار إنشاء حساب جديد دون التأثير على الحساب الحالي';
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: optionOneColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'إنشاء حساب جديد دون التأثير على الحساب الحالي',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    'إنشاء حساب مدرس جديد دون التأثير على الحساب الحالي',
                                    style: TextStyle(
                                      fontSize: 8,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.add_circle_outline,
                              color: Colors.white,
                              size: 25,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 7),
                  ],
                ),
                actions: [
                  Center(
                    child: SizedBox(
                      width: 100,
                      height: 38,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(dialogContext);
                          Navigator.push(
                            parentContext,
                            MaterialPageRoute(
                              builder: (context) => StepBasicInfo(
                                selectedOption:
                                    selectedOption, // Pass the selected option
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3B82F6),
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "المتابعة",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
