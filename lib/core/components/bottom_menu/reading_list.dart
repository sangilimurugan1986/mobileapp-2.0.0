import 'package:flutter/material.dart';

import '../../CustomAppBar.dart';

class ReadListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          AppBarAction(icon: Icon(Icons.search), onPressed: () => {}),
          AppBarAction(icon: Icon(Icons.person_sharp), onPressed: () => {})
        ],
        title: "Notifications",
      ),
      body: Center(
        child: Text('Notifications Screen'),
      ),
    );
  }
}
