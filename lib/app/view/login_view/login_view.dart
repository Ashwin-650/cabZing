import 'package:cabzing/app/controllers/login_view_controller.dart';
import 'package:cabzing/app/view/login_view/widgets/login_field_widget.dart';
import 'package:cabzing/core/style/app_colors.dart';
import 'package:cabzing/core/style/app_font_family.dart';
import 'package:cabzing/shared/widgets/app_svg.dart';
import 'package:cabzing/shared/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(LoginViewController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 100.h,
        actionsPadding: EdgeInsets.only(right: 36.w),
        backgroundColor: Colors.transparent,
        actions: [
          Row(
            spacing: 5.w,
            mainAxisSize: MainAxisSize.min,
            children: [
              AppSvg(assetName: 'language'),
              AppText(
                'English',
                color: Colors.white,
                family: poppins4Regular,
                size: 14.sp,
              ),
            ],
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Component 195.png'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AppText(
              'Login',
              family: poppins5Medium,
              color: Colors.white,
              size: 21.sp,
            ),
            AppText(
              'Login to your vikn account',
              color: Color(0xff838383),
              family: poppins4Regular,
              size: 15.sp,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 26.h, horizontal: 48.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11.r),
                border: Border.all(color: AppColors.borderBlue),
              ),
              child: Form(
                key: ctrl.formKey,
                child: Column(
                  children: [
                    LoginFieldWidget(
                      controller: ctrl.userName,
                      svgName: 'user',
                      label: "Username",
                      hintText: 'Enter your Username ',
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'Email is required';
                        return null;
                      },
                    ),
                    Divider(color: AppColors.borderBlue),
                    LoginFieldWidget(
                      controller: ctrl.password,
                      svgName: 'key',
                      label: 'Password',
                      hintText: "Enter your Password ",
                      isPassword: true,
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'password is required';
                        return null;
                      },
                      onPressed: () {
                        ctrl.changeObsecure();
                      },
                    ),
                  ],
                ),
              ),
            ),
            AppText(
              'Forgotten Password?',
              color: AppColors.appBlue,
              size: 16.sp,
              family: poppins4Regular,
            ),
            35.verticalSpace,
            TextButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(AppColors.appBlue),
              ),
              onPressed: () {
                if (ctrl.formKey.currentState!.validate()) {
                  ctrl.signIn();
                } else {
                  Get.showSnackbar(
                    GetSnackBar(
                      message: 'Fill all fields',
                      duration: Duration(seconds: 3),
                    ),
                  );
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 9.w,
                children: [
                  AppText(
                    'Sign in',
                    family: poppins4Regular,
                    size: 16.sp,
                    color: Colors.white,
                  ),
                  AppSvg(assetName: 'arrow_right'),
                ],
              ),
            ),
            168.verticalSpace,
            AppText(
              'Don’t have an Account?',
              color: Colors.white,
              family: poppins4Regular,
              size: 15.sp,
            ),
            4.verticalSpace,
            AppText(
              'Sign up now!',
              size: 16.sp,
              family: poppins5Medium,
              color: AppColors.appBlue,
            ),
            50.verticalSpace,
          ],
        ),
      ),
    );
  }
}
