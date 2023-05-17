// ignore_for_file: must_be_immutable

import 'package:graduation_project/core/utils/exports.dart';

import '../../../medical_details_module/presentation_layer/widgets/dropdown_list_widget.dart';
import '../../../medical_tests_module/presentation_layer/widgets/date_text_form_field.dart';

class AddToothScreen extends StatelessWidget {
  AddToothScreen({super.key});
  var dateController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<TeethDevelopmentCubit>(context);
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
                SizedBox(
                  height: 5.h,
                ),
                DateTextFormField(
                  controller: dateController,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      AppImages.monthImage,
                      width: MediaQuery.of(context).size.width * 0.4,
                    ),
                    SvgPicture.asset(
                      AppImages.allTeethImage,
                      width: MediaQuery.of(context).size.width * 0.4,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                BlocConsumer<TeethDevelopmentCubit, TeethDevelopmentState>(
                  listener: (context, state) {
                    if (state is StoreTeethSuccessState) {
                      AppConstants.showSnackbar(
                          context: context, content: cubit.teethDev.message);
                      Future.delayed(const Duration(seconds: 2))
                          .then((value) => AppConstants.navigateTo(
                                context: context,
                                routeName: AppRoutes.teethDwvelopmentScreen,
                              ));
                      cubit.toothName = null;
                      cubit.toothId = null;
                    }
                    if (state is StoreTeethErrorState) {
                      AppConstants.showSnackbar(
                        context: context,
                        content: state.error,
                      );
                    }
                    if (state is StoreTeethLoadingState) {
                      isLoading = true;
                    } else {
                      isLoading = false;
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
                          onChanged: (toothName) {
                            cubit.changeBloodTypeValue(toothName);
                            int index = cubit.teethList.indexOf(toothName);
                            cubit.getToothId(index + 1);
                          },
                          value: cubit.toothName,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        Center(
                          child: CustomButton(
                            text: AppStrings.saveData,
                            color: AppColors.textColor,
                            onPressed: () {
                              cubit.storeTeethDevelopment(
                                TeethParameters(
                                  id: cubit.toothId,
                                  teethName: cubit.toothName,
                                  apperenceDate: dateController.text,
                                ),
                              );
                            },
                            isLoading: isLoading,
                            size: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
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
}
