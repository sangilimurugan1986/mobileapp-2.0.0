import 'dart:io';
import 'package:ez/controllers/browse_view_controller.dart';
import 'package:ez/controllers/dashmaincontroller.dart';
import 'package:ez/controllers/foldermaincontroller.dart';
import 'package:ez/controllers/session_controller.dart';
import 'package:ez/features/login/viewmodel/loginviewmodel.dart';
import 'package:ez/features/workflow/view_model/viewmodel.dart';
import 'package:ez/features/workflowinitiate/viewmodel/viewmodel.dart';
import 'package:ez/pages/login.dart';
import 'package:ez/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:catcher/catcher.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import 'controllers/auth_controller.dart';
import 'controllers/forgot_controller.dart';
import 'controllers/login_controller.dart';
import 'controllers/signup_controller.dart';
import 'controllers/taskcontroller.dart';
import 'controllers/taskmaincontroller.dart';
import 'controllers/webmaincontroller.dart';
//import 'package:local_auth/local_auth.dart';
import 'core/di/injection.dart';
import 'features/dashboard/view_model/viewmodedashboard.dart';
import 'features/workflow/view_model/viewmodeworkflowlist.dart';
import 'models/popup/controllers/commentcontroller.dart';

void initialize() {
  //SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black87, //or set color with: Color(0xFF0000FF)
  ));

  Get.put<AuthController>(AuthController());
  Get.put<SessionController>(SessionController());
  //Get.put<LanguageController>(LanguageController());
  Get.put<ForgotController>(ForgotController());
  Get.put<SignUpController>(SignUpController());
  Get.put<BrowseViewController>(BrowseViewController());
  Get.put<DashMainController>(DashMainController());
  Get.put<TaskMainController>(TaskMainController());
  Get.put<TaskController>(TaskController());
  Get.put<FolderMainController>(FolderMainController());
  Get.put<WebMainController>(WebMainController());
  Get.put<CommentController>(CommentController());
  Get.put<LoginController>(LoginController());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  initialize();
  setupLazySingleton();
  CatcherOptions debugOptions = CatcherOptions(DialogReportMode(), [ConsoleHandler()]);
  CatcherOptions releaseOptions = CatcherOptions(DialogReportMode(), []);
/*
  debugPrint('Authendicate');
  bool isAuthenticated = await Authentication.authenticateWithBiometrics();
  debugPrint(isAuthenticated.toString());
  debugPrint('Authendicate');*/

/*  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) => runApp(MyApp()),
  );*/
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(
    MultiProvider(
      providers: [
        // Provide the UserViewModel with UserRepository dependency to manage user data and API calls
        ChangeNotifierProvider<WorkflowViewModel>(
          create: (context) => sl.get<WorkflowViewModel>(),
        ),
        ChangeNotifierProvider<WorkflowInitiateViewModel>(
            create: (context) => sl.get<WorkflowInitiateViewModel>()),
        ChangeNotifierProvider<LoginViewModel>(
          create: (context) => sl.get<LoginViewModel>(),
        ),
        ChangeNotifierProvider<DashboardViewModel>(
          create: (context) => sl.get<DashboardViewModel>(),
        ),
        ChangeNotifierProvider<WorkflowListViewModel>(
          create: (context) => sl.get<WorkflowListViewModel>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

/*Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (await _isBiometricAvailable()) {
    await _getListOfBiometricTypes();
    await _authenticateUser();
  }

  runApp(App());
}*/

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (authController) {
      return ScreenUtilInit(
/*        designSize: Size(
          414,
          902,
        ),*/
        //allowFontScaling: true,
        builder: (_, child) => GetMaterialApp(
            theme: ThemeData(
                //primarySwatch: Colors.grey.shade100,

                fontFamily: 'Outfit',
                colorScheme: ColorScheme.fromSwatch()
                    .copyWith(secondary: Colors.purple, background: Colors.white),
                dividerColor: Colors.white),
            navigatorKey: Catcher.navigatorKey,
            title: 'EZOFIS V5',
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            getPages: AppRoutes.routes),
      );
    });
/*    return MaterialApp(
      title: 'V5',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );*/
  }
}

/*class Authentication {
  static Future<bool> authenticateWithBiometrics() async {
    LocalAuthentication localAuthentication = LocalAuthentication();
    bool isBiometricSupported = await localAuthentication.isDeviceSupported();
    bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;

    bool isAuthenticated = false;

    if (isBiometricSupported && canCheckBiometrics) {
      isAuthenticated = await localAuthentication.authenticate(
        localizedReason: 'Please complete the biometrics to proceed.',
        //biometricOnly: true,
        stickyAuth: true,
      );
    }

    return isAuthenticated;
  }
}*/
