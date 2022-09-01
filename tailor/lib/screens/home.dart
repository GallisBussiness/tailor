import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tailor/screens/clientscreen.dart';
import 'package:tailor/screens/modelscreen.dart';
import 'package:tailor/screens/orderscreen.dart';
import 'package:tailor/screens/paymentscreen.dart';
import 'package:tailor/utils/theme.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = const [
      ClientScreen(),
      OrderScreen(),
      ModelScreen(),
      PaymentScreen()
    ];
    return Scaffold(
      body: SafeArea(child: pages[pageIndex]),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        height: 50,
        items: const <Widget>[
          Icon(FontAwesomeIcons.users, size: 25, color: Colors.white),
          Icon(Icons.view_module, size: 30, color: Colors.white),
          Icon(Icons.image, size: 30, color: Colors.white),
          Icon(Icons.payment, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        color: primary,
        buttonBackgroundColor: primary,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
      ),
    );
  }
}
