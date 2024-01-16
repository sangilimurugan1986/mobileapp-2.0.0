import 'package:flutter/material.dart';

class TabLayoutHome extends StatelessWidget {
  //List<Tab>? tabvalues;

  final List<Tab> tabvalues = <Tab>[
    Tab(text: ' 1'),
    Tab(text: ' 2'),
    Tab(text: ' 3'),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'msc',
      home: new DefaultTabController(
        length: 2,
        child: new Scaffold(
          appBar: new PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: new Container(
              color: Colors.green,
              child: new SafeArea(
                child: Column(
                  children: <Widget>[
                    new Expanded(child: new Container()),
                    new TabBar(
                      tabs: [new Text("Lunches"), new Text("Cart")],
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: new TabBarView(
            children: <Widget>[
              new Column(
                children: <Widget>[new Text("Lunches Page")],
              ),
              new Column(
                children: <Widget>[new Text("Cart Page")],
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
