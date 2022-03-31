import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wed_planner/drawer/components.dart';
import 'package:wed_planner/home.dart';
import 'package:wed_planner/signin/loginscreen.dart';


class NavBar_wi extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    //final name="himanshi";
    // final email='hiya@gmail.com';
    //final img = 'assets/introduction_animation/couple.png';
    return Drawer(
      child: Material(
        color: Colors.pink[900],
        child: ListView(
          children: <Widget>[
            /*buildHeader(
              img: img,
              name : name,
              email:email,
              onClicked: (){},
            ),*/
            Container(
              padding: padding,
              child: Column(
                children: [
              Divider(color: Colors.yellow[400],),
              buildMenuItem(
                text:'Plan Event',
                icon:Icons.widgets_outlined,
                onClicked: ()=> selectedItem(context,0),
              ),
              const SizedBox(height: 10,),
              buildMenuItem(
                text:'Portfolio',
                icon:Icons.amp_stories_outlined,
                onClicked: ()=> selectedItem(context,1) ,
              ),
              Divider(color: Colors.yellow[400],),
              buildMenuItem(
                text:'Event Status',
                icon:Icons.art_track_sharp,
                onClicked:  ()=> selectedItem(context,2),
              ),
              const SizedBox(height: 10,),
              buildMenuItem(
                text:'Add Vendors',
                icon:Icons.add_business_outlined,
                onClicked:  ()=> selectedItem(context,3),
              ),
              const SizedBox(height: 10,),
              buildMenuItem(
                text:'Update Vendors',
                icon:Icons.account_tree_outlined,
                onClicked:  ()=> selectedItem(context,4),
              ),
              Divider(color: Colors.yellow[400],),
              buildMenuItem(
                text:'Customer Feedback',
                icon:Icons.volunteer_activism,
                onClicked:  ()=> selectedItem(context,5),
              ),
              const SizedBox(height: 10,),
              buildMenuItem(
                text:'Sign Out',
                icon:Icons.logout_outlined,
                onClicked:  ()=> selectedItem(context,6),
              ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white60;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color),),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  Widget buildHeader({
  required String img,
  required String name,
  required String email,
  required VoidCallback onClicked,
})=>InkWell(
    onTap: onClicked,
    child: Container(
      padding: padding.add(EdgeInsets.symmetric(vertical:40)),
      child: Row(
        children: [
          CircleAvatar(radius: 30, backgroundImage: AssetImage(img),),
          SizedBox(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,style: TextStyle(fontSize: 20, color: Colors.white),),
              Text(email,style: TextStyle(fontSize: 14, color: Colors.white),),
            ],
          ),
          Spacer(),
          CircleAvatar(
            radius: 24,backgroundColor:  Colors.red[600], child: Icon(Icons.add_comment_outlined,color: Colors.white,),
          )
        ],
      ),
    ),
  );
  void selectedItem(BuildContext context,int index){
    Navigator.of(context).pop();
    switch(index){
      case 0:
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddComponents()));
        break;

      case 1:
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home()));
        break;

      case 2:
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home()));
        break;

      case 3:
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home()));
        break;

      case 4:
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home()));
        break;

      case 5:
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home()));
        break;

      case 6:
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home()));
        break;
    }
  }

}



