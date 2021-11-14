class Contact {
  final String name;
  final String email;
  final String phone;

  Contact({
    required this.name,
    required this.email,
    required this.phone,
  });

  Contact.fromJson(Map<String,dynamic> json) :
      email = json["email"],
      name = json['name'],
      phone = json["phone"];
      
  
}