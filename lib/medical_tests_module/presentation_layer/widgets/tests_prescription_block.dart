import 'package:graduation_project/core/caching_data/pres_cach.dart';
import 'package:graduation_project/core/caching_data/test_cach.dart';
import 'package:graduation_project/medical_tests_module/presentation_layer/widgets/show_test_rogita_widget.dart';
import 'package:graduation_project/medical_tests_module/presentation_layer/widgets/text_icon_button.dart';
import 'package:graduation_project/prescription_module/presentation_layer/screens/new_prescription_screen.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/utils/exports.dart';
import '../../../prescription_module/domain_layer/entities/prescribtion.dart';
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
        margin: const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
        decoration: BoxDecoration(
          color: AppColors.backColor,
          boxShadow: [
            BoxShadow(
                color: Colors.grey[400]!,
                blurRadius: 5,
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
              padding: EdgeInsets.only(top: 10.0, right: 10.r, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: isPrescription
                        ? AppStrings.rogitaDate
                        : AppStrings.testDate,
                    // color: AppColors.textColor,
                    size: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomText(
                    text: isPrescription
                        ? prescriptionModel!.date
                        : model!.labDate, //listtttttttttttt
                    // color: AppColors.white,
                    size: 14.sp,
                    fontWeight: FontWeight.normal,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              // width: MediaQuery.of(context).size.width * 0.4,
                              child: Row(
                                children: [
                                  CustomText(
                                    text: isPrescription
                                        ? '${AppStrings.note} : '
                                        : '${AppStrings.testType} : ',
                                    // color: AppColors.darkColor,
                                    size: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  Expanded(
                                    child: CustomText(
                                      size: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      text: isPrescription
                                          ? prescriptionModel!.note ??
                                              'لا توجد ملاحظات لعرضها'
                                          : model!.type,
                                      // color: AppColors.textColor,
                                      maxLines: 3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            if (!isPrescription)
                              Row(
                                children: [
                                  CustomText(
                                    text: '${AppStrings.labName} : ',
                                    // color: AppColors.darkColor,
                                    size: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  CustomText(
                                    text: model!.labName,
                                    //color: AppColors.textColor,
                                    size: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                      /* SizedBox(
                        width: 90.w,
                      ), */
                      SvgPicture.asset(
                        AppImages.cameraImage,
                        height: 75.h,
                        width: 75.w,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: AppColors.appBarColor, //???????????????
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextIconButton(
                    icon: Icons.telegram_sharp,
                    text: AppStrings.share,
                    onPressed: () async {
                      isPrescription
                          ? Share.share(prescriptionModel!.file)
                          : Share.share(model!.labFile);
                    },
                  ),
                  CustomTextIconButton(
                    icon: Icons.edit_square,
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
                    icon: Icons.delete_forever_sharp,
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
