class Contact3 {
  final String name;
  final String email;
  final String phone;

  Contact3({
    required this.name,
    required this.email,
    required this.phone,
  });

  Contact3.fromJson(Map<String,dynamic> json) :
      email = json["email"],
      name = json['name'],
      phone = json["phone"];
      
  
}