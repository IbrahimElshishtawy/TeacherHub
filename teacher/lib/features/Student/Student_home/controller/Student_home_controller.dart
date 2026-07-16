// ignore_for_file: file_names

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/features/Student/Student_home/state/home_state.dart';

class StudentHomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final state = studentHomeState().obs;

  final userImageUrl = ''.obs;
  final userLocalPath = ''.obs;

  late final AnimationController drawerController;
  late final Animation<double> drawerAnim;

  double get t => drawerAnim.value;
  double get rawT => drawerController.value;

  bool get isDrawerOpen => rawT > 0.001;

  bool get hasLocalImage =>
      userLocalPath.value.trim().isNotEmpty &&
      File(userLocalPath.value.trim()).existsSync();

  bool get hasNetworkImage => userImageUrl.value.trim().isNotEmpty;

  @override
  void onInit() {
    super.onInit();

    drawerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 320),
      reverseDuration: const Duration(milliseconds: 260),
    );

    drawerAnim = CurvedAnimation(
      parent: drawerController,
      curve: Curves.easeOutCubic,
      reverseCurve: Curves.easeInCubic,
    );

    drawerController.addListener(() {
      update(['drawer_student']);
    });
  }

  void openDrawer() => drawerController.forward();
  void closeDrawer() => drawerController.reverse();
  void toggleDrawer() => isDrawerOpen ? closeDrawer() : openDrawer();

  void setPickedProfileImage(String path) {
    userLocalPath.value = path.trim();
  }

  void clearLocalProfileImage() {
    userLocalPath.value = '';
  }

  void setProfileImageUrl(String url) {
    userImageUrl.value = url.trim();
  }

  @override
  void onClose() {
    drawerController.dispose();
    super.onClose();
  }
}

class GeneralVideoModel {
  final String id;
  final String title;
  final String stage;
  final String videoUrl;
  final String part;

  const GeneralVideoModel({
    required this.id,
    required this.title,
    required this.stage,
    required this.videoUrl,
    required this.part,
  });
}

class GeneralVideosState {
  static final RxList<GeneralVideoModel> generalVideos = <GeneralVideoModel>[
    const GeneralVideoModel(
      id: "GEN-01",
      title: "محاضرة تعريفية عامة عن المنهج كيمياء",
      stage: "الصف الثالث الثانوي",
      part: "الباب الأول (مفاهيم كيميائية)",
      videoUrl: "https://drive.google.com/file/d/1234567890/view",
    ),
  ].obs;
}
