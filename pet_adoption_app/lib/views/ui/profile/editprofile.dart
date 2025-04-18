import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Add your profile editing form here
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: "Name"),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: "Email"),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: "Phone Number"),
                  ),
                  // Add more fields as needed
                ],
              ),
            ),
          ],
        ),
      ),


    );
  }
}