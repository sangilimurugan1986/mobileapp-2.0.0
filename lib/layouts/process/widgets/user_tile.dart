import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controllers/auth_controller.dart';
import '../../../controllers/session_controller.dart';
import '../controller/processlayout_controller.dart';

class UserTile extends StatelessWidget {
  final sessionController = Get.find<SessionController>();

  final authcontroller = Get.put(AuthController());

  UserTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {}, //appLayoutController.goto('/profile'),
      child: Row(
        children: [
          SizedBox(width: 10),
          Container(
              //margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: authcontroller.userdata['avatar'].toString().length < 15
                  ? CircleAvatar(
                      radius: 25, //radius is 50
                      backgroundImage: AssetImage('assets/images/background/useravaathar.png'),
                      //image url
                    )
                  : CircleAvatar(
                      radius: 25, //radius is 50
                      backgroundImage: NetworkImage(
                          // NetworkImage(authcontroller.userdata['avathar']),
                          authcontroller.userdata['avatar'].toString()), //image url
                    )),
          // ...
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // name
              Obx(() => Text(
                    sessionController.Userdata.value.firstName +
                        ' ' +
                        sessionController.Userdata.value.lastName,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              // ...
              const SizedBox(height: 2),
              // email
              Text(
                sessionController.Userdata.value.email,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                ),
              ), // ...
              const SizedBox(height: 2),
              // email
              Text(
                sessionController.Userdata.value.role.replaceAll("_", " "),
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                ),
              ),
              // ...
            ],
          )
        ],
      ),
    );
  }
}
