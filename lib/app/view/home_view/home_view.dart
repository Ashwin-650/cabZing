import 'package:cabzing/app/controllers/home_view_controller.dart';
import 'package:cabzing/app/view/home_view/widgets/sale_list_widget.dart';
import 'package:cabzing/app/view/sale_list_view/sale_list_view.dart';
import 'package:cabzing/shared/widgets/app_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(HomeViewController());
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.only(right: 30.w),
        title: AppSvg(assetName: 'cabzing_logo'),
        actions: [
          Stack(
            children: [
              GestureDetector(
                onTap: () {
                  ctrl.changeStatus();
                },
                child: Container(
                  margin: EdgeInsets.all(10.r),
                  padding: EdgeInsets.all(6.r),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff141414),
                  ),
                  child: Image.asset('assets/images/dp.png'),
                ),
              ),
              Positioned(
                right: 0,
                child: Obx(
                  () => CircleAvatar(
                    backgroundColor: ctrl.isOnline.value
                        ? Color(0xff37C388)
                        : Color(0xffDB6E40),
                    radius: 7.r,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: Color(0xff0F0F0F),
              borderRadius: BorderRadius.circular(29.r),
            ),
            child: Image.asset('assets/images/chart.png'),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return SaleListWidget(
                  onTap: () {
                    Get.to(() => SaleListView());
                  },
                  svgName: ctrl.mockData[index][1],
                  title: ctrl.mockData[index][2],
                  subtitle: ctrl.mockData[index][3],
                  type: ctrl.mockData[index][4],
                  colorCode: ctrl.mockData[index][0],
                );
              },
              separatorBuilder: (context, index) => 9.verticalSpace,
              itemCount: ctrl.mockData.length,
            ),
          ),
        ],
      ),
    );
  }
}
