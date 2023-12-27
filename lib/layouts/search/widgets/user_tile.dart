import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controllers/session_controller.dart';
import '../controller/searchlayout_controller.dart';

class UserTile extends StatelessWidget {
  final sessionController = Get.find<SessionController>();
  final appLayoutController = Get.put(SearchlayoutController());

  UserTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () => appLayoutController.goto('/profile'),
        child: Row(
          children: [
            SizedBox(width: 10),
            // avatar
            CircleAvatar(
              foregroundImage:
                  AssetImage('assets/images/background/useravaathar.png'),
              backgroundImage:
                  NetworkImage(sessionController.Userdata.value.profileUrl),
              radius: 24,
            ),

            // ...
            const SizedBox(width: 16),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // name
                Text(
                  sessionController.Userdata.value.firstName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // ...
                const SizedBox(height: 4),
                // email
                Text(
                  sessionController.Userdata.value.email,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                  ),
                ),
                // ...
              ],
            )
          ],
        ),
      ),
    );
  }
}
