class AuthResponse {
  String? accessToken;
  String? tokenType;

  AuthResponse({this.accessToken, this.tokenType});

  AuthResponse.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    return data;
  }
}
