import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:wed_planner/home.dart';
import 'dart:ui';

import 'package:wed_planner/signin/loginscreen.dart';

class IntroScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _IntroScreen();
  }

}

class _IntroScreen extends State<IntroScreen>{

  @override
  Widget build(BuildContext context) {

    //this is a page decoration for intro screen
    PageDecoration pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w700,
          color:Colors.red[900]
        ), //tile font size, weight and color
      bodyTextStyle:TextStyle(
          fontSize: 19.0,
          color:Colors.pink[900]),
      //body text size and color
      titlePadding: EdgeInsets.only(bottom: 10),
      bodyPadding: EdgeInsets.only(bottom: 90),
      bodyAlignment: Alignment.bottomCenter,
      //dPadding: EdgeInsets.only(top: 0, left: 16, right: 16, bottom:16),
      //decription padding
       //imagePadding: EdgeInsets.only(top:10,bottom: 10), //image padding
        imageFlex:2,
      boxDecoration:BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          // stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            Colors.pinkAccent,
           // Colors.white10,
            Color(0xffF7DAC2),
            Color(0xffF7DBD3)
          ],
        ),
        color: Colors.amber,
        backgroundBlendMode: BlendMode.color,
      ),
      );

    return Scaffold(
      body: IntroductionScreen(
        //globalBackgroundColor:Color(0xffF7DBD3),
        //main background of screen
        pages: [ //set your page view here
          PageViewModel(
            title: "Welcome",
            body: "You work for others dream, We will work for you.",
            image: introImage('assets/introduction_animation/wed.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Relax",
            body: "Release your stress! we will help you to manage.",
            image: introImage('assets/introduction_animation/wel.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Happy Journey",
            body: "All the best for your new journey of management.",
            image: introImage('assets/introduction_animation/des.png'),
            decoration: pageDecoration,
          ),

          //add more screen here
        ],

        onDone: () => goHomepage(context), //go to home page on done
        onSkip: () => goHomepage(context), // You can override on skip
        showSkipButton: true,
        nextFlex: 0,
        skipOrBackFlex: 0,
        skip: Text('Skip', style: TextStyle(color: Colors.pink[900]),),
        next: Icon(Icons.arrow_forward_ios_rounded, color: Colors.brown,),
        done: Text('Lets Begin', style: TextStyle(
            fontWeight: FontWeight.w600, color:Colors.pink[900]
        ),),
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0), //size of dots
          color: Colors.brown, //color of dots
          activeSize: Size(10.0, 10.0),
          activeColor: Colors.pink,
          //activeColor: Colors.white, //color of active dot
          activeShape: RoundedRectangleBorder( //shave of active dot
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
      ),
    );
  }

  void goHomepage(context){
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context){
          return LoginScreen() ;
        }
        ), (Route<dynamic> route) => false);
    //Navigate to home page and remove the intro screen history
    //so that "Back" button wont work.
  }

  Widget introImage(String assetName) {
    //widget to show intro image
    return Align(
      child: Image.asset('$assetName', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }
}