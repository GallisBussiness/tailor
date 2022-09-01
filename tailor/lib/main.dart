import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tailor/manager/clientmanager.dart';
import 'package:tailor/manager/loginmanager.dart';
import 'package:tailor/manager/usermanager.dart';
import 'package:tailor/providers/provider.dart';
import 'package:tailor/screens/home.dart';
import 'package:tailor/screens/loginscreen.dart';
// import 'package:tailor/screens/signupscreen.dart';
import 'package:tailor/utils/supervisor.dart';

void main() {
  runApp(Provider(
      data: Supervisor()
          .register<UserManager>(() => UserManager())
          .register<LoginManager>(() => LoginManager())
          .register<ClientManager>(() => ClientManager()),
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late SharedPreferences _prefs;
  late bool isLogged = false;

  void initial() async {
    _prefs = await SharedPreferences.getInstance();
    isLogged = _prefs.getBool('isLogged') ?? false;
  }

  @override
  void initState() {
    super.initState();
    initial();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tailor Pro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isLogged ? const Home() : LoginScreen(),
    );
  }
}
