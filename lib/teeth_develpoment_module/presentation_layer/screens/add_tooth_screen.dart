// ignore_for_file: must_be_immutable

import 'package:graduation_project/core/utils/exports.dart';

import '../../../medical_details_module/presentation_layer/widgets/dropdown_list_widget.dart';

class AddToothScreen extends StatelessWidget {
  AddToothScreen({super.key});
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<TeethDevelopmentCubit>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.darkColor,
              )),
          title: CustomText(
            text: AppStrings.teethDevelopment,
            color: AppColors.textColor,
            size: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: AppStrings.date,
                  color: AppColors.textColor,
                  size: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextFormField(
                    controller: dateController,
                    decoration: InputDecoration(
                      hintText: '01/01/2023',
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.date_range),
                        color: AppColors.textColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      AppImages.allTeethImage,
                      width: MediaQuery.of(context).size.width * 0.4,
                    ),
                    SvgPicture.asset(
                      AppImages.monthImage,
                      width: MediaQuery.of(context).size.width * 0.4,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                  Padding(
                    padding:  EdgeInsets.only(right: 20.w),
                    child: CustomText(
                                  text: AppStrings.toothName,
                                  color: AppColors.textColor,
                                  size: 20.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                  ),SizedBox(height: 10.h,),

                BlocBuilder<TeethDevelopmentCubit, TeethDevelopmentState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        CustomDropdownList(
                          items: cubit.teethList
                              .map(AppConstants.buildMenuItem)
                              .toList(),
                          onChanged: (toothName) {
                            cubit.changeBloodTypeValue(toothName);
                          },
                          value: cubit.toothName,
                        ),
                                                SizedBox(
                          height: 25.h,
                        ),
                        Center(
                          child: CustomButton(text: AppStrings.saveData,
                          color: AppColors.textColor,onPressed: (){},size: 20.sp,fontWeight: FontWeight.bold,),
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
