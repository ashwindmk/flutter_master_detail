import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:masterdetail/detail_screen.dart';

import 'spacecraft.dart';

class MasterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: const Text('Master Screen')),
        body: new Center(
            child: new FutureBuilder<List<Spacecraft>>(
                future: downloadJson(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Spacecraft> spacecrafts = snapshot.data;
                    return new CustomListView(spacecrafts: spacecrafts);
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  } else {
                    return new CircularProgressIndicator();
                  }
                }
            )
        )
    );
  }
}

class CustomListView extends StatelessWidget {
  final List<Spacecraft> spacecrafts;

  CustomListView({this.spacecrafts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: spacecrafts.length,
        itemBuilder: (context, int index) {
          return buildListItem(context, spacecrafts[index]);
        }
    );
  }

  Widget buildListItem(BuildContext context, Spacecraft spacecraft) {
    return new ListTile(
        title: new Card(
            elevation: 5.0,
            child: new Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.blueGrey)),
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.all(20.0),
                child: Column(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: spacecraft.getImage()
                      ),
                      Row(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.all(1.0),
                                child: Text(spacecraft.name, style: new TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.right)
                            ),
                            Text(" | "),
                            Padding(
                                padding: EdgeInsets.all(1.0),
                                child: Text(spacecraft.propellant, style: new TextStyle(fontStyle: FontStyle.italic), textAlign: TextAlign.right)
                            )
                          ]
                      )
                    ]
                )
            )
        ),

        onTap: () {
          var route = new MaterialPageRoute(
              builder: (BuildContext buildContext) => new DetailScreen(spacecraft: spacecraft)
          );

          Navigator.of(context).push(route);
        }
    );
  }
}

Future<List<Spacecraft>> downloadJson() async {
  final url = "https://gist.githubusercontent.com/ashwindmk/2ad0336afd7c7ba9e4bdb2e9e672d8ff/raw/spacecrafts.json";

  final http.Response response = await http.get(url);
  if (response.statusCode == 200) {
    List spacecrafts = json.decode(response.body);
    return spacecrafts
        .map((spacecraft) => new Spacecraft.fromJson(spacecraft))
        .toList();
  } else {
    throw Exception("Error downloading JSON data");
  }
}
