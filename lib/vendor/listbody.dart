import 'package:flutter/material.dart';
import 'package:wed_planner/theme.dart';
import 'package:wed_planner/vendor/decors/decors.dart';
import 'package:wed_planner/vendor/equipments/equipments.dart';
import 'package:wed_planner/vendor/mandap/mandap.dart';
import 'package:wed_planner/vendor/meals/meals.dart';
import 'package:wed_planner/vendor/venues/displayv.dart';
import 'package:wed_planner/vendor/venues/venue.dart';

class AddListBody extends StatefulWidget {
  const AddListBody({Key? key}) : super(key: key);

  @override
  State<AddListBody> createState() => _AddListBodyState();
}

class _AddListBodyState extends State<AddListBody> {
  @override
  Widget build(BuildContext context) {
    return Material(
        color:  Color(0xffF7DBD3),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTileTheme(
            data: listTileThemeData(),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                SizedBox(height: 10,),
                ListTile(
                  title: Row(
                    children: [
                      Image(image: AssetImage('assets/introduction_animation/venues.jpg'),height: 80,),
                      SizedBox(width: 30,),
                      Text('Venues', style: textStyle(),),
                    ],
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DisVenue()),);
                  },
                ),
                SizedBox(height: 10,),
                ListTile(
                  title: Row(
                    children: [
                      Image(image: AssetImage('assets/introduction_animation/meals.jpg'),height: 80,),
                      SizedBox(width: 30,),
                      Text('Meals', style: textStyle(),),
                    ],
                  ),
                    trailing: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(Icons.arrow_forward_ios),
                    ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Meals()),);
                  },
                ),
                SizedBox(height: 10,),
                ListTile(
                  title: Row(
                    children: [
                      Image(image: AssetImage('assets/introduction_animation/equipments.jpg'),height: 80,),
                      SizedBox(width: 30,),
                      Text('Equipments', style: textStyle(),),
                    ],
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Equipment()),);
                  },
                ),
                SizedBox(height: 10,),
                ListTile(
                  title: Row(
                    children: [
                      Image(image: AssetImage('assets/introduction_animation/mandap.jpg'),height: 80,),
                      SizedBox(width: 30,),
                      Text('Decors', style: textStyle(),),
                    ],
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Decor()),);
                  },
                ),
                SizedBox(height: 10,),
                ListTile(
                  title: Row(
                    children: [
                      Image(image: AssetImage('assets/introduction_animation/decors.jpg'),height: 70,),
                      SizedBox(width: 30,height: 10,),
                      Text('Mandap', style: textStyle(),),
                    ],
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Mandap()),);
                  },
                ),
                SizedBox(height: 10,),

                ListTile(
                  title: Row(
                    children: [
                      Image(image: AssetImage('assets/introduction_animation/transport.jpg'),height:60,),
                      SizedBox(width: 30,),
                      Text('Transport', style: textStyle(),),
                    ],
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                  onTap: (){},
                ),
                SizedBox(height: 10,),
                ListTile(
                  title: Row(
                    children: [
                      Image(image: AssetImage('assets/introduction_animation/seatings.jpg'),height:80,),
                      SizedBox(width: 30,),
                      Text('Seatings', style: textStyle(),),
                    ],
                  ),
                    trailing: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(Icons.arrow_forward_ios),
                    ),
                  onTap: (){},
                ),
              ],
            ),
          ),
        )
    );
  }
}
