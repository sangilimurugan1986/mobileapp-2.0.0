import 'dart:async';
import 'dart:math';

import 'package:ez/core/CustomColors.dart';
import 'package:ez/core/snackbar/snack_bar.dart';
import 'package:ez/core/utils/extension+Strings.dart';
import 'package:ez/core/utils/strings.dart';
import 'package:ez/layouts/auth/widgets/logo.dart';
import 'package:ez/widgets/button.dart';
import 'package:ez/widgets/buttonimg.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class CustomLogin extends StatefulWidget {
  CustomLogin(
      {Key? key,
      required this.loginType,
      required this.signInAction,
      required this.signUpAction,
      required this.googleAction,
      required this.microsoftAction,
      required this.forgotPassword,
      this.onemailChanged,
      this.onPwdChanged})
      : super(key: key);
  int loginType;
  final Function(String, String) signInAction;
  final Function signUpAction;
  final Function googleAction;
  final Function microsoftAction;
  final Function forgotPassword;
  final Function(String)? onemailChanged;
  final Function(String)? onPwdChanged;

  late List<Widget> arrayOfWidgets;
  late double screenWidth;
  late double screenHeight;
  late double cardHeightDivision = 5.0;

  // :- loginType can be classified into 3 sets,
  // :-1 --> Email with Password
  // :-2 --> Email with OTP
  // :-3 --> Mobile with OTP

  @override
  State<CustomLogin> createState() => _CustomLoginState();
}

class _CustomLoginState extends State<CustomLogin> {
  final _biggerFont =
      const TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold);
  late bool _passwordVisible = false;
  bool rememberMe = false;
  bool timerFinsihed = false;
  var _isVisible = false;
  var otpSugession = Strings.txt_label_otpsugession;

  //Time related variables
  final _maxSeconds = 5 * 60;
  int _currentSecond = 0;
  Timer _timer = Timer(Duration(seconds: 1), () {});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  OtpFieldController otpController = OtpFieldController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.screenWidth = MediaQuery.of(context).size.width;
    widget.screenHeight = MediaQuery.of(context).size.height;
    widget.arrayOfWidgets = [
      buildType_Email_password(),
      buildType_Email_pin(),
      buildType_Mobile_pin()
    ];

    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/images/background/back.jpeg"), // <-- BACKGROUND IMAGE
            fit: BoxFit.cover,
          ),
        ),
      ),
      Scaffold(
        backgroundColor: CustomColors.transparent,
        body: Column(
          children: [
            Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 60, right: 20),
                child: Row(
                  children: [
                    Spacer(),
                    const Logo(),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                        child: Text("Hi!", style: _biggerFont),
                        alignment: Alignment.centerLeft),
                    Text("Welcome", style: _biggerFont),
                    Text(
                      "Sign in to your Account",
                      style: TextStyle(color: CustomColors.black),
                    ),
                  ],
                ),
              ),
            ]),
            widget.arrayOfWidgets[widget.loginType],
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text("Or via social media",
                      style: TextStyle(color: CustomColors.paleblue)),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Spacer(),
                      GestureDetector(
                        onTap: () => widget.googleAction,
                        child: Container(
                            margin: EdgeInsets.fromLTRB(2, 0, 5, 0),
                            child: ButtonImg(
                              sAssetImgPath: 'assets/images/files/google.png',
                              sUrlLink: 'google',
                            )),
                      ),
                      GestureDetector(
                        onTap: () => widget.microsoftAction,
                        child: Container(
                            margin: EdgeInsets.fromLTRB(5, 0, 2, 0),
                            child: ButtonImg(
                                sAssetImgPath:
                                    'assets/images/files/microsoft.png',
                                sUrlLink: 'microsoft')),
                      ),
                      Spacer(),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            (widget.loginType == 0)
                ? Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Spacer(),
                        Text(Strings.txt_lable_noAccount),
                        TextButton(
                            onPressed: () {
                              widget.signUpAction();
                            },
                            child: Text(Strings.txt_lable_signup)),
                        Spacer()
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    ]);
  }

  Card buildType_Email_password() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 20,
      shadowColor: CustomColors.black,
      color: CustomColors.grey,
      child: Container(
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                CustomColors.white,
                CustomColors.white,
              ],
            ),
            borderRadius: BorderRadius.circular(15.0)),
        child: SizedBox(
          width: widget.screenWidth / 1.1,
          height: widget.screenHeight / 2.5,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Spacer(),
                TextField(
                  controller: emailController,
                  onChanged: (value) => widget.onemailChanged!(value),
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: CustomColors.grey,
                  decoration: InputDecoration(
                      hintText: Strings.txt_lable_email,
                      contentPadding: EdgeInsets.all(10),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: CustomColors.grey, width: 1.5),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: CustomColors.grey, width: 1.5),
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: CustomColors.grey, width: 1.5),
                        borderRadius: BorderRadius.circular(7),
                      )),
                ),
                SizedBox(height: 20),

                TextField(
                    controller: passwordController,
                    onChanged: (value) {
                      widget.onPwdChanged!(value);
                    },
                    keyboardType: TextInputType.text,
                    cursorColor: CustomColors.grey,
                    obscureText: !_passwordVisible,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: CustomColors.grey, width: 1.5),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: CustomColors.grey, width: 1.5),
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: CustomColors.grey, width: 1.5),
                          borderRadius: BorderRadius.circular(7)),
                      hintText: Strings.txt_lable_password,
                      contentPadding: EdgeInsets.all(10),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                        child: Icon(_passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    )),
                //SizedBox

                Row(
                  children: [
                    Checkbox(
                      side: BorderSide(color: CustomColors.black),
                      value: rememberMe,
                      onChanged: (value) {
                        setState(() {
                          rememberMe = !rememberMe;
                        });
                      },
                    ),
                    Expanded(
                      child: Text(Strings.txt_lable_rememberMe,
                          style: TextStyle(color: CustomColors.black)),
                    ),
                    Expanded(
                      child: TextButton(
                          onPressed: () {
                            widget.forgotPassword();
                          },
                          child: Text(Strings.txt_lable_forgotpassword,
                              style: TextStyle(color: CustomColors.black))),
                    )
                  ],
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Button(
                    onPressed: () {
                      widget.signInAction(
                          emailController.text, passwordController.text);
                    },
                    label: Strings.txt_lable_signin,
                    isFullWidth: true,
                    isRounded: false,
                  ),
                ),
              ],
            ), //Column
          ), //Padding
        ),
      ), //SizedBox
    );
  }

  Card buildType_Email_pin() {
    String otpController = "";

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 20,
      shadowColor: CustomColors.black,
      color: CustomColors.grey,
      child: Container(
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                CustomColors.white,
                CustomColors.white,
              ],
            ),
            borderRadius: BorderRadius.circular(15.0)),
        child: SizedBox(
          width: widget.screenWidth / 1.1,
          height: widget.screenHeight / widget.cardHeightDivision,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Spacer(),
                TextField(
                  controller: emailController,
                  onChanged: (value) => widget.onemailChanged!(value),
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: CustomColors.grey,
                  decoration: InputDecoration(
                      hintText: Strings.txt_lable_email,
                      contentPadding: EdgeInsets.all(10),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: CustomColors.grey, width: 1.5),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: CustomColors.grey, width: 1.5),
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: CustomColors.grey, width: 1.5),
                        borderRadius: BorderRadius.circular(7),
                      )),
                ),
                SizedBox(height: 10),

                OutlinedButton(
                  child: Text(Strings.txt_lable_sendotp),
                  style: OutlinedButton.styleFrom(
                    primary: CustomColors.paleblue,
                    side: BorderSide(
                      color: CustomColors.paleblue,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      if (emailController.text.isEmpty ||
                          !emailController.text.isValidEmail) {
                        Snack.errorSnack(
                            context, Strings.alert_error_invalidEmail);
                      } else {
                        Snack.successSnack(
                            context, Strings.txt_label_success_email_otpsent);
                        _isVisible = true;
                        widget.cardHeightDivision = 2.3;
                        _timer.cancel();
                        _startTimer();
                      }
                    });
                  },
                ),

                //SizedBox

                Spacer(),
                Visibility(
                  visible: _isVisible,
                  child: Wrap(
                    children: [
                      Align(
                        child: Text(
                          Strings.txt_lable_otp_proceed,
                          style: TextStyle(fontSize: 10.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OTPTextField(
                          keyboardType: TextInputType.number,
                          length: 6,
                          width: MediaQuery.of(context).size.width,
                          fieldWidth:
                              (MediaQuery.of(context).size.width / 6) - 30,
                          style: TextStyle(fontSize: 12),
                          textFieldAlignment: MainAxisAlignment.spaceAround,
                          fieldStyle: FieldStyle.underline,
                          onCompleted: (pin) {
                            otpController = pin;
                          },
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Button(
                          onPressed: () {
                            widget.signInAction(
                                emailController.text, otpController);
                          },
                          label: Strings.txt_lable_signin,
                          isFullWidth: true,
                          isRounded: false,
                        ),
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Text(_timerText == "00 : 00" ? "" : _timerText),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(otpSugession),
                              TextButton(
                                onPressed: () {
                                  _timer.cancel();
                                  _startTimer();
                                  setState(() {
                                    otpSugession =
                                        Strings.txt_label_otpsugession;
                                  });
                                },
                                child: Text(Strings.txt_lable_resend),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ), //Column
          ), //Padding
        ),
      ), //SizedBox
    );
  }

  Card buildType_Mobile_pin() {
    String mobileNumber = "";
    String otpController = "";

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 20,
      shadowColor: CustomColors.black,
      color: CustomColors.grey,
      child: Container(
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                CustomColors.white,
                CustomColors.white,
              ],
            ),
            borderRadius: BorderRadius.circular(15.0)),
        child: SizedBox(
          width: widget.screenWidth / 1.1,
          height: widget.screenHeight / widget.cardHeightDivision,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Spacer(),
                IntlPhoneField(
                  decoration: InputDecoration(
                    labelText: Strings.txt_lable_mobile,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: CustomColors.grey, width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: CustomColors.grey, width: 1.5),
                    ),
                  ),
                  initialCountryCode: 'IN',
                  onChanged: (phone) {
                    mobileNumber = phone.completeNumber;
                  },
                ),
                SizedBox(height: 0),

                OutlinedButton(
                  child: Text(Strings.txt_lable_sendotp),
                  style: OutlinedButton.styleFrom(
                    primary: CustomColors.paleblue,
                    side: BorderSide(
                      color: CustomColors.paleblue,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      if (mobileNumber.isEmpty ||
                          !mobileNumber.isValidPhoneNumber) {
                        Snack.errorSnack(
                            context, Strings.alert_error_invalidMobile);
                      } else {
                        Snack.successSnack(
                            context, Strings.txt_label_success_mobile_otpsent);
                        _isVisible = true;
                        widget.cardHeightDivision = 2.3;
                        _timer.cancel();
                        _startTimer();
                      }
                    });
                  },
                ),

                //SizedBox

                Spacer(),
                Visibility(
                  visible: _isVisible,
                  child: Wrap(
                    children: [
                      Align(
                        child: Text(
                          Strings.txt_lable_otp_proceed,
                          style: TextStyle(fontSize: 10.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OTPTextField(
                          keyboardType: TextInputType.number,
                          length: 6,
                          width: MediaQuery.of(context).size.width,
                          fieldWidth:
                              (MediaQuery.of(context).size.width / 6) - 30,
                          style: TextStyle(fontSize: 12),
                          textFieldAlignment: MainAxisAlignment.spaceAround,
                          fieldStyle: FieldStyle.underline,
                          onCompleted: (pin) {
                            otpController = pin;
                          },
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Button(
                          onPressed: () {
                            widget.signInAction(mobileNumber, otpController);
                          },
                          label: Strings.txt_lable_signin,
                          isFullWidth: true,
                          isRounded: false,
                        ),
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Text(_timerText == "00 : 00" ? "" : _timerText),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(otpSugession),
                              TextButton(
                                onPressed: () {
                                  _timer.cancel();
                                  _startTimer();
                                  setState(() {
                                    otpSugession =
                                        Strings.txt_label_otpsugession;
                                  });
                                },
                                child: Text(Strings.txt_lable_resend),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ), //Column
          ), //Padding
        ),
      ), //SizedBox
    );
  }

  void _startTimer() {
    final duration = Duration(seconds: 1);
    _timer = Timer.periodic(duration, (Timer timer) {
      setState(() {
        _currentSecond = timer.tick;
        if (timer.tick >= _maxSeconds) {
          timer.cancel();
          setState(() {
            otpSugession = Strings.txt_label_otpexpired;
          });
        }
      });
    });
  }

  String get _timerText {
    final secondsPerMinute = 60;
    final secondsLeft = _maxSeconds - _currentSecond;

    var formattedMinutesLeft =
        (secondsLeft ~/ secondsPerMinute).toString().padLeft(2, '0');
    var formattedSecondsLeft =
        (secondsLeft % secondsPerMinute).toString().padLeft(2, '0');

    return '$formattedMinutesLeft : $formattedSecondsLeft';
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    _timer.cancel();
    super.dispose();
  }
}
