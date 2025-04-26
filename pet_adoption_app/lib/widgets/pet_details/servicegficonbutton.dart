import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/components/button/gf_icon_button.dart';

class ServiceGfIconButton extends StatelessWidget {
  final int backgroundColor;
  final  Widget icon;
  const ServiceGfIconButton({super.key,required this.backgroundColor,required this.icon});

  @override
  Widget build(BuildContext context) {
    return GFIconButton(
        iconSize:0.04.sw,
      boxShadow: BoxShadow(
  color: Colors.black.withValues(alpha: 0.3),
  offset: Offset(4, 4),
  blurRadius: 2,
  spreadRadius: 0,
),

        color:  Color(backgroundColor),
        icon: icon,
        onPressed: () {});
  }
}
