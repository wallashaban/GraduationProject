// ignore_for_file: use_build_context_synchronously

import 'package:graduation_project/core/utils/exports.dart';

import '../widgets/block_widget.dart';

class HealthMedicalRecord extends StatelessWidget {
  const HealthMedicalRecord({super.key});

  @override
  Widget build(BuildContext context) {
    bool isExistMedical = false;
    bool isExistTest = false;
    bool isExistPres = false;
    bool isExistGrowth = false;
    bool isExistTeeth = false;

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
                        onTap: () async {
                          if (CashHelper.getData(
                                  key:
                                      'testSaved ${CashHelper.getData(key: 'id')}') ==
                              null) {
                            await AppConstants.userExistTestOrNot(
                                    isExistTest, context)
                                .then((value) {
                              AppConstants.navigateTo(
                                context: context,
                                routeName: AppRoutes.previousTestScreen,
                              );
                            });
                          } else {
                            AppConstants.navigateTo(
                              context: context,
                              routeName: AppRoutes.previousTestScreen,
                            );
                          }
                        },
                        text: AppStrings.tests,
                        image: AppImages.testsImage,
                      ),
                      BlockWidget(
                        isMedicalHealthRecord: true,
                        onTap: () async {
                          if (CashHelper.getData(
                                  key:
                                      'medicalDetailsSaved ${CashHelper.getData(key: 'id')}') ==
                              null) {
                            await AppConstants.userExistMedicalOrNot(
                                    isExistMedical, context)
                                .then((value) {
                              AppConstants.navigateTo(
                                context: context,
                                routeName: AppRoutes.medicalDetailsScreen,
                              );
                            });
                          } else {
                            AppConstants.navigateTo(
                              context: context,
                              routeName: AppRoutes.medicalDetailsScreen,
                            );
                          }
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
                        onTap: () async {
                          if (CashHelper.getData(
                                  key:
                                      'growthSaved ${CashHelper.getData(key: 'id')}') ==
                              null) {
                            await AppConstants.userExistGrowthOrNot(
                                    isExistGrowth, context)
                                .then((value) {
                              AppConstants.navigateTo(
                                context: context,
                                routeName: AppRoutes.growthHistoryScreen,
                              );
                            });
                          } else {
                            AppConstants.navigateTo(
                              context: context,
                              routeName: AppRoutes.growthHistoryScreen,
                            );
                          }
                        },
                        imageHeight: 80.h,
                        imageWidth: 50.w,
                        text: AppStrings.growth,
                        image: AppImages.developImage,
                      ),
                      BlockWidget(
                        isMedicalHealthRecord: true,
                        onTap: () async {
                          if (CashHelper.getData(
                                  key:
                                      'teethSaved ${CashHelper.getData(key: 'id')}') ==
                              null) {
                            await AppConstants.userExistTeethOrNot(
                                    isExistTeeth, context)
                                .then((value) {
                              AppConstants.navigateTo(
                                context: context,
                                routeName: AppRoutes.teethDwvelopmentScreen,
                              );
                            });
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
                        onTap: () async {
                          if (CashHelper.getData(
                                  key:
                                      'presSaved ${CashHelper.getData(key: 'id')}') ==
                              null) {
                            await AppConstants.userExistPresOrNot(
                                    isExistPres, context)
                                .then((value) {
                              AppConstants.navigateTo(
                                context: context,
                                routeName: AppRoutes.previousPrescriptionScreen,
                              );
                            });
                          } else {
                            AppConstants.navigateTo(
                              context: context,
                              routeName: AppRoutes.previousPrescriptionScreen,
                            );
                          }
                        },
                        text: AppStrings.prescribtion,
                        image: AppImages.prescribtionImage,
                      ),
                      BlockWidget(
                        isMedicalHealthRecord: true,
                        onTap: () {
                          AppConstants.navigateTo(
                            context: context,
                            routeName: AppRoutes.historyDevelopmentFlowScreen,
                          );
                        },
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
