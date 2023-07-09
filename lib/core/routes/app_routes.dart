import 'package:graduation_project/authentication_module/presentaion_layer/screens/on_boarding_screen.dart';
import 'package:graduation_project/development_flow_module/domain_layer/entity/all_tips.dart';
import 'package:graduation_project/settings_notifications_module/presentation_layer/screens/contact_us_screen.dart';
import 'package:graduation_project/settings_notifications_module/presentation_layer/screens/notifications_screen.dart';
import 'package:graduation_project/vaccinations_module/domain_layer/entities/vaccination.dart';

import '../../ai_diseases_module/presentation_layer/screens/advices_page_view.dart';
import '../../ai_diseases_module/presentation_layer/screens/all_diseases_screen.dart';
import '../../ai_diseases_module/presentation_layer/screens/home_ai_disease_screen.dart';
import '../../ai_diseases_module/presentation_layer/screens/uplaod_photo_disease_screen.dart';
import '../../development_flow_module/presentation_layer/screens/all_tips_screen.dart';
import '../../development_flow_module/presentation_layer/screens/history_development_flow_screen.dart';
import '../../development_flow_module/presentation_layer/screens/subject_with_questions_screen.dart';
import '../../growth_module/presentation_layer/screens/growth_history_screen.dart';
import '../../growth_module/presentation_layer/screens/growth_screen.dart';
import '../../medical_tests_module/presentation_layer/screens/new_test_screen.dart';
import '../../medical_tests_module/presentation_layer/screens/previous_tests_screen.dart';
import '../../medication_reminder_module/presentation_layer/Screens/add_reminder_screen.dart';
import '../../medication_reminder_module/presentation_layer/Screens/all_previous_medication_reminder_screen.dart';
import '../../medication_reminder_module/presentation_layer/Screens/medication_reminder_screen.dart';
import '../../medication_reminder_module/presentation_layer/Screens/no_internet_screen.dart';
import '../../prescription_module/presentation_layer/screens/new_prescription_screen.dart';
import '../../prescription_module/presentation_layer/screens/prev_prescription_screen.dart';
import '../../report_module/presentation_layer/screens/reports_screen.dart';
import '../../settings_notifications_module/presentation_layer/screens/about_screen.dart';
import '../../settings_notifications_module/presentation_layer/screens/update_user_data_screen.dart';
import '../../teeth_develpoment_module/presentation_layer/screens/add_tooth_screen.dart';
import '../../teeth_develpoment_module/presentation_layer/screens/teeth_development_screen.dart';
import '../../teeth_develpoment_module/presentation_layer/screens/tips_screen.dart';
import '../../vaccinations_module/presentaion_layer/screens/vaccination_screen.dart';
import '../../vaccinations_module/presentaion_layer/screens/vaccine_details.dart';
import '../../vaccinations_module/presentaion_layer/screens/vaccine_reminder.dart';
import '../utils/exports.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.login:
      return MaterialPageRoute(builder: (_) => LoginScreen());
    case AppRoutes.signUp:
      return MaterialPageRoute(builder: (_) => SignUpScreen());
    case AppRoutes.enterEmailScreen:
      return MaterialPageRoute(builder: (_) => EnterEmailScreen());
    case AppRoutes.successPasswordScreen:
      return MaterialPageRoute(builder: (_) => const SuccessPasswordScreen());
    case AppRoutes.resetNewPasswordScreen:
      return MaterialPageRoute(builder: (_) {
        return ResetNewPasswordScreen(
          code: settings.arguments.toString(),
        );
      });
    case AppRoutes.tipsScreen:
      return MaterialPageRoute(builder: (_) {
        return const TipsScreen();
      });
    case AppRoutes.splashScreen:
      return MaterialPageRoute(builder: (_) => const SplashScreen());
    case AppRoutes.checkCodeScreen:
      return MaterialPageRoute(
          builder: (_) =>
              CheckCodeScreen(email: settings.arguments.toString()));
    case AppRoutes.bottomNavbar:
      return MaterialPageRoute(builder: (_) => const BottomNavBarScreen());
    case AppRoutes.healthMedicalRecordScreen:
      return MaterialPageRoute(builder: (_) => const HealthMedicalRecord());
    case AppRoutes.medicalDetailsScreen:
      return MaterialPageRoute(builder: (_) => MedicalDetailsScreen());
    case AppRoutes.addToothScreen:
      return MaterialPageRoute(
          builder: (_) => AddToothScreen(
                toothParameters: settings.arguments as ToothParameters,
              ));
    case AppRoutes.teethDwvelopmentScreen:
      return MaterialPageRoute(builder: (_) => const TeethDevelopmentScreen());
    case AppRoutes.medicationReminderScreen:
      return MaterialPageRoute(
          builder: (_) => const MedicationReminderScreen());
    case AppRoutes.addMedicationReminderScreen:
      return MaterialPageRoute(builder: (_) => AddReminderScreen());
    case AppRoutes.allMedicationReminderScreen:
      return MaterialPageRoute(
          builder: (_) => const AllMedicationReminderScreen());
    case AppRoutes.previousTestScreen:
      return MaterialPageRoute(builder: (_) => const PreviousTestsScreen());
    case AppRoutes.newTestScreen:
      return MaterialPageRoute(
          builder: (_) => NewTestScreen(
                testsParameters: settings.arguments as TestsParameters,
              ));
    case AppRoutes.previousPrescriptionScreen:
      return MaterialPageRoute(
          builder: (_) => const PreviousPrescriptionsScreen());
    case AppRoutes.newPrescriptionScreen:
      return MaterialPageRoute(
          builder: (_) => NewPrescriptionScreen(
              presParameters: settings.arguments as PresParameters));
    case AppRoutes.contactUsScreen:
      return MaterialPageRoute(builder: (_) => ContactUsScreen());
    case AppRoutes.updateUserDateScreen:
      return MaterialPageRoute(builder: (_) => UpdateUserDataScreen());
    case AppRoutes.aboutScreen:
      return MaterialPageRoute(builder: (_) => const AboutScreen());
    case AppRoutes.notificationsScreen:
      return MaterialPageRoute(builder: (_) => const NotificationsScreen());
    case AppRoutes.homeAiDiseaseScreen:
      return MaterialPageRoute(builder: (_) => const HomeAiDiseaseScreen());
    case AppRoutes.advicesPageViewScreen:
      return MaterialPageRoute(
          builder: (_) => AdvicesPageViewScreen(
                field: settings.arguments as String,
              ));
    case AppRoutes.vaccineScreen:
      return MaterialPageRoute(builder: (_) => const VaccinationScreen());
    case AppRoutes.vaccineDetailsScreen:
      return MaterialPageRoute(
          builder: (_) => VaccinationDetailsScreen(
                vaccineModel: settings.arguments as Vaccination,
              ));
    case AppRoutes.vaccineReminderScreen:
      return MaterialPageRoute(
          builder: (_) => const VaccinationReminderScreen());
    case AppRoutes.reportScreen:
      return MaterialPageRoute(builder: (_) => const ReportsScreen());
    case AppRoutes.uploadPhotoOfDiseaseScreen:
      return MaterialPageRoute(
          builder: (_) => UploadPhotoOfDiseaseScreen(
                field: settings.arguments as String,
              ));
    case AppRoutes.previousDiseasesScreen:
      return MaterialPageRoute(builder: (_) => const PreviousDiseasesScreen());
    case AppRoutes.growthScreen:
      return MaterialPageRoute(
          builder: (_) => GrowthScreen(
                growParameters: settings.arguments as GrowParameters,
              ));
    case AppRoutes.growthHistoryScreen:
      return MaterialPageRoute(builder: (_) => const GrowthHistoryScreen());
    /*  case AppRoutes.developmentFlowScreen:
      return MaterialPageRoute(builder: (_) =>  DevelopmentFlowWidget()); */
    case AppRoutes.allTipsScreen:
      return MaterialPageRoute(
          builder: (_) => AllTipsScreen(
                allTips: settings.arguments as AllTips,
              ));
    case AppRoutes.historyDevelopmentFlowScreen:
      return MaterialPageRoute(
          builder: (_) => const HistoryDevelopmentFlowScreen());
    case AppRoutes.onboardingScreen:
      return MaterialPageRoute(builder: (_) => const OnboardingScreen());
    case AppRoutes.noInternetScreen:
      return MaterialPageRoute(builder: (_) => const NoInternetScreen());
    case AppRoutes.subjectWithQuestionScreen:
      return MaterialPageRoute(
          builder: (_) => SubjectWithQuestionsScreen(
                developmentParameters:
                    settings.arguments as DevelopmentParameters,
              ));
    default:
      return MaterialPageRoute(builder: (_) => const SplashScreen());
  }
}
