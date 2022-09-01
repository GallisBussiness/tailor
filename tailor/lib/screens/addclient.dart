import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tailor/manager/usermanager.dart';
import 'package:tailor/models/responseloginmodel.dart';
import 'package:tailor/providers/provider.dart';
import 'package:tailor/utils/roundeddiv.dart';
import 'package:tailor/utils/theme.dart';

class AddClient extends StatelessWidget {
  AddClient({Key? key}) : super(key: key);

  final form = FormGroup({
    'prenom': FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(2),
      Validators.maxLength(100)
    ]),
    'nom': FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(1),
      Validators.maxLength(50)
    ]),
    'tel': FormControl<String>(validators: [
      Validators.required,
      Validators.maxLength(9),
      Validators.minLength(9),
    ]),
    'adresse': FormControl<String>(validators: [
      Validators.required,
      Validators.maxLength(100),
      Validators.minLength(3),
    ]),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: primary, title: const Text("AJOUTER UN CLIENT")),
        body: SingleChildScrollView(
          child: ReactiveForm(
            formGroup: form,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text("CREER UN CLIENT",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 20,
                ),
                RoundedDiv(
                  child: ReactiveTextField(
                    formControlName: 'prenom',
                    validationMessages: (control) => {
                      'required': 'Prenom obligatoire !',
                      'minLength': 'au moins deux caracteres !',
                      'maxLength': 'au max cents caracteres !'
                    },
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        hintText: "Prénom",
                        hintStyle: const TextStyle(color: Colors.white),
                        fillColor: Colors.white,
                        icon: Icon(
                          Icons.person,
                          color: secondary,
                        ),
                        border: InputBorder.none),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                RoundedDiv(
                  child: ReactiveTextField(
                    formControlName: 'nom',
                    validationMessages: (control) => {
                      'required': 'Nom obligatoire !',
                      'minLength': 'au moins une caractere !',
                      'maxLength': 'au max 50 caracteres !'
                    },
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        hintText: "Nom",
                        hintStyle: const TextStyle(color: Colors.white),
                        fillColor: Colors.white,
                        icon: Icon(Icons.person, color: secondary),
                        border: InputBorder.none),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                RoundedDiv(
                  child: ReactiveTextField(
                    formControlName: 'tel',
                    validationMessages: (control) => {
                      'required': 'Numéro de téléphone obligatoire !',
                      'minLength': '9 chiffres !',
                      'pattern': 'Numéro de téléphone invalide !'
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "Numéro de téléphone",
                        hintStyle: const TextStyle(color: Colors.white),
                        fillColor: Colors.white,
                        icon: Icon(Icons.phone, color: secondary),
                        border: InputBorder.none),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                RoundedDiv(
                  child: ReactiveTextField(
                    formControlName: 'adresse',
                    validationMessages: (control) => {
                      'required': 'Adresse obligatoire !',
                      'minLength': 'au moins trois caractere !',
                      'maxLength': 'au max cents caracteres !'
                    },
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        hintText: "Adresse",
                        hintStyle: const TextStyle(color: Colors.white),
                        fillColor: Colors.white,
                        icon: Icon(Icons.location_on, color: secondary),
                        border: InputBorder.none),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const ReactiveSubmit(),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ));
  }
}

class ReactiveSubmit extends StatefulWidget {
  const ReactiveSubmit({Key? key}) : super(key: key);

  @override
  State<ReactiveSubmit> createState() => _ReactiveSubmitState();
}

class _ReactiveSubmitState extends State<ReactiveSubmit> {
  late SharedPreferences _prefs;
  late ResponseLoginModel user;

  void initial() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      user = ResponseLoginModel.fromJson(jsonDecode(_prefs.getString('user')!));
    });
  }

  @override
  void initState() {
    super.initState();
    initial();
  }

  @override
  Widget build(BuildContext context) {
    UserManager userm$ = Provider.of(context).summon<UserManager>();
    final fb = ReactiveForm.of(context);
    return RoundedLoadingButton(
      color: primary,
      controller: userm$.btnController,
      onPressed: () => userm$.addClient(context, fb, user.id),
      child: const Text("AJOUTER", style: TextStyle(color: Colors.white)),
    );
  }
}
