import 'package:flutter/material.dart';
import 'package:teacher/features/admin/teachers/view/create_teacher/create_teacher_screen.dart';

void showCreateTeacherDialog(BuildContext parentContext) {
  // Create a StatefulDialog to manage the button visibility
  showDialog(
    context: parentContext,
    barrierDismissible: true,
    builder: (BuildContext dialogContext) {
      return StatefulBuilder(
        builder: (context, setState) {
          bool isOptionSelected = false; // To track if an option is selected
          String selectedOption = ""; // Store selected option's description

          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: SizedBox(
              width: 394,
              height: 255,
              child: AlertDialog(
                insetPadding: EdgeInsets.zero,
                contentPadding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                actionsPadding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                title: Column(
                  children: const [
                    Text(
                      "كيفية إنشاء حساب المدرس الجديد",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 4),
                    Text(
                      "اختر الطريقة المناسبة لإنشاء حساب المدرس قبل المتابعة.",
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
                            isOptionSelected = true; // Set option selected
                            selectedOption =
                                "new_account"; // Track option selection
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2F6FED),
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
                                      color: Color.fromRGBO(
                                        255,
                                        255,
                                        255,
                                        0.981,
                                      ),
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
                                      color: Color.fromRGBO(
                                        255,
                                        255,
                                        255,
                                        0.981,
                                      ),
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
                    // Option 2: Create teacher account and disable the current account
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isOptionSelected = true; // Set option selected
                            selectedOption =
                                "disable_current"; // Track option selection
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            237,
                            47,
                            47,
                          ),
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
                                    'إنشاء حساب جديد مع إيقاف الحساب الحالي',
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Color.fromRGBO(
                                        255,
                                        255,
                                        255,
                                        0.981,
                                      ),
                                      fontWeight: FontWeight.w900,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 1),
                                  Text(
                                    'سيتم إنشاء حساب جديد مع إيقاف الحساب الحالي مؤقتًا.',
                                    style: TextStyle(
                                      fontSize: 8,
                                      color: Color.fromRGBO(
                                        255,
                                        255,
                                        255,
                                        0.981,
                                      ),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.block,
                              color: Colors.white,
                              size: 25,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
                actions: [
                  // Show "Continue" button only if an option is selected
                  if (isOptionSelected)
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
                                builder: (context) => CreateTeacherScreen(
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
