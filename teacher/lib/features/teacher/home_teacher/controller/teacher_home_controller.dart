// ignore_for_file: camel_case_types, file_names

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher/features/teacher/home_teacher/state/home_state.dart';

class teacherHomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final state = teacherHomeState().obs;

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
      update(['drawer_teacher']);
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
