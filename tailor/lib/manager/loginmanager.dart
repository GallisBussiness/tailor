import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tailor/manager/manager.dart';
import 'package:tailor/models/responseloginmodel.dart';
import 'package:tailor/models/signupmodel.dart';
import 'package:tailor/models/usermodel.dart';
import 'package:tailor/screens/home.dart';
import 'package:tailor/services/userservice.dart';

class LoginManager extends Manager {
  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();

  final BehaviorSubject<User> _userSubject = BehaviorSubject<User>();

  Stream<User?> get user$ => _userSubject.stream;

  Sink<User?> get inUser => _userSubject.sink;

  void signup(BuildContext context, AbstractControl<Object>? fb) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (fb!.valid) {
        SignupModel s = SignupModel.fromJson(fb.value as Map<String, dynamic>);
        ResponseLoginModel? response =
            await UserService.signUp(SignupModel.toJson(s));
        if (response != null) {
          await prefs.setBool('isLogged', true);
          await prefs.setString(
              'user', jsonEncode(ResponseLoginModel.toJson(response)));
          btnController.reset();
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

  void login(BuildContext context, AbstractControl<Object>? fb) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (fb!.valid) {
        ResponseLoginModel? response = await UserService.login(fb.value);
        if (response != null) {
          await prefs.setBool('isLogged', true);
          await prefs.setString(
              'user', jsonEncode(ResponseLoginModel.toJson(response)));
          btnController.reset();
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
  void dispose() {
    _userSubject.close();
  }
}
