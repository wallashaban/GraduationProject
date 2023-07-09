import 'package:file_picker/file_picker.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:graduation_project/core/utils/exports.dart';
import 'package:graduation_project/medication_reminder_module/presentation_layer/controllers/medication_reminder_cubit.dart';
import 'package:graduation_project/settings_notifications_module/domain_layer/use_cases/get_history_notifications_use_case.dart';
import 'package:graduation_project/settings_notifications_module/domain_layer/use_cases/log_out_use_case.dart';
import 'package:graduation_project/settings_notifications_module/domain_layer/use_cases/make_review_use_case.dart';
import 'package:graduation_project/settings_notifications_module/presentation_layer/cotrollers/settings_notifications_state.dart';
import 'package:graduation_project/settings_notifications_module/presentation_layer/screens/notifications_screen.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain_layer/entities/notifications.dart';

class SettingsNotificationsCubit extends Cubit<SettingsNotificationsState> {
  // final UpdateUserInfoUseCase updateUserInfoUseCase;
  final LogOutUseCase logOutUseCase;
  final MakeReviewUseCase makeReviewUseCase;
  final GetHistoryNotificationsUseCase getHistoryNotificationsUseCase;
  SettingsNotificationsCubit(
    //  this.updateUserInfoUseCase,
    this.logOutUseCase,
    this.makeReviewUseCase,
    this.getHistoryNotificationsUseCase,
  ) : super(SettingsNotificationsInitial());

  /* Authentication profileUpdate = const UserUpdateModel(
    email: '',
    id: 1,
    name: '',
    isReminderVaccine: 0,
  ); */
  General logOut = const GeneralModel(
    data: 'data',
    message: 'message',
    status: false,
  );
  General review = const GeneralModel(
    data: 'data',
    message: 'message',
    status: false,
  );
  Failure serverFailure = const ServerFailure(message: 'message');
  //var open = Hive.openBox('userDataCach');
  // UserDataCach userData = Hive.box('userDataCach').get('user');
  List<Notifications>? notifications;

  FilePickerResult? result;
  File? file;
  String? filePath;
  // ignore: prefer_typing_uninitialized_variables
  var pickedFile;
  final picker = ImagePicker();
  Future pickImage() async {
    debugPrint('befor');
    pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      file = File(pickedFile.path);
      filePath = file!.path;
      debugPrint('picked file ${filePath!}');
    }
    emit(PickImageSettingstate());
    emit(SettingsDone());
  }

  deleteImage() {
    pickedFile = file = filePath = null;
    emit(DeleteImageSettingsState());
  }


  Future logOutUser(context) async {
    /*  emit(
      UpdateUserInfoLoadingState(),
    ); */
    final result = await logOutUseCase(const NoParameters());
    result.fold(
      (l) {
        serverFailure = l;
        emit(
          LogOutErrorState(
            error: l.message,
          ),
        );
      },
      (r) async {
        logOut = r;
        notifications = null;
        BlocProvider.of<VaccinationsCubit>(context).allVaccinations = null;
        BlocProvider.of<MedicationReminderCubit>(context).allReminders = null;
        BlocProvider.of<ReportCubit>(context).allVaccinationReport = null;
        BlocProvider.of<ReportCubit>(context).allDiseaseReport = null;
        BlocProvider.of<ReportCubit>(context).medicalInfo = null;
        BlocProvider.of<ReportCubit>(context).latestDevelopment = null;
        BlocProvider.of<ReportCubit>(context).latestTeeth = null;
        BlocProvider.of<ReportCubit>(context).growth = null;
        CashHelper.deleteData(key: 'token');
        emit(LogOutSuccessState());
      },
    );
  }

  Future makeReview(String message) async {
    emit(
      MakeReviewLoadingState(),
    );
    final result = await makeReviewUseCase(message);
    result.fold(
      (l) {
        serverFailure = l;
        emit(
          MakeReviewErrorState(
            error: l.message,
          ),
        );
      },
      (r) async {
        review = r;

        emit(MakeReviewSuccessState());
      },
    );
  }

  Future getAllNotifications() async {
    emit(
      GetAllNotificationsLoadingState(),
    );
    final result = await getHistoryNotificationsUseCase(const NoParameters());
    result.fold(
      (l) {
        serverFailure = l;
        emit(
          GetAllNotificationsErrorState(
            error: l.message,
          ),
        );
      },
      (r) async {
        notifications = r;

        emit(GetAllNotificationsSuccessState());
        /*  userData.put('user', UserDataCach(
          id: r.id,
           name: r.name,
            email:r. email,
             accessToken:r. accessToken,
             birthDate: r.birthDate,
             gender: r.gender,
             photo: null,//todo refactor the photo
             )); */
      },
    );
  }

  Future notificationsTerminatedApp(context) async {
    await getAllNotifications();
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      // _handleMessage(initialMessage);
      //await getAllNotifications().then((value) {
      AppConstants.navigateTo(
          context: context, routeName: AppRoutes.notificationsScreen);
      //  });
    }
  }

  Future<void> setupInteractedMessage(context) async {
    await getAllNotifications();

    FirebaseMessaging.onMessageOpenedApp.listen((event) async {
      // await getAllNotifications().then((value) {
      AppConstants.navigateTo(
          context: context, routeName: AppRoutes.notificationsScreen);
      //  });
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      //await getAllNotifications().then((value) {
      AppConstants.navigateTo(
          context: context, routeName: AppRoutes.notificationsScreen);
      //  });
      debugPrint('============onMessaging===============');
      debugPrint(
          'onMessage ${message.notification!.title!} ${message.notification!.body}');
      BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
        message.notification!.body.toString(),
        htmlFormatBigText: true,
        contentTitle: message.notification!.title.toString(),
        htmlFormatContentTitle: true,
      );

      AndroidNotificationDetails androidPlatformChannels =
          AndroidNotificationDetails(
        'graduation_project',
        'graduation_project',
        // '',
        importance: Importance.high,
        styleInformation: bigTextStyleInformation,
        priority: Priority.max,
        playSound: true,
      );

      NotificationDetails notificationDetails = NotificationDetails(
        android: androidPlatformChannels,
      );
      await FlutterLocalNotificationsPlugin().show(
        0,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        //  payload: message.data['body'],
      );
    });

    emit(NotificationSuccess());
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

  Future<void> initInfo(BuildContext context) async {
    // try {
    var androidInitialize =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
        InitializationSettings(android: androidInitialize);
    FlutterLocalNotificationsPlugin().initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (dynamic payload) async {
        try {
          if (payload != null && payload.isNotEmpty) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const NotificationsScreen(),
              ),
            );
          } else {}
        } catch (error) {
          debugPrint('error${error.toString()}');
        }
      },
    );
  }
}
