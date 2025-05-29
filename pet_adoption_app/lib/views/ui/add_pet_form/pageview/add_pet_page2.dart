import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_adoption_app/models/petdetails/petprofile.dart';
import 'package:pet_adoption_app/widgets/authwidgets/elevatedButtonWidget.dart';
import 'package:pet_adoption_app/widgets/commonWidgets/textwidget.dart';
import 'package:pet_adoption_app/widgets/pet_details/detailsformfield.dart';
import 'package:pet_adoption_app/widgets/pet_details/pageview/medicalconditionselector.dart';
import 'package:pet_adoption_app/widgets/pet_details/pageview/pet_checkbox_tile.dart';

class AddPetPage2 extends StatelessWidget {
  final PetProfileModel? petModelDataEnter;

  final Function(PetProfileModel) onChange;
  AddPetPage2({super.key, required this.petModelDataEnter,required this.onChange});
  final _descriptinController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  List<String> specialNeed = [];

  void _onNextPressed() {
    if (_formkey.currentState!.validate()) {
      petModelDataEnter?.description = _descriptinController.text;
      petModelDataEnter?.specialNeeds = specialNeed;
      onChange(petModelDataEnter!);
      log("Form is valid");
    }else{
      log("Form is invalid");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: Color(0xFFF9F7F1), // very light version of scaffold color
      ),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 30.h),
              child: SingleChildScrollView(
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: TextWidget(
                              words: "Description",
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                      SizedBox(
                        height: 10.h,
                      ),
                      // TextField(
                      //   controller:_descriptinController ,

                      //   maxLines: 2,

                      //   decoration: InputDecoration(
                      //       border: OutlineInputBorder(),
                      //       hintText: "Description......",
                      //       hintStyle: TextStyle(fontSize: 18.spMin)),
                      // ),

                      DetailsFormField(
                        maxLine: 2,
                        controller: _descriptinController,
                        hintText: "Description....",
                        inputType: TextInputType.text,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: TextWidget(
                              words: "Special Needs",
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //1
                          MedicalConditionSelector(
                            text: "Blind",
                            onchanged: (value) {
                              log(value.toString());
                              if (value == true) {
                                specialNeed.add("Blind");
                              } else {
                                specialNeed.remove("Blind");
                              }
                              log(specialNeed.toString());
                            },
                          ),
                          //2
                          MedicalConditionSelector(
                            text: "Deaf",
                            onchanged: (value) {
                              log(value.toString());
                              if (value == true) {
                                specialNeed.add("Deaf");
                              } else {
                                specialNeed.remove("Deaf");
                              }
                              log(specialNeed.toString());
                            },
                          ),
                          //3
                          MedicalConditionSelector(
                            text: "Diabetic",
                            onchanged: (value) {
                              log(value.toString());
                              if (value == true) {
                                specialNeed.add("Diabetic");
                              } else {
                                specialNeed.remove("Diabetic");
                              }
                              log(specialNeed.toString());
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //4
                          MedicalConditionSelector(
                            text: "Arthritis",
                            onchanged: (value) {
                              log(value.toString());
                              if (value == true) {
                                specialNeed.add("Arthritis");
                              } else {
                                specialNeed.remove("Arthritis");
                              }
                              log(specialNeed.toString());
                            },
                          ),
                          //5
                          MedicalConditionSelector(
                            text: "Allergies",
                            onchanged: (value) {
                              log(value.toString());
                              if (value == true) {
                                specialNeed.add("Allergies");
                              } else {
                                specialNeed.remove("Allergies");
                              }
                              log(specialNeed.toString());
                            },
                          ),
                          //6
                          MedicalConditionSelector(
                            text: "Epileptic",
                            onchanged: (value) {
                              log(value.toString());
                              if (value == true) {
                                specialNeed.add("Epileptic");
                              } else {
                                specialNeed.remove("Epileptic");
                              }
                              log(specialNeed.toString());
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: TextWidget(
                              words: "Status",
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                      SizedBox(
                        height: 10.h,
                      ),
                      // Align(
                      //     alignment: Alignment.topRight,
                      //     child: TextWidget(
                      //         words: "Yes          No",
                      //         color: Colors.black,
                      //         fontWeight: FontWeight.bold,
                      //         fontSize: 20)),
                      // SizedBox(
                      //   height: 10.h,
                      // ),
                      PetCheckboxTile(
                        statusText: "Trained",
                        onChange: (value) {
                          // log(value.toString());
                          petModelDataEnter?.isTrained = value;
                        },
                      ),
                      PetCheckboxTile(
                        statusText: "Good with Kids	",
                        onChange: (value) {
                          // log(value.toString());
                          petModelDataEnter?.goodWithKids = value;
                        },
                      ),

                      PetCheckboxTile(
                        statusText: "Friendly with Other Pets	",
                        onChange: (value) {
                          log(value.toString());
                          petModelDataEnter?.friendlyWithOtherPets = value;
                          
                        },
                      ),

                      PetCheckboxTile(
                        statusText: "Healthy",
                        onChange: (value) {
                         

                          bool? last=value;
                          petModelDataEnter?.healthStatus = last;
                           log(last.toString());
                        },
                      ),

                      PetCheckboxTile(
                        statusText: "Vaccinated",
                        onChange: (value) {
                          log(value.toString());
                          petModelDataEnter?.vaccinationStatus = value;
                          
                        },
                      ),

                      PetCheckboxTile(
                        statusText: "First-Time Breeding	",
                        onChange: (value) {
                          petModelDataEnter?.breedingFirstTime = value;
                          log(value.toString());
                        },
                      ),

                      PetCheckboxTile(
                        statusText: "Pedigree Certified",
                        onChange: (value) {
                          petModelDataEnter?.pedigreeCertified = value;
                          log(value.toString());
                        },
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
                        tap:_onNextPressed,
                        borderColor: 0xFFB39DDB, // slightly darker lavender
                      ),
                      SizedBox(
                        height: 20.h,
                      )
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
