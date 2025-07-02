import 'package:cabzing/app/controllers/profile_view_controller.dart';
import 'package:cabzing/app/view/login_view/login_view.dart';
import 'package:cabzing/core/constants/globals.dart';
import 'package:cabzing/core/services/shared_preferences_services.dart';
import 'package:cabzing/core/style/app_font_family.dart';
import 'package:cabzing/shared/widgets/app_svg.dart';
import 'package:cabzing/shared/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(ProfileViewController());

    return Obx(() {
      final data = ctrl.userData.value;
      final userPicture = ctrl.customerData.value?.photo;
      return (data == null)
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              body: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 35.h,
                      horizontal: 18.w,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 20.h,
                      horizontal: 18.w,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xff0F0F0F),
                      borderRadius: BorderRadius.circular(44).r,
                    ),
                    child: Column(
                      spacing: 20.h,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 8.h,
                                horizontal: 12.w,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(33).r,
                                color: Colors.black,
                              ),
                              child: userPicture != null
                                  ? Image.network(
                                      userPicture,
                                      height: 70.h,
                                      width: 50.w,
                                      fit: BoxFit.contain,
                                    )
                                  : Icon(Icons.image_not_supported),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                AppText(
                                  '${data.firstName} ${data.lastName}',
                                  family: poppins5Medium,
                                  size: 20.sp,
                                  color: Colors.white,
                                ),
                                AppText(
                                  data.email,
                                  family: poppins4Regular,
                                  size: 14.sp,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            AppSvg(assetName: 'edit'),
                          ],
                        ),
                        Row(
                          spacing: 12.w,
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 15.h,
                                  horizontal: 16.w,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(33).r,
                                ),
                                child: Row(
                                  spacing: 14.w,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 30.h,
                                        horizontal: 10.w,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          111,
                                        ).r,
                                        color: Color(0xffB5CDFE),
                                      ),
                                      child: AppSvg(assetName: 'three_star'),
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            AppText(
                                              '4.3',
                                              family: poppins4Regular,
                                              size: 18.sp,
                                              color: Colors.white,
                                            ),
                                            AppSvg(assetName: 'star'),
                                          ],
                                        ),
                                        AppText(
                                          '2,211',
                                          family: poppins4Regular,
                                          color: Color(0xff565656),
                                        ),
                                        AppText(
                                          'rides',
                                          family: poppins4Regular,
                                          color: Color(0xffB5CDFE),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 15.h,
                                  horizontal: 16.w,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(33).r,
                                ),
                                child: Row(
                                  spacing: 14.w,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 30.h,
                                        horizontal: 10.w,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          111,
                                        ).r,
                                        color: Color(0xffA9C9C5),
                                      ),
                                      child: AppSvg(assetName: 'shield_tick'),
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            AppText(
                                              'KYC',
                                              family: poppins4Regular,
                                              size: 18.sp,
                                              color: Colors.white,
                                            ),
                                            AppSvg(assetName: 'tick'),
                                          ],
                                        ),

                                        AppText(
                                          'Verified',
                                          family: poppins4Regular,
                                          color: Color(0xffB5CDFE),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: TextButton.icon(
                            style: ButtonStyle(
                              padding: WidgetStatePropertyAll(
                                EdgeInsets.symmetric(vertical: 22.h),
                              ),
                              backgroundColor: WidgetStatePropertyAll(
                                Colors.black,
                              ),
                            ),
                            onPressed: () async {
                              await SharedPreferencesServices.delete(
                                Globals.accessToken,
                              );
                              await SharedPreferencesServices.delete(
                                Globals.userId,
                              );
                              Get.offAll(() => LoginView());
                            },
                            label: AppText(
                              'Logout',
                              color: Color(0xffEA6262),
                              family: poppins4Regular,
                              size: 15.sp,
                            ),
                            icon: AppSvg(assetName: 'logout'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: List.generate(
                      5,
                      (index) => Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 15.h,
                          horizontal: 50.w,
                        ),
                        child: ListTile(
                          leading: AppSvg(assetName: ctrl.tiles[index][0]),
                          title: AppText(
                            ctrl.tiles[index][1],
                            family: poppins4Regular,
                            size: 15.sp,
                            color: Colors.white,
                          ),
                          trailing: AppSvg(assetName: 'arrow_small'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
    });
  }
}
