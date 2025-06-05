import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/components/button/gf_icon_button.dart';
import 'package:getwidget/shape/gf_icon_button_shape.dart';
import 'package:getwidget/size/gf_size.dart';

class SearchwithIcon extends StatelessWidget {
  final double constraints;
  const SearchwithIcon({super.key,required this.constraints});

  @override
  Widget build(BuildContext context,) {
    return Padding(
                  padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 10.h),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                            height: 45.h,
                            decoration: BoxDecoration(
                              color:const Color(0xFFE0DADA),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            padding: EdgeInsets.all(10.r),
                            child:const TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Search...",
                                  hintStyle: TextStyle(
                                      color:  Color(0xFF81678C))),
                            )),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: GFIconButton(
                            icon:const Icon(Icons.search),
                            onPressed: () {},
                            shape: GFIconButtonShape.standard,
                            color: const Color(0xFF827397),
                            size: constraints <= 360
                                ? GFSize.SMALL
                                : GFSize.MEDIUM,
                          )),
                    ],
                  ),
                );
  }
}