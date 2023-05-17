import 'package:graduation_project/ai_diseases_module/data_layer/data_source/disease_remote_data_source.dart';
import 'package:graduation_project/ai_diseases_module/presentation_layer/cubit/disease_cubit.dart';
import 'package:graduation_project/core/caching_data/user_data_cach.dart';
import 'package:graduation_project/report_module/presentation_layer/controllers/report_cubit.dart';
import 'package:graduation_project/settings_notifications_module/presentation_layer/cotrollers/settings_notifications_cubit.dart';
import 'package:graduation_project/vaccinations_module/presentaion_layer/controllers/vaccinations_cubit.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

import 'core/routes/app_routes.dart';
import 'core/utils/bloc_observer.dart';
import 'core/utils/exports.dart';
import 'medication_reminder_module/presentation_layer/controllers/medication_reminder_cubit.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  debugPrint("Handling a background message: ${message.data}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  await Hive.initFlutter('caching_db');
  Hive.registerAdapter(UserDataCachAdapter());
  Hive.openBox('userData');
  await Firebase.initializeApp();
  // sl<SettingsNotificationsCubit>().notificationsTerminatedApp(context);
  await FirebaseMessaging.instance.getInitialMessage();
  Bloc.observer = MyBlocObserver();
   ServiceLocator().init();
  await CashHelper.init();

 

  //------------------------------
  //FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const MyApp());
}

//cR6dpQMzQzKNbcIFQiAKyr:APA91bGyWsLqivIIhN1x62AJLFslZf1STfRJ
//_i5G-iQB17W1G-JU6o-vQYBukXtUi94x21Cv4h5QJMqHeiM3y_kkasAgPR__yfHQpFJOg5M0fLxYK1KhkNyjkQ_O_prkJ__aHTRkS3av
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<AuthenticationCubit>()..getToken(),
        ),
        BlocProvider(
          create: (context) => sl<MedicationReminderCubit>()..getAllReminders(),
        ),
        BlocProvider(
          create: (context) => sl<VaccinationsCubit>()..getAllVaccinations(),
        ),
        BlocProvider(
          create: (context) => sl<PrescriptionCubit>()..getAllPrescriiptions(),
        ),
        BlocProvider(
          create: (context) => sl<MedicalTestsCubit>()..getAllMedicalTests(),
        ),
        BlocProvider(
          create: (context) => sl<ReportCubit>()
            ..medicalsInfo()
            ..diseaseReports()
            ..latesttDevelopment()
            ..latesttTeeth()
            ..vaccinationReports(),
        ),
        BlocProvider(
          create: (context) => sl<TeethDevelopmentCubit>()..getAllteeth(),
        ),
        BlocProvider(
          create: (context) =>
              sl<SettingsNotificationsCubit>()..getAllNotifications(),
        ),
        BlocProvider(
          create: (context) => sl<DiseaseCubit>()..getAllAiDiseases(),
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
          theme: 
          ThemeData(
            //border style
            inputDecorationTheme: InputDecorationTheme(
              suffixIconColor: AppColors.appBarColor,
              prefixIconColor: AppColors.appBarColor,

              // fillColor: Colors.green,
              //focusColor: Colors.green,
              labelStyle: TextStyle(
                color: AppColors.greyColor, //todo change color
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide: BorderSide(color: AppColors.appBarColor, width: 2),
              ), //todo change color
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide:
                    const BorderSide(color: AppColors.errorColor, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide: BorderSide(color: AppColors.darkColor, width: 2),
              ), //todo change color
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide: BorderSide(color: AppColors.appBarColor, width: 2),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide:
                    const BorderSide(color: AppColors.errorColor, width: 2),
              ),
            ),
            // primarySwatch: Colors.orange,
            //todo find a way to make the color you want
            scaffoldBackgroundColor: AppColors.white,
            fontFamily: 'IBM Plex Sans Arabic',
            textTheme: TextTheme(
                bodyLarge: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.darkGreyColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 60.sp,
                      overflow: TextOverflow.ellipsis,
                    )),
            //  primarySwatch: AppColors.errorColor,
            appBarTheme: AppBarTheme(
              elevation: 0.0,
              toolbarHeight: 70.h,
              backgroundColor: AppColors.appBarColor,

              actionsIconTheme: IconThemeData(
                color: AppColors.white,
              ),
              centerTitle: true,
              titleTextStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),

              // color: AppColors.darkColor,
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: AppColors.white,
                showUnselectedLabels: true,
                elevation: 190, //todo fix elevation
                selectedItemColor: AppColors.darkColor,
                unselectedItemColor: AppColors.textColor,
                unselectedIconTheme: IconThemeData(
                  color: AppColors.appBarColor,
                ),
                selectedIconTheme: IconThemeData(
                  color: AppColors.textColor,
                )),

            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                padding: MaterialStateProperty.resolveWith((states) =>
                    EdgeInsets.symmetric(horizontal: 35.w, vertical: 10.r)),
                shape: MaterialStateProperty.resolveWith((_) {
                  return RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      15.r,
                    ),
                  );
                }),
                elevation: MaterialStateProperty.resolveWith((states) => 10),
                animationDuration: const Duration(milliseconds: 2000),
                overlayColor: MaterialStateProperty.resolveWith(
                    (states) => AppColors.white),
                textStyle: MaterialStateProperty.resolveWith(
                  (states) => Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                foregroundColor: MaterialStateProperty.resolveWith((states) {
                  return AppColors.white;
                }),
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return AppColors.appBarColor;
                  }
                  return AppColors.appBarColor;
                }),
              ),
            ),
          ),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: onGenerate,
          initialRoute: AppRoutes.splashScreen,
        ),
      ),
    );
  }
}
