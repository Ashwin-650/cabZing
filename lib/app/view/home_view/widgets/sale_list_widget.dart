import 'package:cabzing/core/style/app_font_family.dart';
import 'package:cabzing/shared/widgets/app_svg.dart';
import 'package:cabzing/shared/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SaleListWidget extends StatelessWidget {
  const SaleListWidget({
    super.key,
    required this.svgName,
    required this.title,
    required this.subtitle,
    required this.type,
    required this.colorCode,
    required this.onTap,
  });
  final String svgName;
  final String title;
  final String subtitle;
  final String type;
  final int colorCode;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 18, right: 28, top: 18, bottom: 18).r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(33.r),
        color: Color(0xff0F0F0F),
      ),
      child: Row(
        spacing: 15.w,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 36.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(111.r),
              color: Color(colorCode),
            ),
            child: AppSvg(assetName: svgName),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title,
                  family: poppins4Regular,
                  color: Color(colorCode),
                ),
                AppText(
                  subtitle,
                  family: poppins4Regular,
                  color: Colors.white,
                  size: 22.sp,
                ),
                AppText(
                  type,
                  family: poppins4Regular,
                  color: Color(0xff565656),
                  size: 14.sp,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.all(26).r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.r),
                color: Color(0xff1E1E1E),
              ),
              child: AppSvg(height: 24.h, assetName: 'arrow_right'),
            ),
          ),
        ],
      ),
    );
  }
}
