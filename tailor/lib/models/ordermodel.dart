class Order {
  Order({
    required this.dateDeLivraison,
    required this.isComplete,
    required this.client,
    required this.model,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });
  late final String dateDeLivraison;
  late final bool isComplete;
  late final String client;
  late final String model;
  late final String id;
  late final String createdAt;
  late final String updatedAt;

  Order.fromJson(Map<String, dynamic> json) {
    dateDeLivraison = json['date_de_livraison'];
    isComplete = json['isComplete'];
    client = json['client'];
    model = json['model'];
    id = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['date_de_livraison'] = dateDeLivraison;
    data['isComplete'] = isComplete;
    data['client'] = client;
    data['model'] = model;
    data['_id'] = id;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
