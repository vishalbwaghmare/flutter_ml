class PersonEntity {
  PersonEntity({
    this.email,
  });

  String? email;



  factory PersonEntity.fromJson(Map<String, dynamic> json){
    return PersonEntity(
      email: json["email"] ?? '',
    );
  }

  Map<String, String> toJson() => {
    "email": email ?? "", 
  };

}