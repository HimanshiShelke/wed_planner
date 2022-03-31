import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wed_planner/drawer/components.dart';
import 'package:wed_planner/drawer/navbar.dart';
import 'package:wed_planner/vendor/listbody.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Home Page"),
      ),
      drawer: NavBar_wi(),
      body: AddListBody(),
    );
  }
}