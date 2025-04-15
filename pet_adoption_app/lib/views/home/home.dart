import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/getwidget.dart';
import 'package:pet_adoption_app/widgets/commonWidgets/textwidget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F0E6),
        body: SizedBox(
          height: 1.sh,
          width: 1.sw,
          child: Column(
            children: [
              GFListTile(
                  avatar: GFAvatar(
                    backgroundColor: Colors.grey,
                    size: GFSize.LARGE,
                  ),
                  title: TextWidget(
                      words: "Hello",
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 15.sp),
                  subTitle: TextWidget(
                      words: "Minhaj",
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp),
                  icon: GFIconButton(
                    icon: const Icon(
                      Icons.menu,
                      color: GFColors.DARK,
                    ),
                    onPressed: () {},
                    type: GFButtonType.transparent,
                  )),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                          height: 45.h,
                          decoration: BoxDecoration(
                            color: Color(0xFFE0DADA),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(10),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search...",hintStyle: TextStyle(color: Color(0xFF81678C))),
                          )),
                    ),
                    SizedBox(width: 10.w,),
                    ClipRRect(borderRadius: BorderRadius.circular(10),
                      child: GFIconButton(icon: Icon(Icons.search), onPressed: (){},shape: GFIconButtonShape.standard,color: Color(0xFF827397),))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
