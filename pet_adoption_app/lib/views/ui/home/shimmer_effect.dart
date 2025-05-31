import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/components/shimmer/gf_shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            height: 300.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 20.w, top: 10.h),
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    GFShimmer(
                      child: Container(
                        width: 250.w,
                        height: 280.h,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                );
              },
              itemCount: 5, // you can customize how many shimmer items to show
            ),
          )
;
  }
}