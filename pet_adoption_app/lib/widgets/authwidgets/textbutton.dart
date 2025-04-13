import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_adoption_app/widgets/commonWidgets/textwidget.dart';

class TextbuttonAuth extends StatelessWidget {
 final String text;
 final String buttonText;
 final Widget navigateTo;

  const TextbuttonAuth({super.key,required this.text,required this.buttonText,required this.navigateTo});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextWidget(
            words: text,
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 17.spMin),
        TextButton(
            onPressed: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) =>navigateTo ,));
            },
            child: Text(
              buttonText,
              style: TextStyle(
                  color:const Color(
                    0xFFFF8E3C,
                  ),
                  fontSize: 17.spMin),
            )),
      ],
    );
  }
}
