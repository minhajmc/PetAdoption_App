import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/components/shimmer/gf_shimmer.dart';

class PetDetailsShimmereffect extends StatelessWidget {
  const PetDetailsShimmereffect({super.key});

  @override
  Widget build(BuildContext context) {
    return GFShimmer(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          
          children: [
            SizedBox(height: 40.h,),
            // Header Row


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 45.w,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                Container(
                  height: 20.h,
                  width: 60.w,
                  color: Colors.grey[300],
                ),
                Container(
                  height: 45.w,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ],
            ),

            SizedBox(height: 30.h),

            // Image Box
            Container(
              height: 0.38.sh,
              width: 1.sw,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
              ),
            ),

            SizedBox(height: 30.h),

            // Pet Name & Type
            Row(
              children: [
                Container(
                  height: 25.spMin,
                  width: 80.w,
                  color: Colors.grey[300],
                ),
                SizedBox(width: 10.w),
                Container(
                  height: 18.spMin,
                  width: 60.w,
                  color: Colors.grey[300],
                ),
              ],
            ),

            SizedBox(height: 20.h),

            // Location Row
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      height: 23.w,
                      width: 23.w,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      height: 2,
                      width: 15.w,
                      color: Colors.grey[300],
                    ),
                  ],
                ),
                SizedBox(width: 10.w),
                Container(
                  height: 18.spMin,
                  width: 60.w,
                  color: Colors.grey[300],
                ),
                SizedBox(width: 5.w),
                Container(
                  height: 15.spMin,
                  width: 100.w,
                  color: Colors.grey[300],
                ),
              ],
            ),

            SizedBox(height: 20.h),

            // Info Tags
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                3,
                (index) => Container(
                  height: 40.h,
                  width: 0.25.sw,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            // SizedBox(height: 20.h),
            //   Container(
            //   height: .h,
            //   width: 1.sw,
            //   decoration: BoxDecoration(
            //     color: Colors.grey[300],
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            // ),
            
             SizedBox(height: 20.h),
              Container(
              height: 100.h,
              width: 1.sw,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            
            
          ],
        ),
      ),
    );
  }
}
