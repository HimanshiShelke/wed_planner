import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


Future<List<DeData>> fetchDecorData() async {
  String url='http://10.0.2.2:5000/getdecor';
  final response =
  await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    List jsonResponse = jsonDecode(response.body);
    print ("Connection Successful");
    return jsonResponse.map((data) => new DeData.fromJson(data)).toList();
    //return jsonResponse.map((data) => new Data.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

class DeData {
  DeData ({
    required this.decorname,
    required this.decordetails,
    required this.decorcost,
    //required this.decorcontact,
    //required this.decorimage,
  });

  String decorname;
  String decordetails;
  // int decorcontact;
  double decorcost;
  //int decorimage;



  factory DeData.fromJson(Map<String, dynamic> json) => DeData(
    //decor_id : json["decor_id"],
    decorname : json["decorname"],
    decordetails: json["decordetails"],
    //decoraddress : json["decoraddress"],
    //decorcontact :json["decorcontact"],
    decorcost: json["decorcost"],
    //decorimage :json["decorimage"],



  );

  Map<String, dynamic> toJson() => {

    //"decor_id" : decor_id,
    "decorname" : decorname,
    "decordetails" : decordetails,
    //"decoraddress" : decoraddress,
    //"decorcontact" : decorcontact.toString(),
    "decorcost" : decorcost,
    //"decorimage": decorimage.toString(),



  };
}


class Decor extends StatefulWidget {
  const Decor({Key? key}) : super(key: key);

  @override
  _DecorState createState() => _DecorState();
}

class _DecorState extends State<Decor> {
  late Future<List<DeData>> futureDeData;

  @override
  void initState() {
    super.initState();
    futureDeData = fetchDecorData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('decor'),/*leading: IconButton(onPressed: (){
        /*Navigator.push(
          context,
          //MaterialPageRoute(builder: (context) =>InsertData()),);*/
      }, icon: Icon(Icons.add)),*/
      ),
      body: Center(
        child: FutureBuilder<List<DeData>>(
          future: futureDeData,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<DeData> data = snapshot.data;
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Icon(Icons.person),
                      title: Text(data[index].decorname),
                      subtitle: Column(
                        children: [
                          Text(data[index].decorcost.toString()),
                          Text(data[index].decordetails),
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




