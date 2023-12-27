import 'package:flutter/material.dart';

import '../../CustomAppBar.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          AppBarAction(icon: Icon(Icons.search), onPressed: () => {}),
          AppBarAction(icon: Icon(Icons.person_sharp), onPressed: () => {})
        ],
        title: "Friends",
      ),
      body: Center(
        child: Text('Friends Screen'),
      ),
    );
  }
}
