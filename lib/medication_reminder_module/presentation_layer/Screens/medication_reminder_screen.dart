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
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.darkColor,
              )),
          title: CustomText(
            text: AppStrings.medicationReminder,
            color: AppColors.textColor,
            size: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(40.r),
          child: Column(
            children: [
              SvgPicture.asset(
                AppImages.appointmentImage,
              ),
              // SizedBox(height: MediaQuery.of(context).size.height*0.1,),
              CustomText(
                text: AppStrings.reminderDetails,
                color: AppColors.textColor,
                size: 20.sp,
                fontWeight: FontWeight.bold,
                maxLines: 4,
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  border: Border.all(
                    color: AppColors.textColor,
                    style: BorderStyle.solid,
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    AppConstants.navigateTo(
                      context: context,
                      routeName: AppRoutes.addMedicationReminderScreen,
                    );
                  },
                  child: 
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.appBarColor,
                        child: Icon(
                          Icons.add,
                          color: AppColors.textColor,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      CustomText(
                        text: AppStrings.addReminder,
                        color: AppColors.textColor,
                        size: 20.sp,
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
