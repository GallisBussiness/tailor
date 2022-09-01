class SignupModel {
  final String tel;
  final String prenom;
  final String nom;
  final String password;

  SignupModel(this.tel, this.prenom, this.nom, this.password);

  SignupModel.fromJson(Map<String, dynamic> json)
      : tel = json['tel'],
        prenom = json['prenom'],
        nom = json['nom'],
        password = json['password'];

  static Map<String, dynamic> toJson(SignupModel s) {
    return {
      'tel': s.tel,
      'prenom': s.prenom,
      'nom': s.nom,
      'password': s.password
    };
  }
}
