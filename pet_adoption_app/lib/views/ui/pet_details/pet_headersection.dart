import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/components/button/gf_icon_button.dart';
import 'package:pet_adoption_app/widgets/commonWidgets/textwidget.dart';

class PetHeaderSection extends StatelessWidget {
  const PetHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GFIconButton(
            iconSize: 25.w,
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            color: const Color(0xFFE6DED0),
            onPressed: () {
              Navigator.pop(context);
            }),
        const TextWidget(
            words: "Pet",
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20),
        GFIconButton(
          iconSize: 25.w,
          onPressed: () {
            //share logic
          },
          color: const Color(0xFFE6DED0),
          icon: Icon(
            Icons.share_outlined,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
