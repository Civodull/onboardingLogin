class Mairie {
  int? id;
  String? name;
  String? email;
  String? telephone;
  String? adresse;
  String? codePostal;
  int? villeId;
  String? createdAt;
  String? updatedAt;

  Mairie(
      {this.id,
      this.name,
      this.email,
      this.telephone,
      this.adresse,
      this.codePostal,
      this.villeId,
      this.createdAt,
      this.updatedAt});

  Mairie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    telephone = json['telephone'];
    adresse = json['adresse'];
    codePostal = json['code_postal'];
    villeId = json['ville_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['telephone'] = telephone;
    data['adresse'] = adresse;
    data['code_postal'] = codePostal;
    data['ville_id'] = villeId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
