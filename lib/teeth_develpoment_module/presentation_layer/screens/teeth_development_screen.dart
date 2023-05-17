// ignore_for_file: must_be_immutable

import 'package:graduation_project/authentication_module/presentaion_layer/widgets/cutom_circular.dart';
import 'package:graduation_project/prescription_module/presentation_layer/widgets/no_data_widget.dart';

import '../../../core/utils/exports.dart';
import '../widgets/teeth_widget.dart';

class TeethDevelopmentScreen extends StatelessWidget {
  TeethDevelopmentScreen({super.key});
  bool isLoading = false;
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
            text: AppStrings.teethDevelopment,
          ),
        ),
        body: BlocConsumer<TeethDevelopmentCubit, TeethDevelopmentState>(
          listener: (context, state) {
            if (state is GellAllTeethLoadingState) {
              isLoading = true;
            } else {
              isLoading = false;
            }
          },
          builder: (context, state) {
            var cubit = BlocProvider.of<TeethDevelopmentCubit>(context);
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 18.0.w),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      isLoading
                          ? const CustomCircularProgress()
                          : cubit.allTeeth.isEmpty
                              ? const NoDataWidget(
                                  text: AppStrings.noRecords,
                                  image: AppImages.developImage,
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: cubit.allTeeth.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    if (cubit.allTeeth.isEmpty) {
                                      return const NoDataWidget(
                                        text: AppStrings.noRecords,
                                        image: AppImages.developImage,
                                      );
                                    }
                                    return TeethWidget(
                                      teeth: cubit.allTeeth[index],
                                    );
                                  },
                                ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      CircleAvatar(
                        backgroundColor: AppColors.appBarColor,
                        radius: 32.r,
                        child: Center(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.brightness_5,
                                  color: AppColors.white,
                                  size: 22.r,
                                ),
                                CustomText(
                                  text: AppStrings.tips,
                                  color: AppColors.white,
                                  size: 9.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CircleAvatar(
                        backgroundColor: AppColors.appBarColor,
                        radius: 32.r,
                        child: IconButton(
                          icon: Icon(
                            Icons.graphic_eq,
                            color: AppColors.white,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Center(
                        child: CustomButton(
                          text: AppStrings.addNewRecord,
                          width: 200.w,
                          color: AppColors.textColor,
                          onPressed: () {
                            AppConstants.navigateTo(
                              context: context,
                              routeName: AppRoutes.addToothScreen,
                            );
                          },
                          size: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ]),
              ),
            );
          },
        ),
      ),
    );
  }
}
