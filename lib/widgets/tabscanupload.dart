import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/theme.dart';

class TabScanUpload extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: 20,
        color: Colors.white70,
        child: ListView(children: <Widget>[
          Padding(
              padding: EdgeInsets.all(10),
              child: Card(
                color: Colors.white,
                margin: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: new ListTile(
                    title: new Column(children: [
                  Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text('Uploading'),
                          ),
                          Expanded(
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(Icons.arrow_drop_up))),
                        ],
                      )),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                        margin: EdgeInsets.all(10),
                        child: Text('No Filed Found')),
                  ),
                ])),
              )),
          Padding(
              padding: EdgeInsets.all(10),
              child: Card(
                color: Colors.white,
                margin: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: new ListTile(
                    title: new Column(children: [
                  Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text('Uploaded'),
                          ),
                          Expanded(
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(Icons.arrow_drop_up))),
                        ],
                      )),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                        margin: EdgeInsets.all(10),
                        child: Text('No Filed Found')),
                  ),
                ])),
              ))
        ]));
  }
}
