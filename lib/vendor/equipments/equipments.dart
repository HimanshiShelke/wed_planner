import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


Future<List<EqData>> fetchEquipmentData() async {
  String url='http://10.0.2.2:5000/getequipment';
  final response =
  await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    List jsonResponse = jsonDecode(response.body);
    print ("Connection Successful");
    return jsonResponse.map((data) => new EqData.fromJson(data)).toList();
    //return jsonResponse.map((data) => new Data.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

class EqData {
  EqData ({
    required this.equipmentname,
    required this.equipmentdetails,
    required this.equipmentcost,
    //required this.equipmentcontact,
    //required this.equipmentimage,
  });

  String equipmentname;
  String equipmentdetails;
  // int equipmentcontact;
  double equipmentcost;
  //int equipmentimage;



  factory EqData.fromJson(Map<String, dynamic> json) => EqData(
    //equipment_id : json["equipment_id"],
    equipmentname : json["equipmentname"],
    equipmentdetails: json["equipmentdetails"],
    //equipmentcontact :json["equipmentcontact"],
    equipmentcost: json["equipmentcost"],
    //equipmentimage :json["equipmentimage"],



  );

  Map<String, dynamic> toJson() => {

    //"equipment_id" : equipment_id,
    "equipmentname" : equipmentname,
    "equipmentdetails" : equipmentdetails,
    //"equipmentcontact" : equipmentcontact.toString(),
    "equipmentcost" : equipmentcost,
    //"equipmentimage": equipmentimage.toString(),



  };
}


class Equipment extends StatefulWidget {
  const Equipment({Key? key}) : super(key: key);

  @override
  _EquipmentState createState() => _EquipmentState();
}

class _EquipmentState extends State<Equipment> {
  late Future<List<EqData>> futureEqData;

  @override
  void initState() {
    super.initState();
    futureEqData = fetchEquipmentData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('equipment'),/*leading: IconButton(onPressed: (){
        Navigator.push(
          context,
          //MaterialPageRoute(builder: (context) =>InsertData()),);
      }, icon: Icon(Icons.add)),*/
      ),
      body: Center(
        child: FutureBuilder<List<EqData>>(
          future: futureEqData,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<EqData> data = snapshot.data;
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Icon(Icons.person),
                      title: Text(data[index].equipmentname),
                      subtitle: Column(
                        children: [
                          Text(data[index].equipmentcost.toString()),
                          Text(data[index].equipmentdetails),
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




