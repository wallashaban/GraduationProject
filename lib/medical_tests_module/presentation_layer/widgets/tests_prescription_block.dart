import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/core/caching_data/pres_cach.dart';
import 'package:graduation_project/core/caching_data/test_cach.dart';
import 'package:graduation_project/medical_tests_module/presentation_layer/widgets/show_test_rogita_widget.dart';
import 'package:graduation_project/medical_tests_module/presentation_layer/widgets/text_icon_button.dart';
import 'package:graduation_project/prescription_module/presentation_layer/screens/new_prescription_screen.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/utils/exports.dart';
import '../screens/new_test_screen.dart';

class TestsPrescriptionBlock extends StatelessWidget {
  final TestCach? model;
  final PresCach? prescriptionModel;
  final bool isPrescription;
  const TestsPrescriptionBlock({
    super.key,
    this.model,
    this.prescriptionModel,
    required this.isPrescription,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ShowTestRogita(
              isPrescription: isPrescription,
              medicalTests: model,
              prescription: prescriptionModel,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 12.h, bottom: 12, left: 24.w, right: 16.w),
        decoration: BoxDecoration(
          color: AppColors.backColor,
          boxShadow: [
            BoxShadow(
                color: Colors.grey[400]!,
                blurRadius: 3,
                blurStyle: BlurStyle.outer),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.r),
            topRight: Radius.circular(15.r),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 16.0.h, bottom: 10.h, right: 10.w, left: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: isPrescription
                            ? AppStrings.rogitaDate
                            : AppStrings.testDate,
                        // color: AppColors.textColor,
                        size: 14.sp,
                        fontWeight: FontWeight.normal,
                      ),
                      CustomText(
                        text: isPrescription
                            ? prescriptionModel!.date
                            : model!.labDate, //listtttttttttttt
                        // color: AppColors.white,
                        size: 14.sp,
                        fontWeight: FontWeight.normal,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: isPrescription
                                      ? '${AppStrings.note} : '
                                      : '${AppStrings.testType} : ',
                                  // color: AppColors.darkColor,
                                  size: 14.sp,
                                  fontWeight: FontWeight.normal,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: CustomText(
                                    size: 14.sp,
                                    fontWeight: FontWeight.normal,
                                    text: isPrescription
                                        ? prescriptionModel!.note ??
                                            'لا توجد ملاحظات لعرضها'
                                        : model!.type,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            if (!isPrescription)
                              Row(
                                children: [
                                  CustomText(
                                    text: '${AppStrings.labName} : ',
                                    // color: AppColors.darkColor,
                                    size: 14.sp,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  CustomText(
                                    text: model!.labName,
                                    //color: AppColors.textColor,
                                    size: 14.sp,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    AppImages.cameraImage,
                    height: 64.h,
                    width: 65.w,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              color: AppColors.appBarColor, //???????????????
              height: 32.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextIconButton(
                    icon: Icons.share,
                    text: AppStrings.share,
                    onPressed: () async {
                      isPrescription
                          ? Share.share(prescriptionModel!.file)
                          : Share.share(model!.labFile);
                    },
                  ),
                  CustomTextIconButton(
                    icon: FontAwesomeIcons.edit,
                    text: AppStrings.edit,
                    onPressed: () {
                      TestsParameters testsParameters = TestsParameters(
                        isEdit: true,
                        medicalTests: model,
                      );
                      PresParameters parameters = PresParameters(
                        isEdit: true,
                        presccription: prescriptionModel,
                      );
                      isPrescription
                          ? AppConstants.navigateTo(
                              arguments: parameters,
                              context: context,
                              routeName: AppRoutes.newPrescriptionScreen,
                            )
                          : AppConstants.navigateTo(
                              arguments: testsParameters,
                              context: context,
                              routeName: AppRoutes.newTestScreen,
                            );
                    },
                  ),
                  CustomTextIconButton(
                    icon: Icons.delete_outline_rounded,
                    text: AppStrings.delete,
                    onPressed: () {
                      isPrescription
                          ? AppConstants.showDialoog(
                              context,
                              isPrescription: isPrescription,
                              presId: prescriptionModel!.id,
                            )
                          : AppConstants.showDialoog(
                              context,
                              isPrescription: isPrescription,
                              id: model!.id,
                            );
                      // isPrescription?BlocProvider.of<PrescriptionCubit>(context)
                      //       .deletePrescription(prescriptionModel!.id):
                      //   BlocProvider.of<MedicalTestsCubit>(context)
                      //       .deleteMedicalTest(model!.id);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
