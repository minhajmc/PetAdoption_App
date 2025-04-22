class ProfileModel {
  String? name;
  String? phone;
  String? imageUrl;

  ProfileModel({
    this.name,
    this.phone,
    this.imageUrl,
  });
 //converting object to json
 Map<String,dynamic>toJson()=>{
  'name':name,
  'phone':phone,
  'image':imageUrl ,
 };

//converting json to object
 ProfileModel.fromJson(Map<String,dynamic>json){
  name=json['name'];
  phone=json['phone'];
  imageUrl=json['image'];
 }



}
