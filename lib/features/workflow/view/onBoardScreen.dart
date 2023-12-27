import 'package:flutter/material.dart';
import '../../../core/CustomColors.dart';
import '../../../core/components/bottom_menu/bottom_nav_bar.dart';
import '../../../core/components/bottom_menu/offstage_navigator.dart';
import '../../../core/components/bottom_menu/tab_data.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

class OnBoardScreen extends StatefulWidget {
  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  // Generating UniqueKeys for each and every TabItem
  final List<GlobalKey<NavigatorState>> _navigatorKeys =
      OffstageNavigator.getNavigatorKeys(ofTabCount: TabItem.kTabItemCount);

  // _currentIndex to identify at which tab user at
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
          children: List.generate(
        _navigatorKeys.length,
        (index) => OffstageNavigator.buildOffstageNavigator(
            index, _navigatorKeys, _currentIndex),
      )),
      bottomNavigationBar: _getbottomNavigationBar(),
    );
  }

  BottomBar _getbottomNavigationBar() {
    return BottomBar(
        backgroundColor: CustomColors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: CustomColors.sapphireBlue,
        currentIndex: _currentIndex,
        index: (value) {
          setState(() {
            _currentIndex = value ?? 0;
          });
        },
        items: TabItem.generateTabList());
  }
}
