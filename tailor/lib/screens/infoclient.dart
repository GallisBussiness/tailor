import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:tailor/manager/usermanager.dart';
import 'package:tailor/models/clientmodel.dart';
import 'package:tailor/providers/provider.dart';
import 'package:tailor/services/constants.dart';
import 'package:tailor/utils/formutils.dart';
import 'package:tailor/utils/roundeddiv.dart';
import 'package:tailor/utils/theme.dart';

class InfoClient extends StatelessWidget {
  const InfoClient({Key? key, required this.client}) : super(key: key);
  final Client client;
  @override
  Widget build(BuildContext context) {
    final form = FormGroup({
      'tel': FormControl<String>(value: client.tel, validators: [
        Validators.required,
        Validators.minLength(9),
        Validators.pattern(telPattern)
      ]),
      'prenom': FormControl<String>(
          value: client.prenom, validators: [Validators.required]),
      'nom': FormControl<String>(
          value: client.nom, validators: [Validators.required]),
      'adresse': FormControl<String>(value: client.adresse, validators: [
        Validators.required,
        Validators.maxLength(100),
        Validators.minLength(3),
      ]),
    });

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Hero(
                    tag: client.id,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "$uploadClientUrl/${client.avatar}"))),
                    ),
                  ),
                  const SizedBox(height: 2),
                  ElevatedButton.icon(
                      onPressed: null,
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(primary)),
                      icon: Icon(Icons.camera, color: secondary),
                      label: const Text("Modifier photo",
                          style: TextStyle(color: Colors.white))),
                ],
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.person),
                      const SizedBox(width: 5),
                      Text("${client.prenom} ${client.nom}",
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                      onPressed: null,
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(secondary)),
                      icon: const Icon(Icons.phone),
                      label: Text("(+221) ${client.tel}",
                          style: const TextStyle(color: Colors.white))),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.location_on),
                      const SizedBox(width: 5),
                      Text(client.adresse,
                          style: TextStyle(
                              color: secondary,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ],
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 10),

          // making form
          ReactiveForm(
            formGroup: form,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Informations",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: secondary)),
                const SizedBox(
                  height: 20,
                ),
                RoundedInput(
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
                RoundedInput(
                  child: ReactiveTextField(
                    formControlName: 'prenom',
                    validationMessages: (control) =>
                        {'required': 'Prenom obligatoire !'},
                    decoration: InputDecoration(
                      hintText: "Prenom",
                      fillColor: Colors.white,
                      hintStyle: const TextStyle(color: Colors.white),
                      icon: Icon(Icons.person, color: secondary),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                RoundedInput(
                  child: ReactiveTextField(
                    formControlName: 'nom',
                    decoration: InputDecoration(
                      hintText: "Nom",
                      fillColor: Colors.white,
                      hintStyle: const TextStyle(color: Colors.white),
                      icon: Icon(Icons.person, color: secondary),
                      border: InputBorder.none,
                    ),
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
                        icon: Icon(
                          Icons.location_on,
                          color: secondary,
                        ),
                        border: InputBorder.none),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ReactiveSubmit(
                  id: client.id,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReactiveSubmit extends StatelessWidget {
  const ReactiveSubmit({Key? key, required this.id}) : super(key: key);
  final String id;
  @override
  Widget build(BuildContext context) {
    UserManager user$ = Provider.of(context).summon<UserManager>();
    final fb = ReactiveForm.of(context);
    return RoundedLoadingButton(
      color: secondary,
      controller: user$.btnController,
      onPressed: () => user$.updateClient(context, fb, id),
      child: const Text("MODIFIER", style: TextStyle(color: Colors.white)),
    );
  }
}
