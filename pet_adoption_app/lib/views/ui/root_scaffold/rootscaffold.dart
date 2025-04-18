import 'package:flutter/material.dart';
import 'package:pet_adoption_app/views/ui/favourites/favourites.dart';
import 'package:pet_adoption_app/views/ui/home/home.dart';
import 'package:pet_adoption_app/views/ui/root_scaffold/adoptfabbutton.dart';
import 'package:pet_adoption_app/views/ui/root_scaffold/bottomnavigationbar.dart';
import 'package:pet_adoption_app/views/ui/app_drawer/custom_app_drawer.dart';
import 'package:pet_adoption_app/views/ui/search/search.dart';

class RootScaffold extends StatefulWidget {
  const RootScaffold({super.key});

  @override
  State<RootScaffold> createState() => _BottomnavigationbarState();
}

class _BottomnavigationbarState extends State<RootScaffold> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  int currentindex = 0;

  List screens = [HomeScreen(), Search(), Favourites(),];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: screens[currentindex],
        ),
        bottomNavigationBar: Bottomnavigationbar(
          currentIndex: currentindex,
          onTap: (value) {
            if (value == 3) {
              _scaffoldKey.currentState?.openDrawer();
            } else {
              currentindex = value;
            }
            setState(() {});
          },
        ),
        drawer: CustomAppDrawer(),
        floatingActionButton: AdoptFabButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
