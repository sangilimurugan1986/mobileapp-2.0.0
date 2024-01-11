import 'package:ez/layouts/auth/widgets/logo.dart';
import 'package:ez/layouts/auth/widgets/safe_container.dart';
import 'package:ez/layouts/auth/widgets/textmain.dart';

import 'package:ez/layouts/auth/widgets/textsub.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/session_controller.dart';
import '../../features/workflow/view/onBoardScreen.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({
    Key? key,
    required this.title,
    required this.sLargeText,
    required this.sSubtext,
    this.children = const <Widget>[],
  }) : super(key: key);

  final String title;
  final String sLargeText;
  final String sSubtext;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final sessionController = Get.find<SessionController>();
    sessionController.getSession();

    return Scaffold(
      body: Container(
        width: mediaQuery.size.width,
        height: mediaQuery.size.height,
        decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/images/background/back.jpeg"), fit: BoxFit.fill)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Row(children: [
                  Expanded(
                    flex: 5,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 3,
                    child: const Logo(),
                  )
                ]),
                const SizedBox(height: 75),
                //large Text
                Textmain(sLabel: sLargeText),
                Textsub(sLabel: sSubtext),
                ...children,
                // ...
              ],
            ),
          ),
        ),
      ),
    );
  }
}
