import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:wed_planner/home.dart';
import 'package:wed_planner/signin/form_error.dart';


class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:20,vertical: 10),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text('Welcome Back', style: TextStyle(color: Colors.red[900], fontSize:26, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text('Sign In with your email and password',textAlign: TextAlign.center,style: TextStyle(color: Colors.pink[900],fontSize: 14),),
                SignInForm(),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}



class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  //String url = MyUrl().getUrlDevice();
  final emailController = new TextEditingController();
  final passController = new TextEditingController();
  bool _isLoading = false;
  void processLogin() async {
    var dataLogin = await http.post(Uri.parse('http://10.0.2.2:5000/login'), body: {
      'username': emailController.text,
      "userpassword": passController.text,
    });

    var dataUser = jsonDecode(dataLogin.body);

    print(dataUser);
  }
  final _formKey = GlobalKey<FormState>();
  late String semail;
  late String spassword;
  bool remember=false;
  final List<String> errors =[];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
        child: Column(
          children: [
            SizedBox(height: 30,),
            buildEmailFormField(),
            SizedBox(height: 20,),
            buildPasswordFormField(),
            SizedBox(height: 20,),
            FormError(errors: errors),
            Row(
              children: [
                Checkbox(
                    value: remember,
                    onChanged: (value){
                      setState(() {
                          remember = value!;
                      });
                }),
                Text('Remember me'),
              Spacer(),
                Text('Forgot Password', style: TextStyle(decoration: TextDecoration.underline, decorationColor: Colors.black45,color: Colors.black45),)
              ],
            ),
            
            MaterialButton(onPressed:(){
              if(_formKey.currentState!.validate()){
                _formKey.currentState!.save();
                setState(() {
                  _isLoading = true;
                });
                //processLogin();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>Home() ),);
              }

              /*Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>Home() ),);*/
              /*else{
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistrationScreen() ),);
              }*/

            },elevation: 0, child: Text('Continue', style: TextStyle(fontSize: 18, color: Colors.white),),minWidth: double.infinity ,padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),color: Colors.red[700],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ), ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('New User?', style: TextStyle(color: Colors.black45),),
                Text('CreateAccount', style: TextStyle(decoration: TextDecoration.underline,decorationColor: Colors.red[900],color: Colors.red[900]),)
              ],
            ),
          ],
        )
    );
  }
  TextFormField buildEmailFormField(){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => semail = newValue!,
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
      controller: emailController,
      decoration: InputDecoration(
        prefixIcon:Padding(
      padding: const EdgeInsets.all(1.0),
      child: Icon(Icons.email_outlined),
    ),
        labelText: "Email", hintText: "Enter your email",
      ),
    );
  }

  TextFormField buildPasswordFormField(){
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => spassword = newValue!,
      onChanged: (value){
        if (value.isNotEmpty && errors.contains(kPassNullError)){
          setState(() {
            errors.remove(kPassNullError);

          });}
        else if(value.length > 8 && errors.contains(kShortPassError) ){
          setState(() {
            errors.remove(kShortPassError);
          });
        }
      },
      validator: (value){
        if (value!.isEmpty && !errors.contains(kPassNullError)){
          setState(() {
            errors.add(kPassNullError);
          });
          return "";
        }
        else if(value.length < 8 && !errors.contains(kShortPassError) ){
          setState(() {
            errors.add(kShortPassError);
          });
          return "";
        }
        return null;
      },
      controller: passController,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(2),
          child: Icon(Icons.lock_outline),
        ),
        labelText: "Password",
        hintText: "Enter your password",
      ),
    );
  }
}



