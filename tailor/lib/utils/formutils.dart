import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:tailor/utils/theme.dart';

ValidatorFunction mustMatch(String controlName, String matchingControlName) {
  return (AbstractControl<dynamic> control) {
    final form = control as FormGroup;

    final formControl = form.control(controlName);
    final matchingFormControl = form.control(matchingControlName);

    if (formControl.value != matchingFormControl.value) {
      matchingFormControl.setErrors({'mustMatch': true});

      matchingFormControl.markAsTouched();
    } else {
      matchingFormControl.removeError('mustMatch');
    }

    return null;
  };
}

const telPattern = r'^7[7608][0-9]{7}$';

class RoundedInput extends StatelessWidget {
  const RoundedInput({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
          color: primary,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ]),
      child: child,
    );
  }
}
