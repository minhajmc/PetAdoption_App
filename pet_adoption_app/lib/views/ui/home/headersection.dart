import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/getwidget.dart';
import 'package:pet_adoption_app/models/profile_model/profile_model.dart';
import 'package:pet_adoption_app/viewmodels/profile_provider/profileget_provider.dart';
import 'package:pet_adoption_app/widgets/commonWidgets/textwidget.dart';
import 'package:provider/provider.dart';

class Headersection extends StatelessWidget {
final  double gfSize;
// final VoidCallback opendrawer;
  const Headersection({super.key,required this.gfSize});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileGetProvider>(
      builder: (context, profileData, child){

        
        ProfileModel ?profileModelData=profileData.profileModelData;
        return profileData.isLoading==true?GFShimmer(
                child: GFListTile(
                  avatar: GFAvatar(
                    backgroundColor: Colors.grey,
                    size: gfSize,
                 
                  ),
                  title: Container(
                    height: 20.h,
                    width: 120.w,
                    color: Colors.grey[300],
                  ),
                  subTitle: Container(
                    height: 20.h,
                    width: 160.w,
                    color: Colors.grey[300],
                  ),
                  icon: Container(
                    height: 20.h,
                    width: 20.w,
                    color: Colors.grey[300],
                  ),
                ),
              ):
         GFListTile(
            avatar: GFAvatar(
              backgroundColor: Colors.grey,
              backgroundImage: profileModelData?.imageUrl!=null?CachedNetworkImageProvider(  "${profileModelData!.imageUrl}",):null,
              
              size: gfSize,
            ),
            title: TextWidget(
                words: "Hello",
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 15.spMin),
            subTitle: TextWidget(
                words: profileModelData?.name.toString()??"Guest",
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
    );
  }
}
