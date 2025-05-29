import 'package:flutter/material.dart';
import 'package:pet_adoption_app/views/ui/add_pet_form/add_pet_ui/add_pet_screen.dart';
import 'package:pet_adoption_app/views/ui/pet_details/pet_details_screen.dart';

class AdoptFabButton extends StatelessWidget {
  const AdoptFabButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddPetScreen(),));
          
          
        },
        backgroundColor: Colors.amber.shade300,
        child: Icon(Icons.pets),
      );
  }
}