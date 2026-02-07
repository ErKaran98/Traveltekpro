import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> slideAnim;
  late Animation<double> logoFade;

  @override
  void onInit() {
    super.onInit();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    slideAnim = Tween<double>(begin: 0, end: -1).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );

    logoFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.2, 1),
      ),
    );

    controller.forward();

    Future.delayed(const Duration(seconds: 4), () {
      // Get.offAllNamed("/home");
    });
  }
}