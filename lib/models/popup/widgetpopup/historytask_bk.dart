import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stepper_list_view/stepper_list_view.dart';
import 'package:url_launcher/url_launcher.dart';

class HistoryTask extends StatefulWidget {
  const HistoryTask({Key? key}) : super(key: key);

  @override
  State<HistoryTask> createState() => _HistoryTaskState();
}

class _HistoryTaskState extends State<HistoryTask> {
  final _stepperData = List.generate(
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
            )).toList();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 40, 5, 20),
      child: StepperListView(
        showStepperInLast: false,
        stepperData: _stepperData,
        stepAvatar: (_, data) {
          final stepData = data as StepperItemData;
          return PreferredSize(
            preferredSize: const Size.fromRadius(20),
            child: Padding(
                padding: EdgeInsets.all(0),
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                      'assets/images/logo/user/user.png') /*NetworkImage(
                    stepData.avatar!,
                  )*/
                  ,
                )),
          );
        },
        stepWidget: (_, data) {
          final stepData = data as StepperItemData;
          return PreferredSize(
            preferredSize: const Size.fromWidth(30),
            child: Text(
              stepData.content['RECEIVED_ON'] ?? '',
              style: TextStyle(
                color: theme.primaryColor,
                fontSize: 13,
              ),
              textAlign: TextAlign.center,
            ),
          );
        },
        stepContentWidget: (_, data) {
          final stepData = data as StepperItemData;
          return Container(
            // color: Colors.green,
            margin: const EdgeInsets.only(
              top: 0,
            ),
            padding: const EdgeInsets.all(
              0,
            ),
            child: ListTile(
              //contentPadding: const EdgeInsets.all(7),
              visualDensity: const VisualDensity(
                vertical: -4,
                horizontal: -4,
              ),
              title: Text(stepData.content['STAGE'] ?? ''),
              subtitle: stepData.content['STAGE'] != 'Completed'
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Text('ACTION USER') /*Icon(Icons.work)*/,
                            ),
                            Expanded(
                              flex: 7,
                              child:
                                  Text(stepData.content['ACTION_USER'] ?? ''),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Expanded(
                              flex: 5,
                              child: Text('PROCESSED ON') /*Icon(Icons.phone)*/,
                            ),
                            Expanded(
                              flex: 7,
                              child:
                                  Text(stepData.content['PROCESSED_ON'] ?? ''),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Expanded(
                              flex: 5,
                              child: Text('PROCESSED BY'), /*Icon(Icons.email)*/
                            ),
                            Expanded(
                              flex: 7,
                              child:
                                  Text(stepData.content['PROCESSED_BY'] ?? ''),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Expanded(
                              flex: 5,
                              child: Text('STATUS'), /*Icon(Icons.email)*/
                            ),
                            Expanded(
                              flex: 7,
                              child: Text(
                                stepData.content['Status'] ?? '',
                                style: TextStyle(
                                    color: Colors.purple,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    )
                  : SizedBox(),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
                side: BorderSide(
                  color: theme.dividerColor,
                  width: 0.8,
                ),
              ),
            ),
          );
        },
        stepperThemeData: StepperThemeData(
          lineColor: Colors.purple,
          lineWidth: 2,
        ),
        physics: const BouncingScrollPhysics(),
      ),
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
