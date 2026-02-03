import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../state/home_state.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final state = HomeState().obs;

  late final AnimationController drawerController;
  late final Animation<double> drawerAnim;

  bool get isDrawerOpen => drawerController.value > 0.001;

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
      update(['drawer']);
    });
  }

  void openDrawer() => drawerController.forward();
  void closeDrawer() => drawerController.reverse();
  void toggleDrawer() => isDrawerOpen ? closeDrawer() : openDrawer();

  @override
  void onClose() {
    drawerController.dispose();
    super.onClose();
  }
}
