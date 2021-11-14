class Contact2 {
  final String name;
  final String email;
  final String phone;

  Contact2({
    required this.name,
    required this.email,
    required this.phone,
  });

  Contact2.fromJson(Map<String,dynamic> json) :
      email = json["email"],
      name = json['name'],
      phone = json["phone"];
      
  
}