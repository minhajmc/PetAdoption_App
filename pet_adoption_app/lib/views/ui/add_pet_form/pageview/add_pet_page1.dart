import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_adoption_app/models/petdetails/petprofile.dart';
import 'package:pet_adoption_app/views/ui/add_pet_form/listofpets/breeds_list.dart';
import 'package:pet_adoption_app/views/ui/add_pet_form/listofpets/gender_list.dart';
import 'package:pet_adoption_app/views/ui/add_pet_form/listofpets/size_list.dart';
import 'package:pet_adoption_app/views/ui/add_pet_form/listofpets/type_list.dart';
import 'package:pet_adoption_app/widgets/authwidgets/elevatedButtonWidget.dart';
import 'package:pet_adoption_app/widgets/commonWidgets/textwidget.dart';
import 'package:pet_adoption_app/widgets/pet_details/detailsformfield.dart';
import 'package:pet_adoption_app/widgets/pet_details/suggestion_field.dart';

class AddPetPage1 extends StatelessWidget {
 final PetProfileModel? petProfile;
  final Function(PetProfileModel) onTap;
  final _formKey = GlobalKey<FormState>();



  AddPetPage1({super.key, required this.onTap, required this.petProfile});

  //controller
  final TextEditingController _petNameController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _breedTypeController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _sizeController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  //focusnode
  final _petNameFocusNode = FocusNode();
  final _typeFocusNode = FocusNode();
  final _breedFocusNode = FocusNode();
  final _genderFocusNode = FocusNode();
  final _sizeFocusNode = FocusNode();
  final _ageFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: Color(0xFFF9F7F1), // very light version of scaffold color
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 30.w, right: 30.w),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),

                    TextWidget(words: "Pet Details", color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18.spMin),
                    SizedBox(
                      height: 20.h,
                    ),
                    DetailsFormField(maxLine: 1,
                      whereToFocus: _typeFocusNode,
                      focusNode: _petNameFocusNode,
                      hintText: "Name",
                      inputType: TextInputType.name,
                      controller: _petNameController,
                    ),
                
                    SizedBox(
                      height: 25.h,
                    ),
                    //type suggestion with textfield
                    SuggestionField(
                      focusNode: _typeFocusNode,
                      whereToFocus: _breedFocusNode,
                      allController: _typeController,
                      hintText: "Type",
                      listsofSuggestions: typeList,
                    ),
                    //endtype
                    SizedBox(
                      height: 25.h,
                    ),
                
                    // breed searching field
                    SuggestionField(
                        whereToFocus: _genderFocusNode,
                        focusNode: _breedFocusNode,
                        allController: _breedTypeController,
                        hintText: "Breed",
                        listsofSuggestions: breedList),
                    //searching end.........
                    SizedBox(
                      height: 25.h,
                    ),
                    //gender
                    SuggestionField(
                        whereToFocus: _sizeFocusNode,
                        focusNode: _genderFocusNode,
                        allController: _genderController,
                        hintText: "Gender",
                        listsofSuggestions: genderList),
                
                    //end gender
                
                    SizedBox(
                      height: 25.h,
                    ),
                    SuggestionField(
                        focusNode: _sizeFocusNode,
                        whereToFocus: _ageFocusNode,
                        allController: _sizeController,
                        hintText: "Size",
                        listsofSuggestions: sizeList),
                    SizedBox(
                      height: 25.h,
                    ),
                    SizedBox(
                        child: DetailsFormField(maxLine: 1,
                            focusNode: _ageFocusNode,
                            whereToFocus: null,
                            hintText: "Age",
                            inputType: TextInputType.number,
                            controller:_ageController )),
                    SizedBox(
                      height: 25.h,
                    ),
                    ElevatedButtonWidget(
                      text: "Next",
                      height: 50.h,
                      width: 1.sw - 60.w,
                      elevation: 5,
                      backgroundColor: 0xFFB39DDB, // soft lavender
                      fontSize: 17.sp,
                      textColor: Color(0xFF212121), // deep charcoal
                      borderRadius: 12.r,
                      tap: () {
                        if(_formKey.currentState!.validate()){
          
                         petProfile?.petName=_petNameController.text;
                         petProfile?.type=_typeController.text;
                         petProfile?.breed=_breedTypeController.text;
                         petProfile?.gender=_genderController.text;
                         petProfile?.size=_sizeController.text;
                         petProfile?.age=int.parse(_ageController.text);
                        //  petProfile.
          
                        if(petProfile!=null){
                          onTap(petProfile!);
                          
                        }
                        }else{
                          log("notValidate");
                        }
                         
                      
                      },
                      borderColor: 0xFFB39DDB, // slightly darker lavender
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
