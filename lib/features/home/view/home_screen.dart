import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:traveltekpro_task_karan/features/home/widgets/category_card.dart';
import 'package:traveltekpro_task_karan/features/home/widgets/info_tile.dart';
import '../controller/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 100.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/header.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Transform.translate(
              offset: Offset(0, 0),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(14.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24.r),
                    bottomRight: Radius.circular(24.r),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 20.r,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 84.h,
                      width: double.infinity,
                      child: Obx(
                        () => ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            CategoryItem(
                              title: "Hotels",
                              iconPath: "assets/icons/hotel.svg",
                              isSelected:
                                  controller.selectedCategory.value == 0,
                              onTap: () => controller.changeCategory(0),
                            ),

                            SizedBox(width: 10.w),

                            CategoryItem(
                              title: "Plane",
                              iconPath: "assets/icons/plane.svg",
                              isSelected:
                                  controller.selectedCategory.value == 1,
                              onTap: () => controller.changeCategory(1),
                            ),

                            SizedBox(width: 10.w),

                            CategoryItem(
                              title: "Life\nExperience",
                              iconPath: "assets/icons/map.svg",
                              isSelected:
                                  controller.selectedCategory.value == 2,
                              onTap: () => controller.changeCategory(2),
                            ),

                            SizedBox(width: 10.w),

                            CategoryItem(
                              title: "Cars",
                              iconPath: "assets/icons/cars.svg",
                              isSelected:
                                  controller.selectedCategory.value == 3,
                              onTap: () => controller.changeCategory(3),
                            ),

                            SizedBox(width: 10.w),

                            CategoryItem(
                              title: "Cruises",
                              iconPath: "assets/icons/shipe.svg",
                              isSelected:
                                  controller.selectedCategory.value == 4,
                              onTap: () => controller.changeCategory(4),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    InfoTile(
                      icon: Icons.location_on_outlined,
                      title: 'Destination',
                      valur: "Dubai,United Arab Emirates",
                      textColors: Colors.grey.shade600,
                    ),
                    SizedBox(height: 10.h),
                    InfoTile(
                      icon: Icons.calendar_month_outlined,
                      title: 'Date',
                      valur: "1 July - 3 July",
                    ),
                    SizedBox(height: 10.h),
                    InfoTile(
                      icon: Icons.person_outline,
                      title: 'Travellers',
                      valur: "2 Travellers - 1 room",
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      padding: EdgeInsets.all(12.w),
                      height: 56.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xff13C2C2), Color(0xff5E29CD)],
                        ),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Center(
                        child: Text(
                          'Search',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
