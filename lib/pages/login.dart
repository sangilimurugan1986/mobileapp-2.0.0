import 'package:ez/core/di/injection.dart';
import 'package:ez/core/snackbar/snack_bar.dart';
import 'package:ez/core/utils/strings.dart';
import 'package:ez/features/login/model/login_request.dart';
import 'package:ez/features/login/viewmodel/loginviewmodel.dart';
import 'package:ez/features/workflow/view/workflow.dart';
import 'package:ez/utils/helper/aes_encryption.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import '../controllers/login_controller.dart';
import '../features/workflow/view/onBoardScreen.dart';
import '../layouts/auth/auth_layout.dart';
import '../layouts/auth/widgets/textsub.dart';
import '../utils/helper/safe_area.dart';
import '../widgets/CheckBoxRemember.dart';
import '../widgets/DrawDottedhorizontalline.dart';
import '../widgets/MySeparator.dart';
import '../widgets/button.dart';
import '../widgets/buttonimg.dart';
import '../widgets/text_input.dart';
import '../widgets/text_input_password.dart';
import '../widgets/textbold.dart';
import '../widgets/textclick.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final email = ''.obs;
  final password = ''.obs;
  final hasEmailError = false.obs;
  final controller = Get.put(LoginController());
  TextEditingController userInput = TextEditingController();

  // onEmailChanged
  void onEmailChanged(String value) {
    email.value = value;
  }

  void onPasswordChanged(String value) {
    password.value = value;
  }

  double safeAreaHeight = 0;
  double safeAreaWidth = 0;

  @override
  Widget build(BuildContext context) {
    // final safeArea = calcSafeArea();
    // safeAreaHeight = safeArea['height']!;
    // safeAreaWidth = safeArea['width']!;

    // debugPrint(
    //     safeAreaHeight.toString() + 'h  login b' + safeAreaWidth.toString());

    return AuthLayout(
        // title
        title: 'Login',
        sLargeText: 'Hi!\nWelcome',
        sSubtext: 'Sign in to Your Account',

        // ...
        children: [
          Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
            const SizedBox(height: 35),
            TextInputs(
                backgroundColor: const Color(0xFFEEEEEE),
                borderColor: const Color(0xFFE0E0E0),
                title: "Email".tr,
                type: TextInputType.emailAddress,
                hasError: controller.hasEmailError.value,
                onChange: onEmailChanged,
                placeholder: "Email"),

            //Size Space
            const SizedBox(height: 10),
            //Password
            TextInputsPassword(
                title: "Password".tr,
                type: TextInputType.text,
                hasError: controller.hasPasswordError.value,
                onChange: onPasswordChanged,
                placeholder: "Password"),
            //Size Space
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CheckBoxRemember(),
                new GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "forgotpassword");
                  },
                  child: Textclick(sLabel: 'Forgot Password?'),
                )
              ],
            ),
/*            const SizedBox(height: 25),
            Obx(
              () => Button(
                isFullWidth: true,
                label: 'Sign In',
                isLoading: controller.isLoading.value,
                onPressed: controller.login,
              ),
            ),*/
            const SizedBox(height: 25),
            Button(
              onPressed: () async {
                final loginRequest = LoginRequest(
                    email: email.value,
                    password: password.value,
                    loggedFrom: "MOBILE",
                    portalId: 0);
                bool isValidLogin = await loginRequest.fieldsValidation();

                if (!isValidLogin) {
                  return Snack.errorSnack(context, Strings.alert_error_invalidUser);
                }

                final requestbody = {
                  "email": loginRequest.email,
                  "password": loginRequest.password,
                  "loggedFrom": loginRequest.loggedFrom,
                  "portalId": loginRequest.portalId
                };

                final viewmodel = Provider.of<LoginViewModel>(context, listen: false);
                await viewmodel.validateCredentials(requestbody);
                if (viewmodel.loading) {
                  CircularProgressIndicator();
                } else {
                  debugPrint(viewmodel.data.toString());
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => OnBoardScreen()));
                }
              },
              label: 'Sign In',
              isFullWidth: true,
            ),

            const SizedBox(height: 25),
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
            const SizedBox(height: 25),

            Container(
                // width: 260,
                child: Row(
              children: <Widget>[
                Spacer(),
                Container(
                    margin: EdgeInsets.fromLTRB(2, 0, 5, 0),
                    child: ButtonImg(
                        sAssetImgPath: 'assets/images/files/google.png', sUrlLink: 'google')),
                Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 2, 0),
                    child: ButtonImg(
                        sAssetImgPath: 'assets/images/files/microsoft.png', sUrlLink: 'microsoft')),

                /*           Expanded(
                  flex: 3, // 20%
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
                      child: ButtonImg(
                          sAssetImgPath: 'assets/images/files/facebook.png',
                          sUrlLink: 'facebook')),
                ),*/
                Spacer()
              ],
            )),
            const SizedBox(height: 40),

            // safeAreaHeight == 716.0
            //     ? SizedBox(height: 50)
            //     : safeAreaHeight > 400
            //         ? SizedBox(height: 140)
            //         : SizedBox(height: 1),
            // //safeAreaHeight > 400 ? SizedBox(height: 10) : SizedBox(height: 1),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
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
                    ))
              ],
            ),
          ])
        ]);
  }
}
