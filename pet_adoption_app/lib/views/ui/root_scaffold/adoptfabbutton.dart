import 'package:flutter/material.dart';

class AdoptFabButton extends StatelessWidget {
  const AdoptFabButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          
          
        },
        backgroundColor: Colors.amber.shade300,
        child: Icon(Icons.pets),
      );
  }
}