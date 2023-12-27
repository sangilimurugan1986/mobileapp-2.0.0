import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../controllers/forgot_controller.dart';

import '../layouts/auth/auth_layout.dart';
import '../layouts/auth/widgets/textsub.dart';
import '../utils/helper/safe_area.dart';
import '../widgets/CheckBoxRemember.dart';
import '../widgets/DrawDottedhorizontalline.dart';

import '../widgets/button.dart';
import '../widgets/buttonimg.dart';
import '../widgets/text_input.dart';
import '../widgets/text_input_password.dart';
import '../widgets/textbold.dart';
import '../widgets/textclick.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);

  final email = ''.obs;
  final hasEmailError = false.obs;
  final controller = Get.put(ForgotController());
  TextEditingController userInput = TextEditingController();
  // onEmailChanged
  void onEmailChanged(String value) {
    email.value = value;
  }

  double safeAreaHeight = 0;
  double safeAreaWidth = 0;

  @override
  Widget build(BuildContext context) {
    final safeArea = calcSafeArea();
    safeAreaHeight = safeArea['height']!;
    safeAreaWidth = safeArea['width']!;

    debugPrint(
        safeAreaHeight.toString() + 'h  login b' + safeAreaWidth.toString());
    return AuthLayout(
        // title
        title: 'Forgot',
        sLargeText: 'Oh, no !\nI forgot',
        sSubtext:
            'Enter your email and we\'ll send you a link to\nchange a new password',
        // ...
        children: [
          const SizedBox(height: 40),
          TextInputs(
              title: "Email".tr,
              type: TextInputType.emailAddress,
              onChange: controller.onEmailChanged,
              placeholder: "Email"),
          //Size Space
          const SizedBox(height: 10),
          //Password

          //Size Space
          const SizedBox(height: 5),

          const SizedBox(height: 10),
          Obx(
            () => Button(
              isFullWidth: true,
              label: 'Forgot Password',
              isLoading: controller.isLoading.value,
              onPressed: controller.login,
            ),
          ),
          const SizedBox(height: 20),

          const SizedBox(height: 20),
          /*
          Row(
            children: <Widget>[
              Expanded(
                flex: 3, // 20%
                child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: ButtonImg(
                        sAssetImgPath: 'assets/images/files/google.png',
                        sUrlLink: 'google')),
              ),
              Expanded(
                flex: 3, // 20%
                child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: ButtonImg(
                        sAssetImgPath: 'assets/images/files/microsoft.png',
                        sUrlLink: 'microsoft')),
              ),
              Expanded(
                flex: 3, // 20%
                child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: ButtonImg(
                        sAssetImgPath: 'assets/images/files/facebook.png',
                        sUrlLink: 'facebook')),
              ),
            ],
          ),*/
          // const SizedBox(height: 193),
          // safeAreaHeight > 400 ? SizedBox(height: 100) : SizedBox(height: 1),

          safeAreaHeight == 716.0
              ? SizedBox(height: 178)
              : safeAreaHeight > 400
                  ? SizedBox(height: 288)
                  : SizedBox(height: 1),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
/*            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,*/
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Textsub(sLabel: 'Don\'t have an account?'),
                  new GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "signup");
                    },
                    child: Textbold(sLabel: 'Sign Up'),
                  )
                ],
              )
            ],
          ),
        ]);
  }
}
