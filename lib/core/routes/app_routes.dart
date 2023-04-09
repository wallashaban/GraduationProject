
import 'package:graduation_project/core/utils/exports.dart';

import '../../medication_reminder_module/presentation_layer/Screens/add_reminder_screen.dart';
import '../../medication_reminder_module/presentation_layer/Screens/all_previous_medication_reminder_screen.dart';
import '../../medication_reminder_module/presentation_layer/Screens/medication_reminder_screen.dart';
import '../../teeth_develpoment_module/presentation_layer/screens/add_tooth_screen.dart';
import '../../teeth_develpoment_module/presentation_layer/screens/teeth_development_screen.dart';


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
        
       return ResetNewPasswordScreen(code: settings.arguments.toString(),);
      });
    case AppRoutes.resetScreen:
      return MaterialPageRoute(builder: (_) => ResetScreen());
    case AppRoutes.splashScreen:
      return MaterialPageRoute(builder: (_) => const SplashScreen());
    case AppRoutes.checkCodeScreen:
      return MaterialPageRoute(builder: (_) => CheckCodeScreen());
    case AppRoutes.bottomNavbar:
      return MaterialPageRoute(builder: (_) => const BottomNavBarScreen());
    case AppRoutes.healthMedicalRecordScreen:
      return MaterialPageRoute(builder: (_) => const HealthMedicalRecord());  
    case AppRoutes.medicalDetailsScreen:
      return MaterialPageRoute(builder: (_) =>  MedicalDetailsScreen());    
case AppRoutes.addToothScreen:
      return MaterialPageRoute(builder: (_) =>  AddToothScreen());  
      case AppRoutes.teethDwvelopmentScreen:
      return MaterialPageRoute(builder: (_) => const TeethDevelopmentScreen());  
       case AppRoutes.medicationReminderScreen:
      return MaterialPageRoute(builder: (_) => const MedicationReminderScreen());  
             case AppRoutes.addMedicationReminderScreen:
      return MaterialPageRoute(builder: (_) =>  AddReminderScreen());  
         case AppRoutes.allMedicationReminderScreen:
      return MaterialPageRoute(builder: (_) => const AllMedicationReminderScreen());  
    default:
      return MaterialPageRoute(builder: (_) => const SplashScreen());
  }
}
