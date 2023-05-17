// ignore_for_file: use_build_context_synchronously

import 'package:graduation_project/core/utils/exports.dart';

import '../widgets/block_widget.dart';

class HealthMedicalRecord extends StatelessWidget {
  const HealthMedicalRecord({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back,
              )),
          title: CustomText(
            text: AppStrings.healthMedicalRecord,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlockWidget(
                        isMedicalHealthRecord: true,
                        onTap: () {
                          AppConstants.navigateTo(
                            context: context,
                            routeName: AppRoutes.previousTestScreen,
                          );
                        },
                        text: AppStrings.tests,
                        image: AppImages.testsImage,
                      ),
                      BlockWidget(
                        isMedicalHealthRecord: true,
                        onTap: () {
                          AppConstants.navigateTo(
                            context: context,
                            routeName: AppRoutes.medicalDetailsScreen,
                          );
                        },
                        text: AppStrings.medicalDetails,
                        image: AppImages.medicalDetailsImage,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlockWidget(
                        isMedicalHealthRecord: true,
                        onTap: () {},
                        text: AppStrings.growth,
                        image: AppImages.growthImage,
                      ),
                      BlockWidget(
                        isMedicalHealthRecord: true,
                        onTap: () async {
                          var cubit =
                              BlocProvider.of<TeethDevelopmentCubit>(context);
                          await cubit.getAllteeth();
                          if (cubit.allTeeth.isEmpty) {
                            AppConstants.navigateTo(
                              context: context,
                              routeName: AppRoutes.addToothScreen,
                            );
                          } else {
                            AppConstants.navigateTo(
                              context: context,
                              routeName: AppRoutes.teethDwvelopmentScreen,
                            );
                          }
                        },
                        text: AppStrings.teeth,
                        image: AppImages.teethImage,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlockWidget(
                        isMedicalHealthRecord: true,
                        onTap: () {
                          
                          AppConstants.navigateTo(
                            context: context,
                            routeName: AppRoutes.previousPrescriptionScreen,
                          );
                        },
                        text: AppStrings.prescribtion,
                        image: AppImages.prescribtionImage,
                      ),
                      BlockWidget(
                        isMedicalHealthRecord: true,
                        onTap: () {},
                        text: AppStrings.development,
                        image: AppImages.developmentImage,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
