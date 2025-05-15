class PetProfileModel{
  String? petName;
  String? type;
  String? breed;
  int? age;
  String? weight;
  String? gender;
  String? description;
  bool? healthStatus;
  bool? vaccinationStatus;
  bool? breedingFirstTime;
  bool? pedigreeCertified;
  String? size;
  bool? friendlyWithOtherPets;
  bool? goodWithKids;
  bool? isTrained;
  List<String>? specialNeeds;
  List<String>? imageUrls;
  Location? location;
  bool? availableForAdoption;
  ContactDetails? contactDetails;

  PetProfileModel({
    this.petName,
    this.type,
    this.breed,
    this.age,
    this.weight,
    this.gender,
    this.description,
    this.healthStatus,
    this.vaccinationStatus,
    this.breedingFirstTime,
    this.pedigreeCertified,
    this.size,
    this.friendlyWithOtherPets,
    this.goodWithKids,
    this.isTrained,
    this.specialNeeds,
    this.imageUrls,
    this.location,
    this.availableForAdoption,
    this.contactDetails,
  });



  factory PetProfileModel.fromJson(Map<String, dynamic> json) {
    return PetProfileModel(
      petName: json['petName'],
      type: json['type'],
      breed: json['breed'],
      age: json['age'],
      weight: json['weight'],
      gender: json['gender'],
      description: json['description'],
      healthStatus: json['health_status'],
      vaccinationStatus: json['vaccination_status'],
      breedingFirstTime: json['breeding_first_time'],
      pedigreeCertified: json['pedigree_certified'],
      size: json['size'],
      friendlyWithOtherPets: json['friendly_with_other_pets'],
      goodWithKids: json['good_with_kids'],
      isTrained: json['is_trained'],
      specialNeeds: List<String>.from(json['special_needs']),
      imageUrls: List<String>.from(json['image_urls']),
      location: Location.fromJson(json['location']),
      availableForAdoption: json['available_for_adoption'],
      contactDetails: ContactDetails.fromJson(json['contact_details']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'petName': petName,
      'type': type,
      'breed': breed,
      'age': age,
      'weight': weight,
      'gender': gender,
      'description': description,
      'health_status': healthStatus,
      'vaccination_status': vaccinationStatus,
      'breeding_first_time': breedingFirstTime,
      'pedigree_certified': pedigreeCertified,
      'size': size,
      'friendly_with_other_pets': friendlyWithOtherPets,
      'good_with_kids': goodWithKids,
      'is_trained': isTrained,
      'special_needs': specialNeeds,
      'image_urls': imageUrls,
      'location': location?.toJson(),
      'available_for_adoption': availableForAdoption,
      'contact_details': contactDetails?.toJson(),
    };
  }
}
class Location {
   double ?latitude;
   double ?longitude;
   String ?place;

  Location({
    required this.latitude,
    required this.longitude,
    required this.place,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      latitude: json['latitude'].toDouble(),
      longitude: json['longitude'].toDouble(),
      place: json['place'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'place': place,
    };
  }
}

class ContactDetails {
  String? name;
  String? phoneNumber;
  String? email;
  String? image;

  ContactDetails({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.image,
  });

  factory ContactDetails.fromJson(Map<String, dynamic> json) {
    return ContactDetails(
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'image': image,
    };
  }
}
