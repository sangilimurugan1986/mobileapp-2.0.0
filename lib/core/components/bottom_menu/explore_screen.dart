import 'package:flutter/material.dart';

import '../../CustomAppBar.dart';

class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // viewModel.init();
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          AppBarAction(icon: Icon(Icons.search), onPressed: () => {}),
          AppBarAction(icon: Icon(Icons.person_sharp), onPressed: () => {})
        ],
        title: "Reels",
      ),
      body: Center(
        child: Text('Reels'),
      ),
    );
  }
}
