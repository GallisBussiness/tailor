class ResponseLoginModel {
  ResponseLoginModel({
    required this.token,
    required this.id,
  });
  late final String token;
  late final String id;

  ResponseLoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    id = json['id'];
  }

  static Map<String, dynamic> toJson(ResponseLoginModel r) {
    final data = <String, dynamic>{};
    data['token'] = r.token;
    data['id'] = r.id;
    return data;
  }
}
