import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


Future<List<MData>> fetchMealsData() async {
  String url='http://10.0.2.2:5000/getmeals';
  final response =
  await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    List jsonResponse = jsonDecode(response.body);
    print ("Connection Successful");
    return jsonResponse.map((data) => new MData.fromJson(data)).toList();
    //return jsonResponse.map((data) => new Data.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

class MData {
  MData ({
    required this.mealsname,
    required this.mealsdetails,
    required this.mealscost,
    //required this.mealscontact,
    //required this.mealsimage,
  });

  String mealsname;
  String mealsdetails;
  // int mealscontact;
  double mealscost;
  //int mealsimage;



  factory MData.fromJson(Map<String, dynamic> json) => MData(
    //meals_id : json["meals_id"],
    mealsname : json["mealsname"],
    mealsdetails: json["mealsdetails"],
    //mealsaddress : json["mealsaddress"],
    //mealscontact :json["mealscontact"],
    mealscost: json["mealscost"],
    //mealsimage :json["mealsimage"],



  );

  Map<String, dynamic> toJson() => {

    //"meals_id" : meals_id,
    "mealsname" : mealsname,
    "mealsdetails" : mealsdetails,
    //"mealsaddress" : mealsaddress,
    //"mealscontact" : mealscontact.toString(),
    "mealscost" : mealscost,
    //"mealsimage": mealsimage.toString(),



  };
}


class Meals extends StatefulWidget {
  const Meals({Key? key}) : super(key: key);

  @override
  _MealsState createState() => _MealsState();
}

class _MealsState extends State<Meals> {
  late Future<List<MData>> futureMData;

  @override
  void initState() {
    super.initState();
    futureMData = fetchMealsData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('meals'),/*leading: IconButton(onPressed: (){
        /*Navigator.push(
          context,
          //MaterialPageRoute(builder: (context) =>InsertData()),);*/
      }, icon: Icon(Icons.add)),*/
      ),
      body: Center(
        child: FutureBuilder<List<MData>>(
          future: futureMData,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<MData> data = snapshot.data;
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Icon(Icons.person),
                      title: Text(data[index].mealsname),
                      subtitle: Column(
                        children: [
                          Text(data[index].mealscost.toString()),
                          Text(data[index].mealsdetails),
                        ],
                      ),
                      onTap: (){},
                    );
                  }

              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}




