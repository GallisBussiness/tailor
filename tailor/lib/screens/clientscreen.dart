import 'package:flutter/material.dart';
import 'package:tailor/manager/clientmanager.dart';
import 'package:tailor/manager/loginmanager.dart';
import 'package:tailor/models/clientmodel.dart';
import 'package:tailor/models/usermodel.dart';
import 'package:tailor/providers/provider.dart';
import 'package:tailor/screens/addclient.dart';
import 'package:tailor/screens/clientdetailscreen.dart';
import 'package:tailor/services/constants.dart';
import 'package:tailor/services/userservice.dart';
import 'package:tailor/utils/observer.dart';
import 'package:tailor/utils/roundeddiv.dart';
import 'package:tailor/utils/theme.dart';

class ClientScreen extends StatelessWidget {
  const ClientScreen({Key? key}) : super(key: key);

  void refresh(LoginManager login) async {
    login.inUser.add(await UserService.getUser());
  }

  @override
  Widget build(BuildContext context) {
    LoginManager loginM = Provider.of(context).summon<LoginManager>();
    ClientManager clientM = Provider.of(context).summon<ClientManager>();
    refresh(loginM);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: const Text("Gestion des clients"),
        actions: [
          IconButton(
              onPressed: () => refresh(loginM), icon: const Icon(Icons.refresh))
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Observer<String>(
                  stream: clientM.search$,
                  builder: (context, search) => RoundedDiv(
                      child: TextField(
                    onChanged: clientM.inSearch.add,
                    decoration: const InputDecoration(
                      hintText: "Rechercher un client",
                      hintStyle: TextStyle(fontSize: 20, color: Colors.white),
                      icon: Icon(Icons.search, color: Colors.white),
                      border: InputBorder.none,
                    ),
                  )),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Expanded(
              child: Observer<User?>(
                  stream: loginM.user$,
                  builder: (context, user) {
                    return ListView.separated(
                        itemBuilder: (context, index) {
                          Client? client = user!.clients[index];
                          return InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ClientDetail(client: client!))),
                            child: ListTile(
                              leading: Hero(
                                tag: client!.id,
                                child: CircleAvatar(
                                    child: Image.network(
                                        "$uploadClientUrl/${client.avatar}")),
                              ),
                              title: Text("${client.prenom} ${client.nom}"),
                              subtitle: Text(client.tel),
                              trailing: Text(client.adresse),
                            ),
                          );
                        },
                        separatorBuilder: (context, i) => const Divider(),
                        itemCount: user!.clients.length);
                  }))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddClient()));
          },
          backgroundColor: primary,
          child: const Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
