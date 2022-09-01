import 'package:flutter/material.dart';

import 'package:tailor/models/clientmodel.dart';
import 'package:tailor/screens/infoclient.dart';
import 'package:tailor/screens/mesurementscreen.dart';
import 'package:tailor/utils/theme.dart';

class ClientDetail extends StatelessWidget {
  const ClientDetail({Key? key, required this.client}) : super(key: key);
  final Client client;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: primary,
            title: Text("${client.prenom} ${client.nom}"),
            bottom: TabBar(
              tabs: [
                Row(
                  children: [
                    Icon(Icons.person, color: secondary),
                    const SizedBox(width: 2),
                    const Text("Informations", style: TextStyle(fontSize: 15))
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.gif_box, color: secondary),
                    const SizedBox(width: 2),
                    const Text("Mesures", style: TextStyle(fontSize: 15))
                  ],
                )
              ],
            ),
          ),
          body: TabBarView(children: [
            InfoClient(client: client),
            const MesurementScreen()
          ])),
    );
  }
}
