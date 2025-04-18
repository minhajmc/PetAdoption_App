import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/button/gf_icon_button.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:pet_adoption_app/widgets/commonWidgets/textwidget.dart';

class Headersection extends StatelessWidget {
final  double gfSize;
// final VoidCallback opendrawer;
  const Headersection({super.key,required this.gfSize});

  @override
  Widget build(BuildContext context) {
    return GFListTile(
        avatar: GFAvatar(
          backgroundColor: Colors.grey,
          size: gfSize,
        ),
        title: TextWidget(
            words: "Hello",
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 15.spMin),
        subTitle: TextWidget(
            words: "Minhaj",
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20.spMin),
        icon: GFIconButton(
          
          icon: const Icon(
            Icons.menu,
            color: GFColors.DARK,
          ),
          // onPressed: opendrawer,
          onPressed: (){
          Scaffold.of(context).openDrawer();
          },
          type: GFButtonType.transparent,
        ));
  }
}
