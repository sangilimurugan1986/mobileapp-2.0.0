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
import '../controllers/session_controller.dart';
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
import '../widgets/textboldblue.dart';
import '../widgets/textclick.dart';
import 'package:encrypt/encrypt.dart' as enc;
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final email = ''.obs;
  final password = ''.obs;
  final hasEmailError = false.obs;
  final controller = Get.put(LoginController());
  TextEditingController userInput = TextEditingController();
  final sessionController = Get.find<SessionController>();

  // onEmailChanged
  void onEmailChanged(String value) {
    email.value = value;
  }

  void onPasswordChanged(String value) {
    password.value = value;
  }

  double safeAreaHeight = 0;
  double safeAreaWidth = 0;
  //final sessionController = Get.find<SessionController>();

  bool _isLoggedIn = false;
  List<String> scopes = <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ];
  GoogleSignInAccount? _userObj;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    sessionController.getSession();

    if (sessionController.userid != '' &&
        sessionController.token != '' &&
        sessionController.iv != '' &&
        sessionController.key != '') {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => OnBoardScreen()));
    }
    return AuthLayout(
        // title
        title: 'Login',
        sLargeText: 'Hi!\nWelcome',
        sSubtext: 'Sign in to Your Account',

        // ...
        children: [
          const SizedBox(height: 35),
          Obx(() => Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
                Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      //border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400, //New
                          blurRadius: 20.0,
                        )
                      ],
                    ),
                    //color: Colors.yellow,
                    child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
                      const SizedBox(height: 10),
                      TextInputs(
                          backgroundColor: const Color(0x00EEEEEE),
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

                      const SizedBox(height: 25),
                      Button(
                        onPressed: () async {
                          final loginRequest = LoginRequest(
                              email: email.value,
                              password: password.value,
                              loggedFrom: "MOBILE",
                              portalId: 0);

                          bool isValidLogin = await loginRequest.usernamefieldsValidation();

                          if (!isValidLogin) {
                            controller.hasEmailError.value = true;
                            return Snack.errorSnack(context, Strings.alert_error_invalidUser);
                          }
                          bool isValidPass = await loginRequest.passwordfieldsValidation();

                          if (!isValidPass) {
                            controller.hasPasswordError.value = true;
                            return Snack.errorSnack(context, Strings.alert_error_invalidPasswor);
                          } else {
                            final requestbody = {
                              "email": loginRequest.email,
                              "password": loginRequest.password,
                              "loggedFrom": loginRequest.loggedFrom,
                              "portalId": loginRequest.portalId
                            };

                            final viewmodel = Provider.of<LoginViewModel>(context, listen: false);
                            await viewmodel.validateCredentials(requestbody, 'web');
                            if (viewmodel.loading) {
                              CircularProgressIndicator();
                            } else {
                              if (AaaEncryption.sToken.toString().length > 10) {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) => OnBoardScreen()));
                              } else {
                                Snack.errorSnack(
                                    context, Strings.alert_error_invalidUserorPassword);
                              }
                            }
                          }
                        },
                        label: 'Sign In',
                        isFullWidth: true,
                      ),
                    ])),
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
                          sAssetImgPath: 'assets/images/files/google.png',
                          sUrlLink: 'google',
                          onTap: () => {googlelogin(context)},
                        )),
                    Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 2, 0),
                        child: ButtonImg(
                            sAssetImgPath: 'assets/images/files/microsoft.png',
                            sUrlLink: 'microsoft',
                            onTap: () => {googlelogin(context)})),
                    Spacer()
                  ],
                )),
                const SizedBox(height: 40),
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
                              child: TextboldBlue(sLabel: 'Sign Up'),
                            )
                          ],
                        ))
                  ],
                ),
              ]))
        ]);
  }

  googlelogin(BuildContext ctx) {
    _googleSignIn.signIn().then((userdetail) {
      socialLogin(userdetail!.email.toString(), ctx);
    }).catchError((e) {
      print(e);
    });
  }

  // socialLogin(String email, BuildContext ctx) {
  Future socialLogin(String email, BuildContext ctx) async {
    final loginRequest = LoginRequest(email: email, loggedFrom: "MOBILE", portalId: 0);
    bool isValidLogin = await loginRequest.usernamefieldsValidation();

    if (!isValidLogin) {
      controller.hasEmailError.value = true;
      return Snack.errorSnack(ctx, Strings.alert_error_invalidUser);
    } else {
      final requestbody = {
        "email": loginRequest.email,
        "loggedFrom": loginRequest.loggedFrom,
        "portalId": loginRequest.portalId,
        "tenantId": 0
      };

      final viewmodel = Provider.of<LoginViewModel>(ctx, listen: false);
      await viewmodel.validateCredentials(requestbody, 'google');
      if (viewmodel.loading) {
        CircularProgressIndicator();
      } else {
        if (AaaEncryption.sToken.toString().length > 10) {
          Navigator.of(ctx).push(MaterialPageRoute(builder: (ctx) => OnBoardScreen()));
        } else {
          Snack.errorSnack(ctx, Strings.alert_error_invalidUserorPassword);
        }
      }
    }
  }
}
