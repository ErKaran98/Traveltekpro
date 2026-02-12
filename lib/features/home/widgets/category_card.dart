import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback? onTap;
  final bool isSelected;

  const CategoryItem({
    super.key,
    required this.title,
    required this.iconPath,
    this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 59.h,
        width: 80.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.r),
          border: isSelected
              ? Border.all(
                  color: isSelected ? Colors.grey : Colors.transparent,
                  width: 1.5.w,
                )
              : null,
        ),
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(vertical: 8.w),
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
                width: 30.w,
                child: SvgPicture.asset(iconPath, fit: BoxFit.contain),
              ),
              SizedBox(height: 4.h),
              Expanded(
                child: Center(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
