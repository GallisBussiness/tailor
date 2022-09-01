import 'package:flutter/material.dart';
import 'package:tailor/utils/roundeddiv.dart';
import 'package:tailor/utils/theme.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: primary, title: const Text("Gestion des commandes")),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: const [
            SizedBox(
              height: 10,
            ),
            RoundedDiv(
                child: TextField(
              decoration: InputDecoration(
                hintText: "Rechercher une commande",
                hintStyle: TextStyle(fontSize: 20, color: Colors.white),
                icon: Icon(Icons.search, color: Colors.white),
                border: InputBorder.none,
              ),
            ))
          ],
        ),
      ),
    );
  }
}
