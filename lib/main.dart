import 'core/caching_data/medical_details_cach.dart';
import 'core/routes/app_routes.dart';
import 'core/themes/light_theme.dart';
import 'core/utils/bloc_observer.dart';
import 'core/utils/exports.dart';
import 'medication_reminder_module/presentation_layer/controllers/medication_reminder_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  await Hive.initFlutter('caching_db');
  Hive.registerAdapter(UserDataCachAdapter());
  Hive.registerAdapter(MedicalDetailsCachAdapter());
  Hive.openBox('userDataCach');
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.getInitialMessage();
  Bloc.observer = MyBlocObserver();
  ServiceLocator().init();
  await CashHelper.init();
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
          create: (context) => sl<GrowthCubit>()..getAllGrowth(),
        ),
        BlocProvider(
          create: (context) => sl<MedicationReminderCubit>()..getAllReminders()..getAllDays(),
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
            create: (context) => sl<MedicalCubit>()),
      ],
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        designSize: const Size(360, 690),
        builder: (context, child) => MaterialApp(
          title: 'Graduation project',
          theme: lightTheme,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: onGenerate,
          initialRoute: AppRoutes.splashScreen,
        ),
      ),
    );
  }
}
