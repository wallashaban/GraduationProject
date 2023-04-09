
import 'package:graduation_project/core/routes/app_routes.dart';
import 'package:graduation_project/medication_reminder_module/presentation_layer/controllers/medication_reminder_cubit.dart';

import 'core/utils/bloc_observer.dart';
import 'core/utils/exports.dart';

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   await Firebase.initializeApp();

//   // debugPrint("Handling a background message: ${message.messageId}");
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp();
  ServiceLocator().init();
  await CashHelper.init();
 debugPrint('token cache >${AppStrings.token}');
  //print('shared' + CashHelper.getData(key: 'token'));
  //  sl<MedicalCubit>().getAllAllergy();
  // FirebaseMessaging.onMessage.listen((((RemoteMessage message) {
  //   debugPrint('Message ${message.data}');
  //   if (message.notification != null) {
  //     debugPrint('Notification ${message.notification}');
  //   }
  // })));
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // AuthenticationCubit(
  //         LoginUserUseCase(
  //             AuthenticationRepository(AuthenticationRemoteDataSource())),
  //         RegisterUserUseCase(
  //             AuthenticationRepository(AuthenticationRemoteDataSource())))
  //     .loginUserUseCase(LoginUserParameters(
  //   email: '',
  //   password: '',
  //   fcmToken: '',
  // ));
  runApp(const MyApp());
}

//cR6dpQMzQzKNbcIFQiAKyr:APA91bGyWsLqivIIhN1x62AJLFslZf1STfRJ
//_i5G-iQB17W1G-JU6o-vQYBukXtUi94x21Cv4h5QJMqHeiM3y_kkasAgPR__yfHQpFJOg5M0fLxYK1KhkNyjkQ_O_prkJ__aHTRkS3av
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /*  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      // _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessage.listen((((RemoteMessage message) {
      debugPrint('Message ${message.data.toString()}');
      if (message.notification != null) {
        debugPrint('Notification ${message.notification}');
      }
    })));
  }

  void requestPermission() async {
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    NotificationSettings settings = await firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint('User grantedPermission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      debugPrint('User granted provisional Permission');
    } else {
      debugPrint('User deslined or has not Permission');
    }
  }

  void getToken() async {
    await FirebaseMessaging.instance.getToken().then((tok) {
      token = tok.toString();
      debugPrint('token $token');
    });
  } */

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<AuthenticationCubit>()..getToken()
          ,
        ),
        BlocProvider(
          create: (context) => sl<MedicationReminderCubit>()
          ,
        ),
         BlocProvider(
          create: (context) => sl<TeethDevelopmentCubit>()..getAllteeth()
          ,
        ),
        BlocProvider(
            create: (context) => sl<MedicalCubit>()
              ..getAllAllergy()
              ..getChronicDiseases()
              ..getSkinDiseases()
              ..getGeneticDiseases()),
      ],
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        designSize: const Size(360, 690),
        builder: (context, child) => MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              // primarySwatch: Colors.blue,
              scaffoldBackgroundColor: AppColors.white,
              fontFamily: 'IBM Plex Sans Arabic',
              appBarTheme: AppBarTheme(
                elevation: 0.0,
                toolbarHeight: 80.h,
                backgroundColor: AppColors.appBarColor,

                // color: AppColors.darkColor,
              )),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: onGenerate,
          initialRoute: AppRoutes.splashScreen,
        ),
      ),
    );
  }
}
