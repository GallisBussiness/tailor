class Payment {
  Payment({
    required this.solde,
    required this.avance,
    required this.reste,
    required this.order,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int solde;
  late final int avance;
  late final int reste;
  late final String order;
  late final String id;
  late final String createdAt;
  late final String updatedAt;

  Payment.fromJson(Map<String, dynamic> json) {
    solde = json['solde'];
    avance = json['avance'];
    reste = json['reste'];
    order = json['order'];
    id = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['solde'] = solde;
    data['avance'] = avance;
    data['reste'] = reste;
    data['order'] = order;
    data['_id'] = id;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
