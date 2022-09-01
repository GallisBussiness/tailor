import 'package:tailor/models/clientmodel.dart';
import 'package:tailor/models/modelmodel.dart';
import 'package:tailor/models/ordermodel.dart';
import 'package:tailor/models/paymentmodel.dart';

class User {
  String id;
  String prenom;
  String nom;
  String tel;
  String avatar;
  List<Client?> clients;
  List<Order?> orders;
  List<Payment?> payments;
  List<Model?> models;
  String createdAt;
  String updatedAt;

  User(
      {required this.id,
      required this.prenom,
      required this.nom,
      required this.tel,
      required this.avatar,
      required this.clients,
      required this.orders,
      required this.payments,
      required this.models,
      required this.createdAt,
      required this.updatedAt});

  factory User.fromJson(Map<String, dynamic> json) {
    List clients = json['clients'];
    List<Client?> cls = clients.map((c) => Client.fromJson(c)).toList();
    List orders = json['orders'];
    List<Order?> ords = orders.map((o) => Order.fromJson(o)).toList();
    List payments = json['payments'];
    List<Payment?> pyment = payments.map((p) => Payment.fromJson(p)).toList();
    List models = json['models'];
    List<Model?> mdls = models.map((m) => Model.fromJson(m)).toList();

    return User(
        id: json['_id'],
        prenom: json['prenom'],
        nom: json['nom'],
        tel: json['tel'],
        avatar: json['avatar'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        clients: cls,
        orders: ords,
        payments: pyment,
        models: mdls);
  }

  //

  static Map<String, dynamic> toJson(User u) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = u.id;
    data['prenom'] = u.prenom;
    data['nom'] = u.nom;
    data['tel'] = u.tel;
    data['avatar'] = u.avatar;
    data['clients'] = u.clients.map((v) => v?.toJson()).toList();

    data['orders'] = u.orders.map((v) => v?.toJson()).toList();

    data['payments'] = u.payments.map((v) => v?.toJson()).toList();

    data['models'] = u.models.map((v) => v?.toJson()).toList();
    data['createdAt'] = u.createdAt;
    data['updatedAt'] = u.updatedAt;
    return data;
  }
}
