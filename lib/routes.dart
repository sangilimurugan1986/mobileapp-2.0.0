import 'package:ez/core/CustomColors.dart';
import 'package:ez/core/components/custom/custom_checkbox.dart';
import 'package:ez/core/components/custom/custom_chip.dart';
import 'package:ez/core/components/custom/custom_rating.dart';
import 'package:ez/core/components/custom/customlogin.dart';
import 'package:ez/features/qr_scanner/view/qrscanner.dart';
import 'package:ez/features/task_create/view/task_add.dart';
import 'package:ez/features/tasklist/view/tasklist.dart';
import 'package:ez/features/workflow/view/workflow.dart';
import 'package:ez/features/workflow/workflowcreate/view/workflowcreate.dart';
import 'package:ez/features/workflowinitiate/view/workflowinitiate.dart';
import 'package:ez/models/popup/form/formmain.dart';
import 'package:ez/pages/Taskcreen.dart';
import 'package:ez/pages/foldermainscreen.dart';
import 'package:ez/pages/forgotpassword.dart';
import 'package:ez/pages/formmain_initiate.dart';
import 'package:ez/pages/loading.dart';
import 'package:ez/pages/login.dart';
import 'package:ez/pages/lost_connection.dart';
import 'package:ez/pages/otpMainPage.dart';

import 'package:ez/pages/signup.dart';
import 'package:ez/pages/dashmainscreen.dart';
import 'package:ez/pages/taskmainscreen.dart';
import 'package:ez/pages/tastscreenmain.dart';
import 'package:ez/pages/webmainscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'core/components/bottom_menu/categories_screen.dart';
import 'core/components/bottom_menu/explore_screen.dart';
import 'core/components/bottom_menu/reading_list.dart';
import 'models/popup/widgetpopup/popupfullpage_inboxpege.dart';

class AppRoutes {
  AppRoutes._();

  static const workflow = "workflow";
  static const categories = "categories";
  static const videos = "videos";
  static const reading = "Reading List";
  static const workflowinitiate = "workflowinitiate";
  static const workflowcreate = "workflowcreate";
  static const qrscanner = "qrscanner";
  static const tasklist = "tasklist";
  static const taskcreate = "taskcreate";

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
        return MaterialPageRoute(
            settings: settings, builder: (_) => Workflow());
      case AppRoutes.workflowinitiate:
        return MaterialPageRoute(builder: (_) => WorkflowInitiate());
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
        return AppRoutes.workflow;
      case 1:
        return AppRoutes.categories;
      case 2:
        return AppRoutes.videos;
      case 3:
        return AppRoutes.reading;
    }
  }

  static push(BuildContext context, String route) {
    Navigator.of(context).pushNamed(route);
  }

  static pop(BuildContext context, [dynamic? data]) {
    Navigator.of(context).pop(data);
  }

  static present(
      BuildContext context, Widget route, Function(dynamic val) onTap) {
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
        // page: () => CustomCheckbox("Label1 ", "Label2", (p0) {}, (p0) {}),
        // page: () => CustomChip(),
        // page: () => CustomRating(
        //       rating: rating,
        //       onRatingChanged: (rate) {
        //         setState(() {
        //           rating = rate;
        //         });
        //       },
        //       color: CustomColors.red,
        //     ),
        page: () => CustomLogin(
            loginType: 1,
            signInAction: (username, password) {},
            signUpAction: () {},
            googleAction: () {},
            microsoftAction: () {},
            forgotPassword: () {}),
        transition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
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
        transitionDuration: Duration(milliseconds: 500)),
  ];
}
