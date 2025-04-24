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
            offset: Offset(
              5,
              5,
            ),
            color: const Color.fromARGB(204, 0, 0, 0)),
        color:  Color(backgroundColor),
        icon: icon,
        onPressed: () {});
  }
}
