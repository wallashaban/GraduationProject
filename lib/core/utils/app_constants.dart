import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:graduation_project/core/utils/exports.dart';
import 'package:graduation_project/medication_reminder_module/presentation_layer/controllers/medication_reminder_cubit.dart';

import '../../prescription_module/presentation_layer/controllers/prescription_cubit.dart';

class AppConstants {
  static const String baseUrl = 'https://baby-health-care.sonicar.tech/api/';
  static const String aiBaseUrl =
      'https://testgp-production-df5f.up.railway.app/';
  static const String skin = 'predictApi';

  //auth
  static const String login = 'auth/login';
  static const String register = 'auth/register';
  static const String loginWithGoogle = 'auth/login/callback';
  static const String loginWithFacebook = 'auth/login/callback';
  //reset password
  static const String forgetPassword = 'auth/password/email';
  static const String checkCode = 'auth/password/code/check';
  static const String updatePassword = 'auth/password/reset';
  //medical details
  static const String storeMedicalDetails = 'store-medical-details';
  static const String updateMedicalDetails = 'medicalDetails';

  static const String getAllAllergy = 'all-allergies';
  static const String skinDiseases = 'skin-diseases';
  static const String chronicDiseases = 'chronic-diseases';
  static const String geneticDieases = 'genetic-diseases';
  //medical tests
  static const String deleteMedicalTrest = 'delete-medical-test/';
  static const String storeMedicalTest = 'store-medical-test';
  static const String getallMedicalTrest = 'all-medical-test';
  static const String getSingleMedicalTest = 'get-single-medical-test/';
  static const String updateMedicalTrest = 'update-medical-test/';

  // prescription

  static const String storePrescription = 'store-prescription';
  static const String getAllPrescriptions = 'all-prescription';
  static const String getSinglePrescripton = 'get-single-prescription/';
  static const String updatePrescription = 'update-prescription/';
  static const String deletePrescription = 'delete-prescription/';

  // teeth development

  static const String storeTeethDev = 'store-teeth-dev';
  static const String updateTeethDev = 'update-teeth-dev/';
  static const String deleteTeethDev = 'delete-teeth-dev/';
  static const String getSingleTeeth = 'get-single-teeth/';
  static const String getAllTeethDev = 'all-teeth-dev';

  // medication reminder

  static const String storeReminder = 'store-reminder';
  static const String updateReminder = 'update-reminder/';
  static const String deleteReminder = 'delete-reminder/';
  static const String getSingleReminder = 'get-single-reminder/';
  static const String getAllReminders = 'all-reminders';
  static const String getAllDays = 'days';

  /// vaccination
  static const String attatchVaccination = 'attach-vaccination';
  static const String stopOrActiveVaccination = 'stop-vaccination-reminder';
  static const String getSingleVaccination = 'single-vaccination/';
  static const String getAllVaccinations = 'all-vaccinations';
  //reports
  static const String updateProfile = 'update-profile';
  static const String logOut = 'auth/logout';
  static const String review = 'make-review';
  static const String notification = 'history-notify';

  //ai diseases
  static const String getAilDisease = 'all-ai-diseases';
  static const String storeAiDisease = 'store-disease';
  static const String deleteAiDisease = 'delete-disease/';

  // development flow

  static const String getAllTips = 'tips-of-user';
  static const String questionsOfTips = 'get-questions-of-tip/';
  static const String subjectsWithQuestions = 'get-questions';
  static const String createTips = 'create-tips';
  static const String updateTips = 'update-tips';
//reports
  static const String latestDevelopment = 'development-follow-info';
  static const String vaccinationReport = 'vaccine-report';
  static const String latestTeeth = 'teeth-report';
  static const String diseaseReport = 'disease-report';
  static const String medicalInfo = 'medical-info';
  // growth
  static const String calculateGrowth = 'calc-growth';
  static const String getAllGrowth = 'growth';

  static DropdownMenuItem buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: CustomText(
        text: item,
        color: AppColors.darkColor,
        size: 16.sp,
        fontWeight: FontWeight.bold,
      ));
  static navigateReplacement(
      {required BuildContext context, required String routeName}) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  static navigateTo(
      {required BuildContext context, required String routeName, arguments}) {
    Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  static Future showDate(context) async {
    String? date;
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 10),
      lastDate: DateTime.now(),
    ).then((value) async {
      if (value != null) {
        var month = value.month.toInt() < 10 ? '0${value.month}' : value.month;
        var day = value.day.toInt() < 10 ? '0${value.day}' : value.day;
        date = '${value.year}-$month-$day';
      }
    });
    return date;
  }

  static showSnackbar(
      {required BuildContext context, required String content}) async {
    return await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shadowColor: Colors.grey[400]!,
              elevation: 123,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: AppColors.appBarColor),
                  borderRadius: BorderRadius.circular(20.r)),
              content: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomText(
                      text: content,
                      size: 14.sp,
                      maxLines: 7,
                      textAlign: TextAlign.end,
                    )
                  ],
                ),
              ),
            ));
  }

  /* ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.transparent,
        content: Stack(
          children: [
            Container(
                // height: 90.h,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: AppColors.textColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    //  const SizedBox(width: 48,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'غلط ي حبيبى غلط يا بابا 😏',
                            color: AppColors.darkColor,
                            fontWeight: FontWeight.bold,
                            size: 20,
                          ),
                          CustomText(
                            text: content,
                            color: AppColors.darkColor,
                            fontWeight: FontWeight.bold,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        elevation: 0.0,
      ));
 */
  static Future showDialoog(
    context, {
    id,
    presId,
    bool isPrescription = false,
    bool isTooth = false,
    bool isReminder = false,
  }) =>
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  //padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        30.r,
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[400]!,
                            blurRadius: 4,
                            blurStyle: BlurStyle.outer),
                      ],
                      color: AppColors.white),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AlertDialog(
                          backgroundColor: AppColors.white,
                          elevation: 0.0,
                          content: CustomText(
                            text: AppStrings.sure,
                            size: 14.sp,
                            fontWeight: FontWeight.normal,
                          ),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                dialogElevatedButton(
                                  text: AppStrings.yes,
                                  onPressed: () async {
                                    isPrescription
                                        ? await BlocProvider.of<PrescriptionCubit>(context)
                                            .deletePrescription(presId)
                                            .then((value) =>
                                                Navigator.pop(context))
                                        : isTooth
                                            ? await BlocProvider.of<TeethDevelopmentCubit>(context)
                                                .deleteTooth(id)
                                                .then((value) =>
                                                    Navigator.pop(context))
                                            : isReminder
                                                ? await BlocProvider.of<MedicationReminderCubit>(
                                                        context)
                                                    .deleteReminders(id)
                                                    .then((value) =>
                                                        Navigator.pop(context))
                                                : await BlocProvider.of<
                                                        MedicalTestsCubit>(context)
                                                    .deleteMedicalTest(id)
                                                    .then((value) => Navigator.pop(context));
                                  },
                                  color: AppColors.errorColor,
                                  textColor: AppColors.white,
                                  size: 16.sp,
                                  /* fontWeight: FontWeight.normal,
                                  width: 100.w, */
                                ),
                                dialogElevatedButton(
                                    color: AppColors.white,
                                    borderColor: AppColors.appBarColor,
                                    text: AppStrings.no,
                                    onPressed: (() {
                                      Navigator.pop(context);
                                    }),
                                    size: 16.sp,
                                    textColor: AppColors.appBarColor
                                    /* fontWeight: FontWeight.normal,
                                  width: 100.w, */
                                    ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ));

  static Future addTime(
      {required context,
      required timeController,
      required dateController,
      required List<int>? days,
      required List timerController}) async {
    List medicineTime = [];
    var cubit = BlocProvider.of<MedicationReminderCubit>(context);
    if (cubit.medicineTime == 'شهريا') {
      debugPrint('days func $days');
      medicineTime += [
        MedicineTimes(
                time: timeController.text,
                days: days,
                month: dateController.text)
            .toMap()
      ];
    } else if (cubit.medicineTime == 'اسبوعيا') {
      medicineTime = [
        MedicineTimes(
                time: timeController.text,
                days: days,
                month: dateController.text)
            .toMap()
      ];
    } else {
      for (int i = 0; i < cubit.index; i++) {
        var times = [
          MedicineTimes(
                  time: timerController[i].text,
                  days: days,
                  month: dateController.text)
              .toMap()
        ];
        medicineTime += times;
      }
    }
    return medicineTime;
    // debugPrint('controller ${timerController[0].text}');
  }

   checkConnectivity() async {
    return await Connectivity().checkConnectivity();
  }
}

dialogElevatedButton({
  required dynamic onPressed,
  required String text,
  dynamic size,
  Color? color,
  Color? textColor,
  Color borderColor = Colors.transparent,
}) =>
    ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 5,
            backgroundColor: color,
            side: BorderSide(color: borderColor)),
        onPressed: onPressed,
        child: CustomText(
          text: text,
          size: size,
          color: textColor,
        ));
