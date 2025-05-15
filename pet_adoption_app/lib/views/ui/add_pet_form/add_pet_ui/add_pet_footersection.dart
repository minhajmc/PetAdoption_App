import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_adoption_app/widgets/commonWidgets/textwidget.dart';

class AddPetFooterSection extends StatefulWidget {
  PageController pageController;
  AddPetFooterSection({super.key, required this.pageController});

  @override
  State<AddPetFooterSection> createState() => _AddPetFooterSectionState();
}

class _AddPetFooterSectionState extends State<AddPetFooterSection> {
  int _currentPage = 0;

  void _gotoNextPage() {
    if (_currentPage < 3) {
      setState(() {
        _currentPage++;
      });
      widget.pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _toPreviousPage() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
      });
      widget.pageController.animateToPage(_currentPage,
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: _toPreviousPage,
            child: Container(
              height: 40.h,
              width: 150.w,
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(5.r),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    Icon(Icons.arrow_back_ios,
                        size: 18.w, color: Colors.purple),
                    TextWidget(
                        words: "Previous",
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.spMin),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: _gotoNextPage,
            child: Container(
              height: 40.h,
              width: 150.w,
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(5.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(
                        words: _currentPage==3?"Finish":"Next",
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.spMin),
                    SizedBox(
                      width: 5.w,
                    ),
                    Icon(Icons.arrow_forward_ios,
                        size: 18.w, color: Colors.purple),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
