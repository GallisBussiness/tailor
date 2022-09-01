// import 'dart:convert';

// import 'package:ecampus/models/Compte.dart';
// import 'package:ecampus/services/compteservice.dart';
// import 'package:ecampus/services/constants.dart';
// import 'package:http/http.dart' as http;

// class VirementService {
//   static Future<bool> transfert(String nce, int idFrom, int montant) async {
//     try {
//       Compte compte = await CompteService.getCompteByNce(nce);
//       Map<String, String> body = {
//         "id_from": "$idFrom",
//         "id_to": "${compte.id}",
//         "montant": "$montant"
//       };
//       http.Response content = await http.post(
//           Uri.parse("$backUrl/api/operations/virement"),
//           body: jsonEncode(body),
//           headers: {"content-Type": "application/json"});
//       return jsonDecode(content.body);
//     } catch (e) {
//       return false;
//     }
//   }

//   static Future<bool> paySocial(
//       int id, int bed, String month, int montant) async {
//     try {
//       Map<String, String> body = {
//         "id": "$id",
//         "montant": "$montant",
//         "description": "Payement chambre N $bed à $montant",
//       };
//       http.Response content = await http.post(
//           Uri.parse("$backUrl/api/operations/retrait"),
//           body: jsonEncode(body),
//           headers: {"content-Type": "application/json"});
//       return content.body != "false";
//     } catch (e) {
//       return false;
//     }
//   }
// }
