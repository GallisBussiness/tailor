class Client {
  String id;
  String prenom;
  String nom;
  String tel;
  String avatar;
  String adresse;
  int lon;
  int lar;
  int cou;
  String createdAt;
  String updatedAt;

  Client(
      {required this.id,
      required this.prenom,
      required this.nom,
      required this.tel,
      required this.avatar,
      required this.adresse,
      required this.lon,
      required this.lar,
      required this.cou,
      required this.createdAt,
      required this.updatedAt});

  Client.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        prenom = json['prenom'],
        nom = json['nom'],
        tel = json['tel'],
        avatar = json['avatar'],
        adresse = json['adresse'],
        lon = json['lon'],
        lar = json['lar'],
        cou = json['cou'],
        createdAt = json['createdAt'],
        updatedAt = json['updatedAt'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['prenom'] = prenom;
    data['nom'] = nom;
    data['tel'] = tel;
    data['avatar'] = avatar;
    data['adresse'] = adresse;
    data['lon'] = lon;
    data['lar'] = lar;
    data['cou'] = cou;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
