import 'package:flutter/material.dart';
import 'package:wed_planner/signin/form_error.dart';
import 'package:wed_planner/signin/loginscreen.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({Key? key}) : super(key: key);

  @override
  _ForgotPassScreenState createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  final _fkey = GlobalKey<FormState>();

  final List<String> errors =[];
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Form(
          key: _fkey,
          child:  Column(
            children: [
              emailFormField(),
              MaterialButton(onPressed:(){
                if(_fkey.currentState!.validate()){
                  _fkey.currentState!.save();
                  //processLogin();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>LoginScreen() ),);
                }
                /*else{
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistrationScreen() ),);
              }*/

              },elevation: 0, child: Text('Continue', style: TextStyle(fontSize: 18, color: Colors.white),),minWidth: double.infinity ,padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),color: Colors.red[700],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ), ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField emailFormField(){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onChanged: (value){
        if (value.isNotEmpty && errors.contains(kEmailNullError)){
          setState(() {
            errors.remove(kEmailNullError);

          });}
      },
      validator: (value){
        if (value!.isEmpty && !errors.contains(kEmailNullError)){
          setState(() {
            errors.add(kEmailNullError);
          });
          return "";}
        return null;
      },
      //controller: emailUser,
      decoration: InputDecoration(
        prefixIcon:Padding(
          padding: const EdgeInsets.all(1.0),
          child: Icon(Icons.email_outlined),
        ),
        labelText: "Email", hintText: "Enter your email",
      ),
    );
  }
}
