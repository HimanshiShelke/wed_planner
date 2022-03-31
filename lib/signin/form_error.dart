import 'package:flutter/material.dart';


class MyUrl {
  //String urlDevice = "";
  String urlDevice = "http://10.0.2.2:5000/";
  //String urlDevice = "http://localhost/CodeIgniter";

  String getUrlDevice() {
    return this.urlDevice;
  }
}

class FormError extends StatelessWidget {
  const FormError({Key? key, required this.errors,}) : super(key: key);
  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(errors.length, (index) => formErrorText(error: errors[index])),
    );
  }

  Row formErrorText({required String error}){
    return Row(
      children: [
        Icon(Icons.error_outline, color: Colors.red[900],),
        Text(error),
      ],
    );
  }
}


//Form Error
final RegExp emailValidatiorRegExp = RegExp(r"^[a-zA-Z0-9]+\.@[a-zA-Z]+");
const String kEmailNullError ="Please enter your email";
const String kInvalidEmailError ="Please enter valid email";
const String kPassNullError ="Please enter your password";
const String kShortPassError ="Password is too short";
const String kMatchPassError ="Password don't match";