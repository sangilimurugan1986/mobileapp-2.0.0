import 'package:ez/features/qr_scanner/view/qrscanner.dart';
import 'package:ez/features/workflow/view/workflow.dart';
import 'package:ez/features/workflow/workflowcreate/view/workflowcreate.dart';
import 'package:ez/features/workflowinitiate/view/workflowinitiate.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'core/CustomColors.dart';
import 'core/NewCom/PageMain.dart';
import 'core/components/bottom_menu/categories_screen.dart';
import 'core/components/bottom_menu/explore_screen.dart';
import 'core/components/bottom_menu/reading_list.dart';
import 'core/components/custom/custom_checkbox.dart';
import 'core/components/custom/custom_chip.dart';
import 'core/components/custom/custom_rating.dart';
import 'core/components/custom/customlogin.dart';
import 'core/v5/models/popup/popupfullpage_inboxpagemvvm.dart';
import 'core/v5/pages/loading.dart';
import 'core/v5/pages/login.dart';
import 'core/v5/pages/lost_connection.dart';
import 'features/dashboard/view/DashBoard.dart';
import 'features/folder/view/folderlist.dart';
import 'features/task_create/view/task_add.dart';
import 'features/tasklist/view/tasklist.dart';
import 'features/workflow/view/Inboxworkflow.dart';
import 'features/workflow/view/workflowdetailscreen.dart';

class AppRoutes {
  AppRoutes._();

  static const workflow = "workflow";
  static const categories = "categories";
  static const videos = "videos";
  static const reading = "Reading List";
  static const workflowinitiate = "workflowinitiate";
  static const workflowcreate = "workflowcreate";
  static const qrscanner = "qrscanner";
  static const workflowlist = "WorkflowList";
  static const dashboard = "Dashboard";
  static const workflowdetail = "workflowdetails";
  static const fulldetails = 'Details';
  static const folders = 'Folders';
  static const tasklist = "TaskList";
  static const taskcreate = "TaskCreate";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    switch (settings.name) {
      case AppRoutes.videos:
        return MaterialPageRoute(builder: (_) => ExploreScreen());
      case AppRoutes.categories:
        return MaterialPageRoute(builder: (_) => CategoriesScreen());
      case AppRoutes.reading:
        return MaterialPageRoute(builder: (_) => ReadListScreen());
      case AppRoutes.workflow:
        return MaterialPageRoute(settings: settings, builder: (_) => Workflow());
      case AppRoutes.workflowinitiate:
        return MaterialPageRoute(builder: (_) => WorkflowInitiate());
      case AppRoutes.qrscanner:
        return MaterialPageRoute(builder: (_) => QrScanner());

      case AppRoutes.dashboard:
        return MaterialPageRoute(builder: (_) => Dashboard());
      case AppRoutes.workflowlist:
        return MaterialPageRoute(builder: (_) => InboxWorkflow());
      case AppRoutes.workflowdetail:
        return MaterialPageRoute(builder: (_) => WorkflowDetails());
      case AppRoutes.fulldetails:
        return MaterialPageRoute(builder: (_) => PopupFullpageInboxPageMvvm());
      case AppRoutes.folders:
        return MaterialPageRoute(builder: (_) => FolderList());

      case AppRoutes.tasklist:
        return MaterialPageRoute(builder: (_) => TaskListScreen());
      case AppRoutes.qrscanner:
        return MaterialPageRoute(builder: (_) => QrScanner());
      case AppRoutes.taskcreate:
        return MaterialPageRoute(builder: (_) => TaskCreate());

      // case AppRoutes.workflowcreate:
      //   return MaterialPageRoute(
      //       builder: (_) => WorkflowCreate(
      //             datas: settings.arguments as dynamic,
      //             isEdit: false,
      //           ));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("error"),
        ),
        body: const Center(
          child: Text("error"),
        ),
      );
    });
  }

  static initialRouteForIndex(int index) {
    switch (index) {
      case 0:
        return AppRoutes.dashboard;
      case 1:
        return AppRoutes.folders;
      case 2:
        return AppRoutes.workflow;
      case 3:
        return AppRoutes.videos;
      case 4:
        return AppRoutes.reading;
    }
  }

  static push(BuildContext context, String route) {
    //Navigator.of(context).pushNamed(route);
    Navigator.pushNamed(context, route);
  }

  static pop(BuildContext context, [dynamic? data]) {
    Navigator.of(context).pop(data);
  }

  static present(BuildContext context, Widget route, Function(dynamic val) onTap) {
    Navigator.of(context)
        .push(
      CupertinoPageRoute(
        fullscreenDialog: true,
        builder: (context) => route,
      ),
    )
        .then((value) {
      onTap(value);
    });
  }

  static changeRoot(BuildContext context, String route) {
    Navigator.of(context).pushReplacementNamed(route);
  }

  static final routes = [
    GetPage(name: '/', page: () => Loading()),
    GetPage(name: '/noConnection', page: () => LostConnection()),
    GetPage(
        name: '/loginscreen',
        page: () => LoginPage(),
/*         page: () => CustomRating(
               rating: rating,
               onRatingChanged: (rate) {
                 setState(() {
                   rating = rate;
                 });
               },
               color: CustomColors.red,
             ),*/
        //page: () => LoginPage(),
        //page: () => CustomChip(),
        //page: () => CustomCheckbox("Label1 ", "Label2", (p0) {}, (p0) {}),
        /*page: () => CustomLogin(
            // page: () => CustomCheckbox("Label1 ", "Label2", (p0) {}, (p0) {}),
            // page: () => CustomChip(),
             page: () => CustomRating(
            //       rating: rating,
            //       onRatingChanged: (rate) {
            //         setState(() {
            //           rating = rate;
            //         });
            //       },
            //       color: CustomColors.red,
            //     ),
            loginType: 0,
            signInAction: (username, password) {},
            signUpAction: () {},
            googleAction: () {},
            microsoftAction: () {},
            forgotPassword: () {}),*/
        transition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 500)),
/*    GetPage(
        name: '/forgotpassword',
        page: () => ForgotPasswordPage(),
        transition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: '/signup',
        page: () => SignUpPage(),
        transition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: '/home',
        page: () => DashMainScreen(),
        transition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: '/workflowinbox',
        page: () => DashMainScreen(),
        transition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: '/task',
        page: () => TaskScreenMain(),
        transition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: '/folder',
        page: () => FolderMainScreen(),
        transition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: '/tasks',
        page: () => TaskMainScreen(),
        transition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: '/web',
        page: () => WebMainScreen(),
        transition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: '/otpscreen',
        page: () => OtpMianPage(),
        transition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: '/inboxpage',
        page: () => PopupFullpageInboxPage(),
        transition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: '/formview',
        page: () => FormMain(),
        transition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: '/formviewinitiate',
        page: () => FormMainInitiate(),
        transition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 500)),*/
  ];
}
