import 'package:dotted_border/dotted_border.dart';

import '../../../core/utils/exports.dart';

class MedicationReminderScreen extends StatelessWidget {
  const MedicationReminderScreen({super.key});

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
          title: const CustomText(
            text: AppStrings.medicationReminder,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.r, vertical: 60.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SvgPicture.asset(
                  AppImages.appointmentImage,
                  height: 200.h,
                  width: 194.w,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              CustomText(
                text: AppStrings.reminderDetails,
                size: 16.sp,
                maxLines: 4,
              ),
              SizedBox(
                height: 15.h,
              ),
              CustomText(
                text: AppStrings.reminderDetails2,
                size: 14.sp,
                maxLines: 4,
                color: AppColors.greyColor,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              DottedBorder(
                radius: Radius.circular(20.r),
                borderType: BorderType.RRect,
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
                color: AppColors.textColor,
                child: InkWell(
                  onTap: () {
                    CashHelper.saveData(key: 'reminder', value: true);
                    AppConstants.navigateTo(
                      context: context,
                      routeName: AppRoutes.addMedicationReminderScreen,
                    );
                  },
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.appBarColor,
                        radius: 16.r,
                        child: Icon(
                          Icons.add,
                          color: AppColors.white,
                          size: 32.r,
                        ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      CustomText(
                        text: AppStrings.addReminder,
                        color: AppColors.appBarColor,
                        size: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
