import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:pet_adoption_app/widgets/commonWidgets/textwidget.dart';

class AddPetAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AddPetAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color:Color.fromARGB(177, 90, 79, 207), size: 30.spMin),
      centerTitle: true,
      backgroundColor: GFColors.TRANSPARENT,
      leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
          )),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.close_rounded,
            ))
      ],
      title: TextWidget(
          words: "Add Pet Details",
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 23.spMin),
    );
  }
  
@override
Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}
