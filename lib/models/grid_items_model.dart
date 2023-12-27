import 'package:flutter/material.dart';

import '../widgets/ConnectItem.dart';

class GridItemsModel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container();
  }

  Widget gridtail() {
    return ConnectSingleItem(
        label: 'Finance',
        discriptions: 'Team Colobration for account payable and receivable ',
        color: Colors.blue);
  }
}
