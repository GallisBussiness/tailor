import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:tailor/manager/loginmanager.dart';
import 'package:tailor/providers/provider.dart';
import 'package:tailor/screens/signupscreen.dart';
import 'package:tailor/utils/formutils.dart';
import 'package:tailor/utils/roundeddiv.dart';
import 'package:tailor/utils/theme.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final form = FormGroup({
    'username': FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(9),
      Validators.maxLength(9),
      Validators.pattern(telPattern)
    ]),
    'password': FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(6),
    ]),
  });
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
            Text("SE CONNECTER",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: secondary)),
            const SizedBox(
              height: 20,
            ),
            RoundedDiv(
              child: ReactiveTextField(
                formControlName: 'username',
                validationMessages: (control) => {
                  'required': 'Numéro de téléphone obligatoire !',
                  'minLength': '9 chiffres !',
                  'pattern': 'Numéro de téléphone invalide !'
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Numéro de téléphone",
                    hintStyle: const TextStyle(color: Colors.white),
                    icon: Icon(Icons.phone, color: secondary),
                    border: InputBorder.none),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RoundedDiv(
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
            const ReactiveSubmit(),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  const Text("Vous n'avez pas encore de compte ?"),
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupScreen())),
                      child: const Text("S'inscrire"))
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
      onPressed: () => login$.login(context, fb),
      child: const Text("SE CONNECTER", style: TextStyle(color: Colors.white)),
    );
  }
}
