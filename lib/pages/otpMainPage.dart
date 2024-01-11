import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../layouts/auth/auth_layout.dart';
import '../widgets/otpInput.dart';

class OtpMianPage extends StatefulWidget {
  const OtpMianPage({Key? key}) : super(key: key);

  @override
  State<OtpMianPage> createState() => _OtpMianPageState();
}

class _OtpMianPageState extends State<OtpMianPage> {
  // 4 text editing controllers that associate with the 4 input fields
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  final TextEditingController _fieldFive = TextEditingController();
  final TextEditingController _fieldSix = TextEditingController();

  // This is the entered code
  // It will be displayed in a Text widget
  String? _otp;
  int secondsRemaining = 10;
  bool enableResend = false;
  late Timer timer;

  @override
  initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop, //_onWillPop(context),
        child: AuthLayout(
            // title
            title: 'OTP',
            sLargeText: 'OTP \nVerfication',
            sSubtext: 'OTP sent to your authorized \n Email/Mobile  ',
            // ...
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const Text('Phone Number Verification'),
                  SizedBox(
                    height: 50,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // Implement 4 input fields
                  Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OtpInput(false, _fieldOne, true), // auto focus
                          OtpInput(false, _fieldTwo, false),
                          OtpInput(false, _fieldThree, false),
                          OtpInput(false, _fieldFour, false),
                          OtpInput(false, _fieldFive, false),
                          OtpInput(false, _fieldSix, false)
                        ],
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.cyan,
                                disabledForegroundColor: Colors.black,
                                disabledBackgroundColor: Colors.white),
                            onPressed: enableResend ? _resendCode : null,
                            child: Text(secondsRemaining == 0
                                ? 'ReSend'
                                : secondsRemaining.toString() + ' Sec')),
                        SizedBox(
                          width: 30,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.purple),
                            onPressed: () {
                              setState(() {
                                _otp = _fieldOne.text +
                                    _fieldTwo.text +
                                    _fieldThree.text +
                                    _fieldFour.text +
                                    _fieldFive.text +
                                    _fieldSix.text;
                                //_fieldOne.
                              });
                            },
                            child: Text('Submit'))
                      ]),

                  const SizedBox(
                    height: 30,
                  ),
                  // Display the entered OTP code
                  Text(
                    _otp ?? '',
                    style: const TextStyle(fontSize: 30),
                  )
                ],
              )
            ]));
  }

  Future<bool> _onWillPop() async {
    //final cont = Get.put(BrowseViewController());
    Get.offAndToNamed("/home");
    return true;
  }

  void _resendCode() {
    //other code here
    setState(() {
      secondsRemaining = 30;
      enableResend = false;
    });
  }
}
