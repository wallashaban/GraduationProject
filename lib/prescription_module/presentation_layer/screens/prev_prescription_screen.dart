// ignore_for_file: unused_local_variable, unnecessary_string_interpolations

import 'package:graduation_project/core/utils/exports.dart';
import 'package:graduation_project/prescription_module/presentation_layer/screens/new_prescription_screen.dart';

import '../../../authentication_module/presentaion_layer/widgets/cutom_circular.dart';
import '../../../medical_tests_module/presentation_layer/widgets/tests_prescription_block.dart';
import '../widgets/no_data_widget.dart';

class PreviousPrescriptionsScreen extends StatelessWidget {
  const PreviousPrescriptionsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<PrescriptionCubit>(context);
    bool isLoading = false;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const CustomText(
            text: AppStrings.prevRogita,
          ),
          leading: const Icon(
            Icons.arrow_back,
          ),
        ),
        body: BlocConsumer<PrescriptionCubit, PrescriptionState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is GellAllPrescriptionSuccessState) {
                return SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 3.w),
                    child: cubit.allPrescriptions.isEmpty
                        ? const NoDataWidget(
                            text: AppStrings.noRogita,
                            image: AppImages.prescribtionImage,
                            textButton: AppStrings.addNewrRgeta,
                            screen: AppRoutes.newPrescriptionScreen,
                          )
                        : Column(
                            children: [
                              ListView.builder(
                                //todo الليست بتفضى فبيطلع اكسبشن حليه بقي🙂
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return TestsPrescriptionBlock(
                                    prescriptionModel:
                                        cubit.allPrescriptions[index],
                                    isPrescription: true,
                                  );
                                },
                                itemCount: cubit.allPrescriptions.length,
                              ),
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.all(20.0.r),
                                  child: CustomButton(
                                    text: AppStrings.addNewrRgeta,
                                    onPressed: () {
                                      var pres = PresParameters(
                                        isEdit: false,
                                      );
                                      AppConstants.navigateTo(
                                        arguments: pres,
                                        context: context,
                                        routeName:
                                            AppRoutes.newPrescriptionScreen,
                                      );
                                    },
                                    color: AppColors.textColor,
                                    size: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),
                );
              }
              return const CustomCircularProgress();
            }),
      ),
    );
  }
}
