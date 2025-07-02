import 'package:cabzing/app/controllers/sale_list_view_controller.dart';
import 'package:cabzing/app/view/filter_view/filter_view.dart';
import 'package:cabzing/core/style/app_colors.dart';
import 'package:cabzing/core/style/app_font_family.dart';
import 'package:cabzing/shared/widgets/app_svg.dart';
import 'package:cabzing/shared/widgets/app_text.dart';
import 'package:cabzing/shared/widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SaleListView extends StatelessWidget {
  const SaleListView({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(SaleListViewController());
    return Scaffold(
      appBar: AppBar(title: AppText('Invoices', size: 16.sp)),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: AppColors.borderBlue),
                bottom: BorderSide(color: AppColors.borderBlue),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 12.w,
              children: [
                Expanded(
                  child: Container(
                    height: 50.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 14.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: Color(0xff08131E),
                      border: Border.all(color: AppColors.borderBlue),
                    ),
                    child: TextField(
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: poppins4Regular,
                      ),
                      onChanged: (value) => ctrl.searchSalesList(value),
                      decoration: InputDecoration(
                        isDense: true,
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          color: Color(0xff8A8A8A),
                          fontFamily: poppins4Regular,
                          fontSize: 14.sp,
                        ),
                        prefixIcon: AppSvg(assetName: 'Magnifier'),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => FilterView());
                  },
                  child: Container(
                    height: 50.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xff1B2B30),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      spacing: 8.w,
                      children: [
                        AppSvg(assetName: 'filter'),
                        AppText(
                          'Add filter',
                          color: Colors.white,
                          family: poppins4Regular,
                          size: 15.sp,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () => ctrl.salesList.isEmpty
                  ? Center(child: Text("No data available"))
                  : ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          contentPadding: EdgeInsets.only(
                            right: 22.w,
                            top: 8.h,
                            bottom: 8.h,
                          ),
                          title: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AppText(
                                '#',
                                family: poppins4Regular,
                                size: 13.sp,
                                color: Color(0xff7D7D7D),
                              ),
                              AppText(
                                ctrl.salesList[index].voucherNo,
                                family: poppins4Regular,
                                size: 13.sp,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          subtitle: AppText(
                            ctrl.salesList[index].customerName,
                            family: poppins5Medium,
                            size: 14.sp,
                            color: Colors.white,
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppText(
                                ctrl.salesList[index].status,
                                family: poppins4Regular,
                                size: 13.sp,
                                color: Color(0xff1C60E2),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  AppText(
                                    'SAR.',
                                    family: poppins4Regular,
                                    color: Color(0xff888888),
                                    size: 12.sp,
                                  ),
                                  AppText(
                                    ctrl.salesList[index].grandTotal,

                                    family: poppins4Regular,
                                    color: Colors.white,
                                    size: 14.sp,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => CustomDivider(),

                      itemCount: ctrl.salesList.length,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
