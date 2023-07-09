// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:graduation_project/core/caching_data/teeth_cach%20.dart';
import 'package:graduation_project/core/utils/exports.dart';
import '../../../medical_details_module/presentation_layer/widgets/dropdown_list_widget.dart';
import '../../../medical_tests_module/presentation_layer/widgets/date_text_form_field.dart';
import '../widgets/teeth_month_widget.dart';

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
      child: WillPopScope(
        onWillPop: () async {
          bool willPPop = true;
          var cubit = BlocProvider.of<TeethDevelopmentCubit>(context);
          cubit.toothName = null;
          return willPPop;
        },
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
            padding: EdgeInsets.only(top: 32.h, left: 32.w, right: 20.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: AppStrings.date,
                    color: AppColors.appBarColor,
                    size: 16.sp,
                    fontWeight: FontWeight.normal,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  const DateTextFormField(),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const TeethMonthWidget(
                            letterText: 'A',
                            monthText: '6:12',
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          const TeethMonthWidget(
                            letterText: 'B',
                            monthText: '9:16',
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          const TeethMonthWidget(
                            letterText: 'C',
                            monthText: '13:19',
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          const TeethMonthWidget(
                            letterText: 'D',
                            monthText: '17:23',
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          const TeethMonthWidget(
                            letterText: 'E',
                            monthText: '23:33',
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                        ],
                      ),
                      SvgPicture.asset(
                        AppImages.allTeethImage,
                        width: 187.w,
                        height: 207.h,
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
                            value: toothParameters.isEdit &&
                                    cubit.toothName == null
                                ? toothParameters.teeth!.teeth
                                : cubit.toothName,
                          ),
                          SizedBox(
                            height: 32.h,
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
