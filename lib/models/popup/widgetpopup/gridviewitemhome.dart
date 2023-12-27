import 'package:flutter/cupertino.dart';

class GridViewItemHome extends StatefulWidget {
  GridViewItemHomeState createState() => GridViewItemHomeState();
}

class GridViewItemHomeState extends State<GridViewItemHome> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: Column(children: [
      Text('data'),
      Text(
        'data1',
        maxLines: 3,
      )
    ]));
  }
}
