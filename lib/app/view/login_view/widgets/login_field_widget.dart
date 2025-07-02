import 'package:cabzing/app/controllers/login_view_controller.dart';
import 'package:cabzing/core/style/app_font_family.dart';
import 'package:cabzing/shared/widgets/app_svg.dart';
import 'package:cabzing/shared/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginFieldWidget extends StatelessWidget {
  const LoginFieldWidget({
    super.key,
    required this.svgName,
    required this.label,
    required this.hintText,
    this.isPassword = false,
    this.onPressed,
    required this.controller,
    this.validator,
  });
  final String svgName;
  final String label;
  final String hintText;
  final bool isPassword;
  final void Function()? onPressed;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<LoginViewController>();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Row(
        spacing: 20.w,
        children: [
          AppSvg(assetName: svgName),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  label,
                  color: Color(0xff7D7D7D),
                  size: 14.sp,
                  family: poppins4Regular,
                ),

                isPassword
                    ? Obx(
                        () => TextFormField(
                          validator: validator,
                          controller: controller,
                          obscureText: ctrl.isObsecure.value,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: poppins5Medium,
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            hintText: hintText,
                            hintStyle: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: poppins4Regular,
                            ),
                            isDense: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      )
                    : TextFormField(
                        validator: validator,
                        controller: controller,
                        obscureText: false,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: poppins5Medium,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          hintText: hintText,
                          hintStyle: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: poppins4Regular,
                          ),
                          isDense: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
              ],
            ),
          ),
          isPassword
              ? Obx(
                  () => AppSvg.clickable(
                    assetName: ctrl.isObsecure.value ? 'eye' : 'eye_closed',
                    onPressed: onPressed,
                  ),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
