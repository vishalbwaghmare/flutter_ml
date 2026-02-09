class PersonDTO {
  PersonDTO({
    this.email,
  });

  String? email;



  factory PersonDTO.fromJson(Map<String, dynamic> json){
    return PersonDTO(
      email: json["email"] ?? '',
    );
  }

  Map<String, String> toJson() => {
    "email": email ?? "", 
  };

}