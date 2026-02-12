import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentSearchCard extends StatelessWidget {
  final String type;
  final String city;
  final String date;
  final String detail;

  const RecentSearchCard({
    super.key,
    required this.type,
    required this.city,
    required this.date,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffDFE0E4)),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            type.toUpperCase(),
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: Color(0xff4757E4),
            ),
          ),
          SizedBox(height: 1.h),
          Text(
            city,
            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 1.h),
          Text(
            date,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xff545C5C),
            ),
          ),
          SizedBox(height: 1.h),
          Text(
            detail,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xff545C5C),
            ),
          ),
        ],
      ),
    );
  }
}
