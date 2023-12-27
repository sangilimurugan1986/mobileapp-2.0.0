import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomUpTable extends StatefulWidget {
  BottomUpTableState createState() => BottomUpTableState();
}

class BottomUpTableState extends State<BottomUpTable> {
  @override
  void initState() {
    super.initState();
  }

  showpopupDlg() {
    Future(() {
      showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () => Navigator.of(context).pop(), // Closing the sheet.
            child: Container(height: 100, color: Colors.grey),
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
