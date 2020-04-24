import 'package:flutter/material.dart';
import 'package:masterdetail/spacecraft.dart';

class DetailScreen extends StatefulWidget {
  final Spacecraft spacecraft;

  DetailScreen({Key key, @required this.spacecraft}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    print("Spacecraft: ${widget.spacecraft.toString()}");
    return buildDetails();
  }

  Widget buildDetails() {
    return Scaffold(
        //appBar: new AppBar(title: new Text("Detail Screen")),
        body: Center(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                title: Text(widget.spacecraft.name),
                backgroundColor: Colors.black,
                expandedHeight: 200.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: widget.spacecraft.getImage()
                )
              ),

              SliverList(

                delegate: SliverChildListDelegate(<Widget>[
                  Card(
                    elevation: 5.0,
                    margin: EdgeInsets.all(16.0),
                    child: Column(
                        children: <Widget>[
                          ListTile(
                              title: Text(widget.spacecraft.name.toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold)),
                              subtitle: Text(widget.spacecraft.propellant)
                          ),

                          Padding(
                            padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
                            child: Text("Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, it has survived not only five centuries, but also electronic typesetting, remaining essentially unchanged."),
                          )
                        ]
                    )
                  ),

                  Card(
                      elevation: 5.0,
                      margin: EdgeInsets.all(16.0),
                      child: Column(
                          children: <Widget>[
                            ListTile(
                                title: Text('SPECIFICATIONS', style: TextStyle(fontWeight: FontWeight.bold))
                            ),

                            Padding(
                              padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
                              child: Text("Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, it has survived not only five centuries, but also electronic typesetting, remaining essentially unchanged."),
                            )
                          ]
                      )
                  ),

                  Card(
                      elevation: 5.0,
                      margin: EdgeInsets.all(16.0),
                      child: Column(
                          children: <Widget>[
                            ListTile(
                                title: Text('TIMELINE', style: TextStyle(fontWeight: FontWeight.bold))
                            ),

                            Padding(
                              padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
                              child: Text("Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, it has survived not only five centuries, but also electronic typesetting, remaining essentially unchanged."),
                            )
                          ]
                      )
                  ),

                  Card(
                      elevation: 5.0,
                      margin: EdgeInsets.all(16.0),
                      child: Column(
                          children: <Widget>[
                            ListTile(
                                title: Text('ADDITIONAL INFO', style: TextStyle(fontWeight: FontWeight.bold))
                            ),

                            Padding(
                              padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
                              child: Text("Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, it has survived not only five centuries, but also electronic typesetting, remaining essentially unchanged."),
                            )
                          ]
                      )
                  ),

                  Card(
                      elevation: 5.0,
                      margin: EdgeInsets.all(16.0),
                      child: Column(
                          children: <Widget>[
                            ListTile(
                                title: Text('CONTACTS', style: TextStyle(fontWeight: FontWeight.bold))
                            ),

                            ListTile(
                              leading: new Icon(Icons.contact_phone, color: Colors.blue, size: 22.0),
                              title: Text('Some Space Agency'),
                              subtitle: Text("Location, Country")
                            ),

                            Divider(color: Colors.blue, indent: 16.0),

                            ListTile(
                                leading: new Icon(Icons.phone, color: Colors.blue, size: 22.0),
                                title: Text('(+84) 123 456 789')
                            ),

                            ListTile(
                                leading: new Icon(Icons.contact_mail, color: Colors.blue, size: 22.0),
                                title: Text('thespaceagency@email.com')
                            ),
                          ]
                      )
                  )
                ])
              )
            ]
          )
        )
    );
  }
}
