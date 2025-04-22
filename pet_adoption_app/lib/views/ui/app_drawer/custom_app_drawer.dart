import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:getwidget/getwidget.dart';
import 'package:pet_adoption_app/models/profile_model/profile_model.dart';
import 'package:pet_adoption_app/viewmodels/profile_provider/profileget_provider.dart';
import 'package:pet_adoption_app/views/ui/profile/editprofile.dart';
import 'package:pet_adoption_app/widgets/commonWidgets/textwidget.dart';
import 'package:provider/provider.dart';

class CustomAppDrawer extends StatelessWidget {

  final String?prefsEmail;
  const CustomAppDrawer({super.key,required this.prefsEmail});

  @override
  Widget build(BuildContext context) {
    // Colors used in the drawer
    const Color drawerBackgroundColor = Color(0xFFF1FAFF);
    const Color headerBackgroundColor = Color(0xFFD0F0FD);
    const Color avatarBackgroundColor = Color(0xFFF1FAFF);
    const Color iconColor = Color(0xFF0288D1);
    const Color titleTextColor = Color(0xFF0277BD);
    const Color subtitleTextColor = Color(0xFF607D8B);
    const Color closeIconColor = Color(0xFF0288D1);

    return GFDrawer(
        color: drawerBackgroundColor,
        child: ListView(
          children: [
            GFDrawerHeader(
              closeButton: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close,
                    color: closeIconColor,
                  )),
              decoration: BoxDecoration(color: headerBackgroundColor),
              child:
              
              
               Consumer<ProfileGetProvider>(
                  builder: (context, providerData, child) {
                ProfileModel? profileModelData = providerData.profileModelData;
                return GFListTile(
                  color: headerBackgroundColor,
                  margin: EdgeInsets.all(20),
                  hoverColor: Colors.black,
                  avatar: GFAvatar(
                    backgroundColor: avatarBackgroundColor,
                    backgroundImage: profileModelData?.imageUrl!=null?CachedNetworkImageProvider("${profileModelData?.imageUrl}"):null
                    ,
                    size: GFSize.LARGE,
                  ),
                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                  title: TextWidget(
                      words: "${profileModelData?.name}",
                      color: titleTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.spMin),
                  subTitle: TextWidget(
                      words: "$prefsEmail",
                      color: subtitleTextColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 13.spMin),
                );
              }),
            ),
            // ListTile(
            //   leading: Icon(
            //     Icons.pets_outlined,
            //     size: 35.w,
            //     color: Color(0xFF455A64),
            //   ),
            // ),

            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: Icon(Icons.home_outlined, size: 30.w, color: iconColor),
              title: TextWidget(
                  words: "Home",
                  color: titleTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),

            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfile(),
                    ));
              },
              leading: Icon(Icons.person_outline, size: 30.w, color: iconColor),
              title: TextWidget(
                  words: "Profile",
                  color: titleTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            ListTile(
              leading: Icon(Icons.pets_outlined, size: 30.w, color: iconColor),
              title: TextWidget(
                  words: "Add Pet",
                  color: titleTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            ListTile(
              leading:
                  Icon(Icons.favorite_outline, size: 30.w, color: iconColor),
              title: TextWidget(
                  words: "Favorites",
                  color: titleTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            ListTile(
              leading:
                  Icon(Icons.settings_outlined, size: 30.w, color: iconColor),
              title: TextWidget(
                  words: "Settings",
                  color: titleTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            ListTile(
              leading: Icon(Icons.info_outline, size: 30.w, color: iconColor),
              title: TextWidget(
                  words: "About Us",
                  color: titleTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),

            //add this inside settings

            // ListTile(
            //   leading: Icon(Icons.help_outline, size: 30.w, color: iconColor),
            //   title: TextWidget(
            //       words: "Help Center",
            //       color: titleTextColor,
            //       fontWeight: FontWeight.bold,
            //       fontSize: 18),
            // ),
            // ListTile(
            //   leading: Icon(Icons.privacy_tip_outlined,
            //       size: 30.w, color: iconColor),
            //   title: TextWidget(
            //       words: "Privacy Policy",
            //       color: titleTextColor,
            //       fontWeight: FontWeight.bold,
            //       fontSize: 18),
            // ),
            // ListTile(
            //   leading:
            //       Icon(Icons.feedback_outlined, size: 30.w, color: iconColor),
            //   title: TextWidget(
            //       words: "Feedback",
            //       color: titleTextColor,
            //       fontWeight: FontWeight.bold,
            //       fontSize: 18),
            // ),

            //end

            Divider(
              indent: 0.08.sw,
              endIndent: 0.08.sw,
              color: Color(0xFFB3E5FC),
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                size: 30.w,
                color: Color(0xFFEF5350),
              ),
              title: TextWidget(
                words: "Logout",
                color: Color(0xFFD32F2F),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ));
  }
}
