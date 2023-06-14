// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:graduation_project/core/caching_data/teeth_cach%20.dart';
import 'package:graduation_project/core/utils/exports.dart';
import 'package:graduation_project/teeth_develpoment_module/domain_layer/entities/teeth.dart';

import '../../../medical_details_module/presentation_layer/widgets/dropdown_list_widget.dart';
import '../../../medical_tests_module/presentation_layer/widgets/date_text_form_field.dart';

class ToothParameters {
  TeethCach? teeth;
  bool isEdit;
  ToothParameters({
    this.teeth,
    required this.isEdit,
  });
}

class AddToothScreen extends StatelessWidget {
  final ToothParameters toothParameters;
  AddToothScreen({super.key, required this.toothParameters});
  var dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<TeethDevelopmentCubit>(context);
    if (toothParameters.isEdit) {
      dateController.text = toothParameters.teeth!.appearanceDate;
    }
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
            text: AppStrings.teethDevelopment,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10.r, bottom: 10.r),
                  child: CustomText(
                    text: AppStrings.date,
                    color: AppColors.appBarColor,
                    size: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const DateTextFormField(),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      AppImages.monthImage,
                      width: 85.w,
                      height: 126.h,
                    ),
                    SvgPicture.asset(
                      AppImages.allTeethImage,
                      width: 205.w,
                      height: 241.h,
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                BlocConsumer<TeethDevelopmentCubit, TeethDevelopmentState>(
                  listener: (context, state) {
                    if ((state is StoreTeethSuccessState ||
                        (state is UpdateTeethSuccessState))) {
                      AppConstants.showSnackbar(
                          context: context, content: AppStrings.saveSuccess);

                      cubit.toothName = null;
                      cubit.toothId = null;
                    }
                    if (state is StoreTeethErrorState) {
                      AppConstants.showSnackbar(
                        context: context,
                        content: state.error,
                      );
                    }
                    if (state is UpdateTeethErrorState) {
                      AppConstants.showSnackbar(
                        context: context,
                        content: state.error,
                      );
                    }
                  },
                  builder: (context, state) {
                    return Column(
                      children: [
                        CustomDropdownList(
                          hint: AppStrings.toothName,
                          items: cubit.teethList
                              .map(AppConstants.buildMenuItem)
                              .toList(),
                          onChanged: (toothName) async {
                            debugPrint(
                                'statement ${cubit.medicalTeeth[0].name.split('').first} ${cubit.toothId}');
                            cubit.changeToothNameValue(toothName);
                            await getId(
                              context,
                              toothName,
                            );
                            //  int index = cubit.allTeeth.indexOf(toothName);
                          },
                          value:
                              toothParameters.isEdit && cubit.toothName == null
                                  ? toothParameters.teeth!.teeth
                                  : cubit.toothName,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        if ((state is StoreTeethLoadingState) ||
                            (state is UpdateTeethLoadingState))
                          CustomButton(
                            isLoading: true,
                          ),
                        if ((state is! StoreTeethLoadingState) &&
                            (state is! UpdateTeethLoadingState))
                          CustomButton(
                            text: AppStrings.saveData,
                            onPressed: () async {
                              if (await AppConstants.checkConnectivity() ==
                                  ConnectivityResult.none) {
                                AppConstants.showSnackbar(
                                  context: context,
                                  content: AppStrings.noInternet,
                                );
                              } else {
                                if (cubit.medicalTeeth.isEmpty) {
                                  await cubit.getMedicalTeeth().then(
                                        (value) async => await getId(
                                          context,
                                          cubit.toothName ??
                                              toothParameters.teeth!.teeth,
                                        ),
                                      );
                                }
                                if (toothParameters.isEdit) {
                                  cubit.updateTooth(
                                    TeethParameters(
                                      id: toothParameters.teeth!.id,
                                      toothId: cubit.toothId,
                                      teethName: cubit.toothName,
                                      apperenceDate: cubit.date,
                                    ),
                                  );
                                } else {
                                  cubit.storeTeethDevelopment(
                                    TeethParameters(
                                      toothId: cubit.toothId,
                                      teethName: cubit.toothName,
                                      apperenceDate: cubit.date,
                                    ),
                                  );
                                }
                              }
                            },
                          ),
                      ],
                    );
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future getId(context, String toothName) async {
    BlocProvider.of<TeethDevelopmentCubit>(context)
        .medicalTeeth
        .forEach((element) async {
      debugPrint('tooth  ${element.name.split('').first}');
      if (element.name.contains(toothName)) {
        await BlocProvider.of<TeethDevelopmentCubit>(context)
            .getToothId(element.id);
      }
    });
  }
}
