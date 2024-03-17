class Ville {
  int? id;
  String? libelle;
  int? paysId;
  String? createdAt;
  String? updatedAt;

  Ville({this.id, this.libelle, this.paysId, this.createdAt, this.updatedAt});

  Ville.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    libelle = json['libelle'];
    paysId = json['pays_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['libelle'] = libelle;
    data['pays_id'] = paysId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
