import 'dart:convert';

import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stepper_list_view/stepper_list_view.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../api/auth_repo.dart';
import '../../../utils/helper/aes_encryption.dart';
import '../controllers/popupfullpagecontroller.dart';

class HistoryTask extends StatefulWidget {
  const HistoryTask({Key? key}) : super(key: key);

  @override
  State<HistoryTask> createState() => _HistoryTaskState();
}

class _HistoryTaskState extends State<HistoryTask> {
  final controllerpopup = Get.put(PopupFullPageController());
  /*final _stepperData = List.generate(
      5,
      (index) => index != 4
          ? StepperItemData(
              id: '$index',
              content: ({
                'STAGE': 'Register for Complaints',
                'ACTION_USER': 'arun@ezofis.com',
                'PROCESSED_ON': '20-Jun-2023 08:14 PM',
                'PROCESSED_BY': 'arun@ezofis.com',
                'RECEIVED_ON': '19-MAY-2023\n08:14 PM',
                'Status': 'Submit',
                "contact_list": {
                  "LinkedIn": "https://www.linkedin.com/in/subhashcs/",
                  "Portfolio": "https://subhashdev121.github.io/subhash/#/",
                }
              }),
              avatar:
                  'http://52.172.32.88/ezofis-web/img/mark-white.2f046300.png',
            )
          : StepperItemData(
              id: '$index',
              content: ({
                'STAGE': 'Completed',
                'ACTION_USER': 'arun@ezofis.com',
                'PROCESSED_ON': '20-Jun-2023 08:14 PM',
                'PROCESSED_BY': 'arun@ezofis.com',
                'RECEIVED_ON': '19-MAY-2023\n08:14 PM',
                'Status': 'End',
                "contact_list": {
                  "LinkedIn": "https://www.linkedin.com/in/subhashcs/",
                  "Portfolio": "https://subhashdev121.github.io/subhash/#/",
                }
              }),
              avatar:
                  'http://52.172.32.88/ezofis-web/img/mark-white.2f046300.png',
            )).toList();*/
  var _stepperData;
  @override
  void initState() {
    super.initState();
    setState(() {
      _stepperData = null;
    });
    getHistoryDetails();
  }

  void getHistoryDetails() async {
    //368
    SharedPreferences pre = await SharedPreferences.getInstance();

    final responses =
        await AuthRepo.getHistoryList(controllerpopup.sWorkFlowId, controllerpopup.sProcessId);
    String dec = AaaEncryption.decryptAESaaa(responses.toString());
    var tagObjsJson = jsonDecode(dec) as List;
    setState(() {
      _stepperData = List.generate(
          tagObjsJson.length,
          (index) => index != tagObjsJson.length
              ? StepperItemData(
                  id: '$index',
                  content: ({
                    //
                    'STAGE': tagObjsJson.elementAt(index)['stage'],
                    'ACTION_USER': tagObjsJson.elementAt(index)['actionUser'],
                    'PROCESSED_ON': tagObjsJson.elementAt(index)['processedOn'],
                    'PROCESSED_BY': tagObjsJson.elementAt(index)['processedBy'],
                    'RECEIVED_ON': tagObjsJson.elementAt(index)['receivedOn'],
                    'Status': tagObjsJson.elementAt(index)['stage'],
                    "contact_list": {
                      "LinkedIn": "https://www.linkedin.com/in/subhashcs/",
                      "Portfolio": "https://subhashdev121.github.io/subhash/#/",
                    }
                  }),
                  avatar: 'http://52.172.32.88/ezofis-web/img/mark-white.2f046300.png',
                )
              : StepperItemData(
                  id: '$index',
                  content: ({
                    'STAGE': 'Completed',
                    'ACTION_USER': 'aruncomplete@ezofis.com',
                    'PROCESSED_ON': '20-Jun-2023 08:14 PM',
                    'PROCESSED_BY': 'arun@ezofis.com',
                    'RECEIVED_ON': '19-MAY-2023\n08:14 PM',
                    'Status': 'End',
                    "contact_list": {
                      "LinkedIn": "https://www.linkedin.com/in/subhashcs/",
                      "Portfolio": "https://subhashdev121.github.io/subhash/#/",
                    }
                  }),
                  avatar: 'http://52.172.32.88/ezofis-web/img/mark-white.2f046300.png',
                )).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 40, 10, 20),
      child: _stepperData != null
          ? StepperListView(
              shrinkWrap: true,
              showStepperInLast: false,
              stepperData: _stepperData,
              stepAvatar: (_, data) {
                final stepData = data as StepperItemData;
                return PreferredSize(
                  preferredSize: const Size.fromRadius(4),
                  child: Padding(
                      padding: EdgeInsets.all(0),
                      child: CircleAvatar(
                        maxRadius: 4,
                        backgroundColor: Colors.lightBlueAccent,
                        /*backgroundImage: AssetImage(
                      'assets/images/logo/user/user.png') */ /*NetworkImage(
                    stepData.avatar!,
                  )*/
                      )),
                );
              },
              stepWidget: (_, data) {
                final stepData = data as StepperItemData;
                return PreferredSize(
                    preferredSize: Size.fromWidth(30),
                    child: Column(
                      children: [
/*                  Text(
                    stepData.content['RECEIVED_ON'] ?? '',
                    style: TextStyle(
                      color: theme.primaryColor,
                      fontSize: 13,
                    ),
                    textAlign: TextAlign.center,
                  ),*/
                      ],
                    ));
              },
              stepContentWidget: (_, data) {
                final stepData = data as StepperItemData;

                return Container(
                    //color: Colors.black,
                    margin: EdgeInsets.fromLTRB(5, 1, 1, 1),
                    //color: Colors.lightGreenAccent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        stepData.content['STAGE'] != 'Completed'
                            ? Text(stepData.content['STAGE'] ?? '')
                            : Text('END'),
                        stepData.content['STAGE'] != 'Completed'
                            ? Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                          child: Row(children: [
                                        Text(stepData.content['ACTION_USER'] ?? '',
                                            overflow: TextOverflow.ellipsis),
                                      ]))),
                                  /*Expanded(
                                      flex: 1,
                                      child: Container(
                                          child: Row(children: [
                                        Text('\u2022',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            )),
                                        SizedBox(width: 5),
                                        Text(
                                            stepData.content['PROCESSED_ON'] ??
                                                '',
                                            overflow: TextOverflow.ellipsis)
                                      ]))),*/
                                ],
                              )
                            : SizedBox(),
                        stepData.content['STAGE'] != 'Completed'
                            ? Row(
                                children: [
                                  SizedBox(width: 10),
                                  SizedBox(width: 5),
                                  Text('\u2022',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      )),
                                  SizedBox(width: 5),
                                  Text(
                                    'STATUS is ',
                                  ),
                                  Text('\'' + stepData.content['Status'] + '\'' ?? '',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ],
                              )
                            : SizedBox(),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ));
              },
              stepperThemeData: StepperThemeData(
                lineColor: Colors.cyanAccent.shade200,
                lineWidth: 1,
              ),
              physics: const BouncingScrollPhysics(),
            )
          : Container(),
    );
  }

  Future<void> _launchURL(String? url) async {
    if (url == null) {
      return;
    }
    try {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      }
      return;
    } catch (e) {
      if (kDebugMode) {
        print('Failed to launch URL - $e');
      }
    }
  }
}
