import 'package:city_hygiene_app/repository/auth_repo_objects/mairie.dart';
import 'package:city_hygiene_app/repository/auth_repo_objects/user.dart';
import 'package:city_hygiene_app/repository/auth_repo_objects/user_city.dart';
import 'package:city_hygiene_app/repository/auth_repo_objects/user_roles.dart';

class UserInfo {
  User? user;
  Ville? ville;
  Mairie? mairie;
  List<Roles>? roles;

  UserInfo({this.user, this.ville, this.mairie, this.roles});

  UserInfo.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
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
    if (user != null) {
      data['user'] = user!.toJson();
    }
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
