import 'package:cabzing/app/controllers/filter_view_controller.dart';
import 'package:cabzing/core/style/app_colors.dart';
import 'package:cabzing/core/style/app_font_family.dart';
import 'package:cabzing/shared/widgets/app_svg.dart';
import 'package:cabzing/shared/widgets/app_text.dart';
import 'package:cabzing/shared/widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FilterView extends StatelessWidget {
  const FilterView({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(FilterViewController());
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.only(right: 26.w),
        title: AppText('Filters'),
        actions: [
          Row(
            spacing: 30.w,
            mainAxisSize: MainAxisSize.min,
            children: [
              AppSvg(assetName: 'eye'),
              AppText.click(
                onTap: () {
                  Get.back(closeOverlays: true);
                },
                'Filter',
                color: AppColors.appBlue,
                family: poppins4Regular,
              ),
            ],
          ),
        ],
      ),
      body: Column(
        spacing: 25.h,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 18.h),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: AppColors.borderBlue),
                bottom: BorderSide(color: AppColors.borderBlue),
              ),
            ),
            child: Column(
              spacing: 18.h,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 6.h,
                    horizontal: 15.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(41).r,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 14.w,
                    children: [
                      AppText(
                        'This Month',
                        family: poppins4Regular,
                        size: 15.sp,
                        color: Colors.white,
                      ),
                      AppSvg(assetName: 'arrow_down'),
                    ],
                  ),
                ),
                Row(
                  spacing: 12.w,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 8.h,
                        horizontal: 16.w,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xff1B2B30),

                        borderRadius: BorderRadius.circular(24).r,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 9.w,
                        children: [
                          AppSvg(assetName: 'calendar'),
                          AppText(
                            '12/09/2023',
                            family: poppins4Regular,
                            size: 15.sp,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 8.h,
                        horizontal: 16.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24).r,
                        color: Color(0xff1B2B30),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 9.w,
                        children: [
                          AppSvg(assetName: 'calendar'),
                          AppText(
                            '12/09/2023',
                            family: poppins4Regular,
                            size: 15.sp,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(ctrl.filters.length, (index) {
                final bool isSelected = ctrl.filterIndex.value == index;
                return GestureDetector(
                  onTap: () {
                    ctrl.changeIndex(index);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.h,
                      horizontal: 26.w,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected ? Color(0xff0E74F4) : Color(0xff1B2B30),
                      borderRadius: BorderRadius.circular(24).r,
                    ),
                    child: AppText(
                      ctrl.filters[index],
                      family: poppins4Regular,
                      size: 15.sp,
                      color: Colors.white,
                    ),
                  ),
                );
              }),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 26.w),
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8).r,
              color: Color(0xff08131E),
              border: Border.all(color: AppColors.borderBlue),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  'Customer',
                  family: poppins4Regular,
                  color: Color(0xffAEAEAE),
                ),
                AppSvg(assetName: 'arrow_down'),
              ],
            ),
          ),
          CustomDivider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 12.h,
                    horizontal: 15.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(41).r,
                    color: Color(0xff1B2B30),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 15,
                    children: [
                      AppText(
                        'savad farooque',
                        color: Colors.white,
                        family: poppins4Regular,
                        size: 15.sp,
                      ),
                      AppSvg(assetName: 'blue_cross'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
