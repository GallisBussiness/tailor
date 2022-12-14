import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:tailor/manager/loginmanager.dart';
import 'package:tailor/providers/provider.dart';
import 'package:tailor/screens/loginscreen.dart';
import 'package:tailor/utils/formutils.dart';
import 'package:tailor/utils/theme.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  final form = FormGroup({
    'tel': FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(9),
      Validators.pattern(telPattern)
    ]),
    'prenom': FormControl<String>(validators: [Validators.required]),
    'nom': FormControl<String>(validators: [Validators.required]),
    'password': FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(6),
    ]),
    'passwordConfirmation': FormControl<String>(
        validators: [Validators.required, Validators.minLength(6)]),
  }, validators: [
    mustMatch('password', 'passwordConfirmation')
  ]);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: ReactiveForm(
        formGroup: form,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: SizedBox(
                  height: 300,
                  width: size.width * 0.5,
                  child: Image.asset('assets/images/logo.jpg')),
            ),
            Text("S'INSCRIRE",
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
                  'required': 'Num??ro de t??l??phone obligatoire !',
                  'minLength': '9 chiffres !',
                  'pattern': 'Num??ro de t??l??phone invalide !'
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Num??ro de t??l??phone",
                    hintStyle: const TextStyle(color: Colors.white),
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
                formControlName: 'password',
                validationMessages: (control) =>
                    {'required': 'Renseignez le mot de passe !'},
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Mot de Passe",
                  hintStyle: const TextStyle(color: Colors.white),
                  icon: Icon(Icons.security, color: secondary),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RoundedInput(
              child: ReactiveTextField(
                formControlName: 'passwordConfirmation',
                validationMessages: (control) => {
                  'required': 'Confirmer le mot de passe !',
                  'mustMatch': 'Les mots de passe ne correspondent pas !'
                },
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Confirmer le mot de passe",
                  hintStyle: const TextStyle(color: Colors.white),
                  icon: Icon(Icons.security, color: secondary),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const ReactiveSubmit(),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  const Text("Vous avez d??ja une compte ?"),
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen())),
                      child: const Text("Se connecter"))
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class ReactiveSubmit extends StatelessWidget {
  const ReactiveSubmit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginManager login$ = Provider.of(context).summon<LoginManager>();
    final fb = ReactiveForm.of(context);
    return RoundedLoadingButton(
      color: secondary,
      controller: login$.btnController,
      onPressed: () => login$.signup(context, fb),
      child: const Text("S'INSCRIRE", style: TextStyle(color: Colors.white)),
    );
  }
}
