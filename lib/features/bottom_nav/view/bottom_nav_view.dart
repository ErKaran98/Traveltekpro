import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:traveltekpro_task_karan/features/home/view/home_screen.dart';
import '../controller/bottom_nav_controller.dart';

class BottomNavView extends GetView<BottomNavController> {
  const BottomNavView({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = [
      const HomeScreen(),
      const Center(child: Text("My Trips")),
      const Center(child: Text("Action")),
      const Center(child: Text("Wishlist")),
      const Center(child: Text("Account")),
    ];

    return Scaffold(
      backgroundColor: Colors.white,

      body: Obx(() {
        return pages[controller.selectedIndex.value];
      }),

      bottomNavigationBar: SizedBox(
        height: 72.h,

        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 68.h,
              padding: EdgeInsets.symmetric(horizontal: 29.w),

              decoration: BoxDecoration(
                color: Colors.white,

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 20.r,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  navItem(
                    iconPath: "assets/icons/home.svg",
                    title: "Home",
                    index: 0,
                  ),

                  navItem(
                    iconPath: "assets/icons/Frame.svg",
                    title: "My Trips",
                    index: 1,
                  ),

                  SizedBox(width: 20.w),

                  navItem(
                    iconPath: "assets/icons/heart.svg",
                    title: "Wishlist",
                    index: 3,
                  ),

                  navItem(
                    iconPath: "assets/icons/user.svg",
                    title: "Account",
                    index: 4,
                  ),
                ],
              ),
            ),
            Positioned(
              top: -86.h,
              left: 90.w,
              child: GestureDetector(
                onTap: () => controller.changeIndex(2),
                child: Center(
                  child: Image.asset(
                    "assets/images/centerButton.png",
                    height: 180.h,
                    width: 180.w,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget navItem({
    required String iconPath,
    required String title,
    required int index,
  }) {
    final isSelected = controller.selectedIndex.value == index;

    return GestureDetector(
      onTap: () => controller.changeIndex(index),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            height: 24.h,
            width: 24.w,

            // 👇 Color change on selection
            colorFilter: ColorFilter.mode(
              isSelected ? const Color(0xFF6A5AE0) : Colors.grey,
              BlendMode.srcIn,
            ),
          ),

          SizedBox(height: 4.h),

          Text(
            title,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: isSelected ? const Color(0xFF6A5AE0) : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
