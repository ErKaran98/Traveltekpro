import 'package:get/get.dart';
import 'package:traveltekpro_task_karan/features/home/view/home_screen.dart';
import 'package:traveltekpro_task_karan/splash/controller/splash_controller.dart';
import 'package:traveltekpro_task_karan/splash/view/splash_screen.dart';

class AppPages {

  static const String INITIAL = '/splash';

  static final routes = [

    GetPage(
      name: '/splash',
      page: () => SplashScreen(),
      binding: BindingsBuilder(() {
        Get.put(SplashController());
      }),
    ),

    GetPage(
      name: '/home',
      page: () => const HomeView(),
    ),
  ];
}