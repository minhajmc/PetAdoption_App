import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/getwidget.dart';
import 'package:pet_adoption_app/widgets/commonWidgets/textwidget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AddPetScreen extends StatefulWidget {
  const AddPetScreen({super.key});

  @override
  State<AddPetScreen> createState() => _AddPetScreenState();
}

class _AddPetScreenState extends State<AddPetScreen> {
  final _pageCOntroller = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F0E6),
        // appBar: AppBar(
        //   iconTheme: IconThemeData(color: Color(0xFF5A4FCF), size: 30.spMin),
        //   centerTitle: true,
        //   backgroundColor: GFColors.TRANSPARENT,
        //   leading: IconButton(
        //       onPressed: () {},
        //       icon: Icon(
        //         Icons.arrow_back,
        //       )),
        //   actions: [
        //     IconButton(
        //         onPressed: () {},
        //         icon: Icon(
        //           Icons.close_rounded,
        //         ))
        //   ],
        //   title: TextWidget(
        //       words: "Add Pet Details",
        //       color: Colors.black,
        //       fontWeight: FontWeight.bold,
        //       fontSize: 23.spMin),
        // ),
        body: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 40.h, bottom: 30.h),
                child: SmoothPageIndicator(
                  controller: _pageCOntroller,
                  count: 5,
                  effect: ExpandingDotsEffect(
                    activeDotColor: Color(0xFF5A4FCF),
                    dotHeight: 10.h,
                    dotWidth: 10.w,
                    spacing: 30.w,
                    dotColor: Color(0xFFDADADA),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageCOntroller,
                // onPageChanged: _onPageChanged,
                children: [
                  _buildPage("Page 1", Colors.red),
                  _buildPage("Page 2", Colors.green),
                  _buildPage("Page 3", Colors.blue),
                  _buildPage("Page 4", const Color.fromARGB(255, 243, 33, 159)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(String text, Color color) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        color: const Color.fromARGB(255, 234, 226, 209) ,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 32, color: Colors.white),
        ),
      ),
    );
  }
}
