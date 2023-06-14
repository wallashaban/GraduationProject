import '../../../core/utils/exports.dart';

import '../widgets/block_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isExist = false;
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
                    onTap: () async {
                      if (CashHelper.getData(
                              key:
                                  'diseaseSaved ${CashHelper.getData(key: 'id')}') ==
                          null) {
                        await AppConstants.userExistDiseaseOrNot(
                                isExist, context)
                            .then((value) {
                          AppConstants.navigateTo(
                            context: context,
                            routeName: AppRoutes.homeAiDiseaseScreen,
                          );
                        });
                      } else {
                        AppConstants.navigateTo(
                          context: context,
                          routeName: AppRoutes.homeAiDiseaseScreen,
                        );
                      }
                      /* AppConstants.navigateTo(
                        context: context,
                        routeName: AppRoutes.homeAiDiseaseScreen,
                      ); */
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
                    imageHeight: 75.h,
                    imageWidth: 124.w,
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
                          routeName: CashHelper.getData(key: 'reminder') == null
                              ? AppRoutes.medicationReminderScreen
                              : AppRoutes.allMedicationReminderScreen);
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
