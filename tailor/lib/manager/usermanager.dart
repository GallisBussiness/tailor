import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:tailor/manager/manager.dart';
import 'package:tailor/models/clientmodel.dart';
import 'package:tailor/screens/home.dart';
import 'package:tailor/services/userservice.dart';

class UserManager extends Manager {
  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();

  void addClient(
      BuildContext context, AbstractControl<Object>? fb, String id) async {
    try {
      if (fb!.valid) {
        Client? client = await UserService.addClient(fb.value, id);
        if (client != null) {
          btnController.reset();
          // ignore: use_build_context_synchronously
          Navigator.pop(context);
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const Home()));
        } else {
          throw Error();
        }
        btnController.reset();
      } else {
        Fluttertoast.showToast(
            msg: "Formulaire invalid !",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM_RIGHT,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        btnController.reset();
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Une Erreur s'est produite!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM_RIGHT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      btnController.reset();
    }
  }

  void updateClient(
      BuildContext context, AbstractControl<Object>? fb, String id) async {
    try {
      if (fb!.valid) {
        Client? client = await UserService.updateClient(fb.value, id);
        if (client != null) {
          btnController.reset();
          Fluttertoast.showToast(
              msg: "Les informations de ce client ont été modifiées",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.TOP_RIGHT,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
          // ignore: use_build_context_synchronously
          Navigator.pop(context);
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const Home()));
        } else {
          throw Error();
        }
        btnController.reset();
      } else {
        Fluttertoast.showToast(
            msg: "Formulaire invalid !",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM_RIGHT,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        btnController.reset();
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Une Erreur s'est produite!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM_RIGHT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      btnController.reset();
    }
  }

  @override
  void dispose() {}
}
