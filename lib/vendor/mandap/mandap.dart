import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


Future<List<MData>> fetchMandapData() async {
  String url='http://10.0.2.2:5000/getmandap';
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
    required this.mandapname,
    required this.mandapdetails,
    required this.mandapcost,
    //required this.mandapcontact,
    //required this.mandapimage,
  });

  String mandapname;
  String mandapdetails;
  // int mandapcontact;
  double mandapcost;
  //int mandapimage;



  factory MData.fromJson(Map<String, dynamic> json) => MData(
    //Mandap_id : json["Mandap_id"],
    mandapname : json["mandapname"],
    mandapdetails: json["mandapdetails"],
    //mandapaddress : json["mandapaddress"],
    //mandapcontact :json["mandapcontact"],
    mandapcost: json["mandapcost"],
    //mandapimage :json["mandapimage"],



  );

  Map<String, dynamic> toJson() => {

    //"Mandap_id" : Mandap_id,
    "mandapname" : mandapname,
    "mandapdetails" : mandapdetails,
    //"mandapaddress" : mandapaddress,
    //"mandapcontact" : mandapcontact.toString(),
    "mandapcost" : mandapcost,
    //"mandapimage": mandapimage.toString(),



  };
}


class Mandap extends StatefulWidget {
  const Mandap({Key? key}) : super(key: key);

  @override
  _MandapState createState() => _MandapState();
}

class _MandapState extends State<Mandap> {
  late Future<List<MData>> futureMData;

  @override
  void initState() {
    super.initState();
    futureMData = fetchMandapData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mandap'),leading: IconButton(onPressed: (){
        /*Navigator.push(
          context,
          //MaterialPageRoute(builder: (context) =>InsertData()),);*/
      }, icon: Icon(Icons.add)),
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
                      title: Text(data[index].mandapname),
                      subtitle: Column(
                        children: [
                          Text(data[index].mandapcost.toString()),
                          Text(data[index].mandapdetails),
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




