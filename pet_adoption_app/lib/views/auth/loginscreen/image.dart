import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_adoption_app/widgets/authwidgets/pawImagewithText.dart';

class ImageLogin extends StatelessWidget {
  const ImageLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                PawImagewithText(),
                Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(
                      "assets/loginImage/casual-life-3d-girl-standing-and-holding-dog 1.png",
                      height: 0.8.sh,
                      width: 1.sw,
                      alignment: Alignment.topRight,
                    )),
              ],
            );
  }
}