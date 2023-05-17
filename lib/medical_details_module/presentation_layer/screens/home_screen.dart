import 'package:graduation_project/settings_notifications_module/presentation_layer/cotrollers/settings_notifications_cubit.dart';

import '../../../core/utils/exports.dart';

import '../widgets/block_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void message(context) {
    FirebaseMessaging.onMessage.listen((((RemoteMessage message) {
      debugPrint('Message ${message.data.toString()}');
      AppConstants.navigateTo(
          context: context, routeName: AppRoutes.notificationsScreen);
      if (message.notification != null) {
        debugPrint('Notification ${message.notification}');
      }
    })));
  }

  @override
  void initState() {
    super.initState();
    message(context);

    sl<SettingsNotificationsCubit>()
      ..requestPermission() //..notificationsTerminatedApp(context)
      ..setupInteractedMessage(context); //..initInfo(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlockWidget(
                    onTap: () {
                      AppConstants.navigateTo(
                        context: context,
                        routeName: AppRoutes.homeAiDiseaseScreen,
                      );
                    },
                    text: AppStrings.diseases,
                    image: AppImages.diseaseImage,
                  ),
                  BlockWidget(
                    onTap: () {
                      AppConstants.navigateTo(
                        context: context,
                        routeName: AppRoutes.vaccineScreen,
                      );
                    },
                    text: AppStrings.vaccination,
                    image: AppImages.vaccinationImage,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlockWidget(
                    onTap: () {
                      AppConstants.navigateTo(
                          context: context,
                          routeName: AppRoutes.healthMedicalRecordScreen);
                    },
                    text: AppStrings.medical,
                    image: AppImages.medicalImage,
                  ),
                  BlockWidget(
                    onTap: () {
                      AppConstants.navigateTo(
                          context: context,
                          routeName: AppRoutes.allMedicationReminderScreen);
                    },
                    text: AppStrings.reminder,
                    image: AppImages.reminderImage,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void message(context) {
  FirebaseMessaging.onMessage.listen((((RemoteMessage message) {
    debugPrint('Message ${message.data.toString()}');
    AppConstants.navigateTo(
        context: context, routeName: AppRoutes.notificationsScreen);
    if (message.notification != null) {
      debugPrint('Notification ${message.notification}');
    }
  })));
}
