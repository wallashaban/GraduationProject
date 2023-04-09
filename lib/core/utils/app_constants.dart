import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utils/app_colors.dart';

import '../../authentication_module/presentaion_layer/widgets/custom_text.dart';

class AppConstants {
  static const String baseUrl = 'https://baby-health-care.sonicar.tech/api/';
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
  static const String getAllAllergy = 'all-allergies';
  static const String skinDiseases = 'skin-diseases';
  static const String chronicDiseases = 'chronic-diseases';
  static const String geneticDieases = 'genetic-diseases';
  //medical tests
  static const String deleteMedicalTrest = 'delete-medical-test/';
  static const String storeMedicalTest = 'store-medical-test/';
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
      {required BuildContext context, required String routeName,arguments}) {
    Navigator.pushNamed(context, routeName,arguments: arguments);
  }

  static showSnackbar({required BuildContext context,required String content}) => ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(backgroundColor: 
      Colors.transparent,
        content: Stack(
          children: [
            Container(
           // height: 90.h,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: AppColors.textColor,
            borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
              //  const SizedBox(width: 48,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: 'نهار ابوك اسود غلط!!!',color: AppColors.darkColor,fontWeight: FontWeight.bold,size: 20,),
                      CustomText(text: content,color: AppColors.darkColor,fontWeight: FontWeight.bold,size: 20,),
                    ],
                  ),
                ),
              ],
            )),
            /* Positioned(
              bottom: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                ),
                child: SvgPicture.asset('assets/images/Group 1066.svg'))), */
          ],
        ),
      behavior: SnackBarBehavior.floating,
      elevation: 0.0,
      ));
}
