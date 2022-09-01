class Model {
  Model({
    required this.description,
    required this.nomTissu,
    required this.couleurDominante,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });
  late final String description;
  late final String nomTissu;
  late final String couleurDominante;
  late final String id;
  late final String createdAt;
  late final String updatedAt;

  Model.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    nomTissu = json['nom_tissu'];
    couleurDominante = json['couleur_dominante'];
    id = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['description'] = description;
    data['nom_tissu'] = nomTissu;
    data['couleur_dominante'] = couleurDominante;
    data['_id'] = id;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
