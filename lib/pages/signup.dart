import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../controllers/signup_controller.dart';
import '../layouts/auth/auth_layout.dart';
import '../layouts/auth/widgets/textsub.dart';
import '../utils/helper/safe_area.dart';
import '../widgets/DrawDottedhorizontalline.dart';
import '../widgets/button.dart';
import '../widgets/buttonimg.dart';
import '../widgets/text_input.dart';
import '../widgets/text_input_password.dart';
import '../widgets/textbold.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final email = ''.obs;
  final hasEmailError = false.obs;
  final controller = Get.put(SignUpController());
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
        title: 'Login',
        sLargeText: 'Hi!\nWelcome',
        sSubtext: 'Let\'s create an account',

        // ...
        children: [
          const SizedBox(height: 5),
          TextInputs(
              title: "Email".tr,
              type: TextInputType.emailAddress,
              onChange: controller.onEmailChanged,
              placeholder: "Email"),
          //Size Space
          SizedBox(height: 2),
          TextInputs(
              title: "Full Name".tr,
              type: TextInputType.text,
              onChange: controller.onFullNameChanged,
              placeholder: "Full Name"),
          //Size Space
          SizedBox(height: 2),
          //Password
          TextInputsPassword(
              title: "Password".tr,
              type: TextInputType.text,
              onChange: controller.password,
              errortext: 'Must contain a number and least of 6 characters',
              placeholder: "Password"),
          SizedBox(height: 2),
          //Password
          TextInputsPassword(
              title: "Confirm Password".tr,
              type: TextInputType.text,
              onChange: controller.confirmpassword,
              errortext: 'Must contain a number and least of 6 characters',
              placeholder: "Confirm Password"),
          //Size Space
          SizedBox(height: 8),
          Obx(
            () => Button(
              isFullWidth: true,
              label: 'Sign In',
              isLoading: controller.isLoading.value,
              onPressed: controller.login,
            ),
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomPaint(painter: DrawDottedhorizontalline()),
              CustomPaint(painter: DrawDottedhorizontalline()),
              CustomPaint(painter: DrawDottedhorizontalline()),
              Textsub(sLabel: '( OR )'),
              CustomPaint(painter: DrawDottedhorizontalline()),
              CustomPaint(painter: DrawDottedhorizontalline()),
              CustomPaint(painter: DrawDottedhorizontalline()),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: <Widget>[
              Expanded(
                flex: 3, // 20%
                child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
                    child: ButtonImg(
                        sAssetImgPath: 'assets/images/files/google.png',
                        sUrlLink: 'google')),
              ),
              Expanded(
                flex: 3, // 20%
                child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
                    child: ButtonImg(
                        sAssetImgPath: 'assets/images/files/microsoft.png',
                        sUrlLink: 'microsoft')),
              ),
              Expanded(
                flex: 3, // 20%
                child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
                    child: ButtonImg(
                        sAssetImgPath: 'assets/images/files/facebook.png',
                        sUrlLink: 'facebook')),
              ),
            ],
          ),

          // const SizedBox(height: 3),
          // safeAreaHeight > 400 ? SizedBox(height: 100) : SizedBox(height: 1),

          safeAreaHeight == 716.0
              ? SizedBox(height: 6)
              : safeAreaHeight > 400
                  ? SizedBox(height: 100)
                  : SizedBox(height: 1),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Textsub(sLabel: 'Have an account?'),
                  new GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "loginscreen");
                    },
                    child: Textbold(sLabel: 'Log In'),
                  )
                ],
              )
            ],
          ),
        ]);
  }
}
