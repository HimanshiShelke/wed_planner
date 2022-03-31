
import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:pucon/function.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:wed_planner/drawer/components.dart';
import 'package:wed_planner/vendor/venues/vinsert.dart';


Future<List<Data>> fetchData() async {
  String url='http://10.0.2.2:5000/getvenue';
  final response =
  await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    List jsonResponse = jsonDecode(response.body);
    print ("Connection Successful");
    return jsonResponse.map((data) => new Data.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

class Data {
  Data ({
    required this.venue_id,
    required this.venuename,
    required this.venuetype,
    required this.venueaddress,
    required this.venuecontact,
  });

  String venuename;
  int venue_id;
  String venuetype;
  String venueaddress;
  String venuecontact;
  //String venuecost;
  //String venueimage;



  factory Data.fromJson(Map<String, dynamic> json) => Data(
    venue_id : json["venue_id"],
    venuename : json["venuename"],
    venuetype : json["venuetype"],
    venueaddress : json["venueaddress"],
    venuecontact :json["venuecontact"],
    //venuecost: json["venuecost"],
    //venueimage :json["venueimage"],



  );

  Map<String, dynamic> toJson() => {

    "venue_id" : venue_id,
    "venuename" : venuename,
    "venuetype" : venuetype,
    "venueaddress" : venueaddress,
    "venuecontact" : venuecontact,
    //"venuecost" : venuecost,
    //"venueimage": venueimage,



  };
}


Future deletePost(String url,int vid) async {
  var headers = {'Content-Type': 'application/json'};

  return http
      .post(Uri.parse(url), body: json.encode(vid), headers: headers)
      .then((http.Response response) {
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    var body = response.body;
    return Post.fromJson(json.decode(body));
  });
}




class DisVenue extends StatefulWidget {
  const DisVenue({Key? key}) : super(key: key);

  @override
  _DisVenueState createState() => _DisVenueState();
}

class _DisVenueState extends State<DisVenue> {
  late Future<List<Data>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('venue'),
      ),
      body: Center(
        child: FutureBuilder<List<Data>>(
          future: futureData,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<Data> data = snapshot.data;
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(data[index].venuename),
                      subtitle: Row(
                        children: [
                          Column(
                            children: [
                              /*Text(data[index].venueaddress),*/
                              Text(data[index].venuetype),
                              Text(data[index].venue_id.toString()),
                            ],
                          ),
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

