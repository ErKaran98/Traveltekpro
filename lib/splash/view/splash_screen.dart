import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:traveltekpro_task_karan/splash/controller/splash_controller.dart';
import 'package:traveltekpro_task_karan/splash/widgets/curve_clipper.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.white),
          AnimatedBuilder(
            animation: controller.controller,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(
                  0,
                  height * controller.slideAnim.value,
                ),
                child: child,
              );
            },
            child: ClipPath(
              clipper: WaveClipper(),
              child: Container(
                height: height,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF13C2C2),
                      Color(0xFF5E29CD),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              "assets/images/tree.png",
              fit: BoxFit.contain,
            ),
          ),

          Center(
            child: FadeTransition(
              opacity: controller.logoFade,
              child: Image.asset("assets/images/Logo.png")
            ),
          ),
        ],
      ),
    );
  }
}