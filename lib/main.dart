import 'package:flutter/material.dart';
import 'package:graduation_project/authentication_module/presentaion_layer/screens/login_screen.dart';
import 'package:graduation_project/core/services/auth_services.dart';

import 'core/utils/exports.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  // debugPrint("Handling a background message: ${message.messageId}");
}

String token = '';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  ServiceLocator().init();
  FirebaseMessaging.onMessage.listen((((RemoteMessage message) {
    debugPrint('Message ${message.data}');
    if (message.notification != null) {
      debugPrint('Notification ${message.notification}');
    }
  })));
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
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
  AuthServices().signInWithFacebook();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

//cR6dpQMzQzKNbcIFQiAKyr:APA91bGyWsLqivIIhN1x62AJLFslZf1STfRJ
//_i5G-iQB17W1G-JU6o-vQYBukXtUi94x21Cv4h5QJMqHeiM3y_kkasAgPR__yfHQpFJOg5M0fLxYK1KhkNyjkQ_O_prkJ__aHTRkS3av
class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    requestPermission();
    getToken();
  }

  Future<void> setupInteractedMessage() async {
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
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthenticationCubit>()
      /* ..loginUser(LoginUserParameters(
          email: 'omnia@gmail.com',
          password: '12345678',
          fcmToken:
              'cR6dpQMzQzKNbcIFQiAKyr:APA91bGyWsLqivIIhN1x62AJLFslZf1STfRJ_i5G-iQB17W1G-JU6o-vQYBukXtUi94x21Cv4h5QJMqHeiM3y_kkasAgPR__yfHQpFJOg5M0fLxYK1KhkNyjkQ_O_prkJ__aHTRkS3av',
        )), */
      ,
      child: MaterialApp(
        title: 'Flutter Demo',
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
        home: const LoginScreen(),
      ),
    );
  }
}
