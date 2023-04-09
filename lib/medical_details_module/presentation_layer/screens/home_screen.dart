
import 'package:graduation_project/core/utils/exports.dart';


import '../widgets/block_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                    onTap: () {},
                    text: AppStrings.diseases,
                    image: AppImages.diseaseImage,
                  ),
                  BlockWidget(
                    onTap: () {},
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
                          routeName: AppRoutes.medicationReminderScreen);
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
