class ModelRegister {
  String?email;
  String? name;
  String?password;
    
    ModelRegister({required this.email,required this.name,required this.password});

    Map<String,dynamic>toJson()=>{

      "email":email,
      "name":name,
      "password":password

    };

}