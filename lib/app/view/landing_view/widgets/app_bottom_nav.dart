import 'package:cabzing/shared/widgets/app_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBottomNav extends StatelessWidget {
  const AppBottomNav({
    super.key,
    required this.onTap,
    required this.currentIndex,
  });
  final void Function(int index) onTap;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    final activeIcons = [
      "active_home",
      "active_route",
      "active_notification",
      "active_profile",
    ];
    final inactiveIcons = [
      "inactive_home",
      "inactive_route",
      "inactive_notification",
      "inactive_profile",
    ];

    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      currentIndex: currentIndex,
      onTap: onTap,
      items: List.generate(
        activeIcons.length,
        (index) => BottomNavigationBarItem(
          label: '',
          icon: NavIcon(svgName: inactiveIcons[index], isSelected: false),
          activeIcon: NavIcon(svgName: activeIcons[index], isSelected: true),
        ),
      ),
    );
  }
}

class NavIcon extends StatelessWidget {
  const NavIcon({super.key, required this.svgName, required this.isSelected});
  final String svgName;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 8.h,
      children: [
        AppSvg(assetName: svgName, height: 28.h, width: 28.w),
        isSelected ? AppSvg(assetName: 'white_dot') : SizedBox.shrink(),
      ],
    );
  }
}
