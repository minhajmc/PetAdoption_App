import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:pet_adoption_app/widgets/commonWidgets/textwidget.dart';
import 'package:pet_adoption_app/widgets/pet_details/detailsformfield.dart';

class SuggestionField extends StatelessWidget {
  final TextEditingController allController;
  final String hintText;
  final List<String> listsofSuggestions;
  final FocusNode whereToFocus;
  final FocusNode focusNode;
  const SuggestionField(
      {super.key,
      required this.allController,
      required this.hintText,
      required this.whereToFocus,
      required this.focusNode,
      required this.listsofSuggestions});

  @override
  Widget build(BuildContext context) {
    return TypeAheadField<String>(
      controller: allController,
      focusNode: focusNode,
      builder: (context, controller, focusNode) {
        return DetailsFormField(
          hintText: hintText,
          inputType: TextInputType.text,
          controller: controller,
          focusNode: focusNode,
          whereToFocus:whereToFocus ,
        );
      },
      itemBuilder: (context, value) {
        return GFListTile(
          color: Colors.orange.shade50,
          title: TextWidget(
              words: value,
              color: Color(0xFF4E342E),
              fontWeight: FontWeight.bold,
              fontSize: 15.spMin),
        );
      },
      onSelected: (value) {
        allController.text = value;
      },
      suggestionsCallback: (usersearching) {
        return listsofSuggestions
            .where(
              (breed) =>
                  breed.toLowerCase().contains(usersearching.toLowerCase()),
            )
            .toList();
      },
    );
  }
}
