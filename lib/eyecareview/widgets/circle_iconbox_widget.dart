import 'package:app_demo/eyecareview/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CircleIconBox extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const CircleIconBox({super.key, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.divider),
          // borderRadius: BorderRadius.circular(10),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.black),
      ),
    );
  }
}
