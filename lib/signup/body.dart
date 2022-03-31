import 'package:flutter/material.dart';
import 'package:wed_planner/home.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:20,vertical: 50),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome Back', style: TextStyle(color: Colors.red[900], fontSize:30, fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Text('Sign In with your email and password',textAlign: TextAlign.center,style: TextStyle(color: Colors.pink[900],fontSize: 18),),
              SignInForm(),
            ],
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
  /*String url = MyUrl().getUrlDevice();
  final emailUser = new TextEditingController();
  final passUser = new TextEditingController();

  void processLogin() async {
    var dataLogin = await http.post(Uri.parse("$url/api/design"), body: {
      "email": emailUser.text,
      "password": passUser.text,
    });

    var dataUser = jsonDecode(dataLogin.body);

    print(dataUser);
  }*/

  final _formKey = GlobalKey<FormState>();
  bool remember=false;
  //final List<String> errors =["Demo error"];
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
            //FormError(errors: errors),
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
                Text('Forgot Password', style: TextStyle(decoration: TextDecoration.underline,decorationColor: Colors.black45,color: Colors.black45),)
              ],
            ),
            MaterialButton(onPressed:(){
              /*if(_formKey.currentState!.validate()){
                _formKey.currentState!.save();
              }*/
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>Home() ),);

            },elevation: 0, child: Text('Continue', style: TextStyle(fontSize: 18, color: Colors.white),),
              color: Colors.pink[900],minWidth: double.infinity ,padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ), ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('New User?', style: TextStyle(decoration: TextDecoration.underline,decorationColor: Colors.black45,color: Colors.black45),),
                Text('CreateAccount', style: TextStyle(decoration: TextDecoration.underline,decorationColor: Colors.black45,color: Colors.black45),)
              ],
            ),
          ],
        )
    );
  }
  TextFormField buildEmailFormField(){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      /*validator: (value){
        if (value!.isEmpty){
          setState(() {
            errors.add('please enter your email');
          });
          return null;
        }
      },*/
      //controller: emailUser,
      decoration: InputDecoration(
        labelText: "Email", hintText: "Enter your email",
        suffixIcon: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(Icons.email_outlined),
        ),
      ),
    );
  }

  TextFormField buildPasswordFormField(){
    return TextFormField(
      obscureText: true,
      //controller: passUser,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        suffixIcon: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(Icons.lock_outline),
        ),
      ),
    );
  }
}



