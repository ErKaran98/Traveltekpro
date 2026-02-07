import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height * 0.22,
              width: double.infinity,

              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/header.png"),
                  fit: BoxFit.cover,
                  alignment: Alignment(0.7, -0),
                ),
              ),
            ),

            Transform.translate(
              offset: Offset(0, -height * 0.08),

              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(width * 0.05),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 20,
                    ),
                  ],
                ),

                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.10,

                      child: Obx(() {
                        return ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            categoryItem(
                              context,
                              0,
                              "Hotels",
                              "assets/icons/hotel.png",
                            ),

                            categoryItem(
                              context,
                              1,
                              "Flights",
                              "assets/icons/flight.png",
                            ),

                            categoryItem(
                              context,
                              2,
                              "Life\nExperience",
                              "assets/icons/map.png",
                            ),

                            categoryItem(
                              context,
                              3,
                              "Cars",
                              "assets/icons/car.png",
                            ),

                            categoryItem(
                              context,
                              4,
                              "Cruises",
                              "assets/icons/ship.png",
                            ),
                          ],
                        );
                      }),
                    ),

                    SizedBox(height: height * 0.03),

                    inputCard(
                      icon: Icons.location_on_outlined,
                      title: "Destination",
                      value: "Dubai, United Arab Emirates",
                    ),

                    SizedBox(height: height * 0.02),

                    inputCard(
                      icon: Icons.calendar_today_outlined,
                      title: "Date",
                      value: "1 July - 3 July",
                    ),

                    SizedBox(height: height * 0.02),
                    inputCard(
                      icon: Icons.person_outline,
                      title: "Travelers",
                      value: "2 Travelers - 1 room",
                    ),

                    SizedBox(height: height * 0.03),

                    Container(
                      height: height * 0.07,
                      width: double.infinity,

                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF5ED0C4), Color(0xFF6A5AE0)],
                        ),
                        borderRadius: BorderRadius.circular(18),
                      ),

                      child: const Center(
                        child: Text(
                          "Search",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget categoryItem(
    BuildContext context,
    int index,
    String title,
    String icon,
  ) {
    final width = MediaQuery.of(context).size.width;

    final isSelected = controller.selectedCategory.value == index;

    return GestureDetector(
      onTap: () => controller.changeCategory(index),

      child: Container(
        width: width * 0.22,
        margin: EdgeInsets.only(right: width * 0.03),

        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE8F0FE) : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade300,
          ),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon, width: width * 0.08),

            SizedBox(height: width * 0.02),

            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  Widget inputCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Row(
        children: [

          /// Icon
          Icon(
            icon,
            size: 26,
            color: Colors.black87,
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 4),
                
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
