import 'package:city_hygiene_app/repository/auth_repo_objects/mairie.dart';
import 'package:city_hygiene_app/repository/auth_repo_objects/user_city.dart';
import 'package:city_hygiene_app/repository/auth_repo_objects/user_roles.dart';

class User {
  int? id;
  String? name;
  String? lastname;
  String? email;
  String? phonenumber;
  String? address;
  int? villeId;
  int? mairieId;
  String? emailVerifiedAt;
  String? passwordConfirmation;
  String? createdAt;
  String? updatedAt;
  int? isActive;
  Ville? ville;
  Mairie? mairie;
  List<Roles>? roles;

  User(
      {this.id,
      this.name,
      this.lastname,
      this.email,
      this.phonenumber,
      this.address,
      this.villeId,
      this.mairieId,
      this.emailVerifiedAt,
      this.passwordConfirmation,
      this.createdAt,
      this.updatedAt,
      this.isActive,
      this.ville,
      this.mairie,
      this.roles});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastname = json['lastname'];
    email = json['email'];
    phonenumber = json['phonenumber'];
    address = json['address'];
    villeId = json['ville_id'];
    mairieId = json['mairie_id'];
    emailVerifiedAt = json['email_verified_at'];
    passwordConfirmation = json['password_confirmation'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isActive = json['is_active'];
    ville = json['ville'] != null ? Ville.fromJson(json['ville']) : null;
    mairie = json['mairie'] != null ? Mairie.fromJson(json['mairie']) : null;
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(Roles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['lastname'] = lastname;
    data['email'] = email;
    data['phonenumber'] = phonenumber;
    data['address'] = address;
    data['ville_id'] = villeId;
    data['mairie_id'] = mairieId;
    data['email_verified_at'] = emailVerifiedAt;
    data['password_confirmation'] = passwordConfirmation;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['is_active'] = isActive;
    if (ville != null) {
      data['ville'] = ville!.toJson();
    }
    if (mairie != null) {
      data['mairie'] = mairie!.toJson();
    }
    if (roles != null) {
      data['roles'] = roles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
