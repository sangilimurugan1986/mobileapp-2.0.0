import 'package:ez/core/CustomColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class AlertDialogScreen extends StatelessWidget {
  String title, body;
  Function(bool val) onTap;
  AlertDialogScreen(
      {required this.title, required this.body, required this.onTap});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return showAlertDialog(context);
  }

  showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(body),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: CustomColors.green),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('No')),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: CustomColors.red),
                  onPressed: () {
                    onTap(true);
                    // Write code to delete item
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Yes',
                  )),
            ],
          );
        });
  }
}
