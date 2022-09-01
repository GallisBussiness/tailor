import 'package:flutter/material.dart';
import 'package:tailor/utils/roundeddiv.dart';
import 'package:tailor/utils/theme.dart';

class ModelScreen extends StatelessWidget {
  const ModelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: primary, title: const Text("Gestion des modeles")),
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
                hintText: "Rechercher un model",
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
