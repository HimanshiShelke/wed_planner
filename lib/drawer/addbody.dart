import 'package:flutter/material.dart';
import 'package:wed_planner/theme.dart';
import 'package:wed_planner/vendor/decors/decors.dart';
import 'package:wed_planner/vendor/equipments/equipments.dart';
import 'package:wed_planner/vendor/mandap/mandap.dart';
import 'package:wed_planner/vendor/meals/meals.dart';
import 'package:wed_planner/vendor/venues/venue.dart';

class AddBody extends StatefulWidget {
  const AddBody({Key? key}) : super(key: key);

  @override
  State<AddBody> createState() => _AddBodyState();
}

class _AddBodyState extends State<AddBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        child: Material(
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
                      leading: Icon(Icons.business),
                      title: Text('Venues', style: textStyle(),),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Venue()),);
                      },
                    ),
                    SizedBox(height: 10,),
                    ListTile(
                      leading: Icon(Icons.set_meal_outlined),
                      title: Text('Meals', style: textStyle(),),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Meals()),);
                      },
                    ),
                    SizedBox(height: 10,),
                    ListTile(
                      leading: Icon(Icons.headphones),
                      title: Text('Equipments',style: textStyle()),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Equipment()),);
                      },
                    ),
                    SizedBox(height: 10,),
                    ListTile(
                      leading: Icon(Icons.deck_outlined),
                      title: Text('Decors',style: textStyle()),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Decor()),);
                      },
                    ),
                    SizedBox(height: 10,),
                    ListTile(
                      leading: Icon(Icons.wb_twilight_outlined),
                      title: Text('Mandap',style: textStyle()),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Mandap()),);
                      },
                    ),
                    SizedBox(height: 10,),

                    ListTile(
                      leading: Icon(Icons.image_outlined),
                      title: Text('Portfolio',style: textStyle()),
                      onTap: (){},
                    ),
                    SizedBox(height: 10,),
                    ListTile(
                      leading: Icon(Icons.volunteer_activism),
                      title: Text('Feedback',style: textStyle()),
                      onTap: (){},
                    ),
                  ],
                ),
              ),
            )
        ),
      ),
    );
  }
}
