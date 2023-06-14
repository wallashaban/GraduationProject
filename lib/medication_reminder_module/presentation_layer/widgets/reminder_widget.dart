// ignore_for_file: use_build_context_synchronously

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../../core/utils/exports.dart';

class ReminderWidget extends StatelessWidget {
  final Reminder reminder;
  const ReminderWidget({
    super.key,
    required this.reminder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.backColor,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
              color: Colors.grey[400]!,
              blurRadius: 6,
              blurStyle: BlurStyle.outer),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.alarm,
                color: AppColors.appBarColor,
                size: 18,
              ),
              SizedBox(
                width: 3.w,
              ),
              DottedBorder(
                color: AppColors.appBarColor,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                borderType: BorderType.RRect,
                radius: Radius.circular(10.r),
                child: CustomText(
                  text: reminder.reminderName,
                  color: AppColors.appBarColor,
                  size: 12.sp,
                ),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () async{
                    if (await AppConstants.checkConnectivity() ==
                                ConnectivityResult.none) {
                              AppConstants.showSnackbar(
                                context: context,
                                content: AppStrings.noInternet,
                              );
                            } else {
                      AppConstants.showDialoog(context,
                        id: reminder.id, isReminder: true);
                    }
                  },
                  icon: Icon(
                    Icons.close,
                    color: AppColors.appBarColor,
                  ))
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            decoration: BoxDecoration(
              color: AppColors.appBarColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: CustomText(
              text: reminder.apponitment,
              color: AppColors.darkColor,
              size: 12.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          if (reminder.apponitment == 'اسبوعيا' ||
              reminder.apponitment == 'يوميا')
            Column(
              children: [
                Container(
                  width: reminder.apponitment == 'اسبوعيا'
                      ? reminder.days!.length * 55.w >
                              MediaQuery.of(context).size.width
                          ? double.infinity
                          : reminder.days!.length * 55.w
                      : reminder.times.length * 60.w >
                              MediaQuery.of(context).size.width
                          ? double.infinity
                          : reminder.times.length * 60.w,
                  height: 25.h,
                  //width: MediaQuery.of(context).size.width * 0.6,
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: AppColors.appBarColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: reminder.apponitment == 'اسبوعيا'
                      ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: reminder.days!.length,
                          itemBuilder: (context, index) => SizedBox(
                            width: 55.w,
                            child: CustomText(
                              text:
                                  '${reminder.days![index].day} ${index != reminder.days!.length - 1 ? ',' : ''}',
                              color: AppColors.darkColor,
                              size: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: reminder.times.length,
                          itemBuilder: (context, index) => SizedBox(
                            width: 60.w,
                            child: CustomText(
                              text:
                                  '${reminder.times[index].time.split(' ').first} ${reminder.times[index].time.split(' ').last == 'pm' ? 'م' : 'ص'} ${index != reminder.times.length - 1 ? ',' : ''}',
                              color: AppColors.darkColor,
                              size: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            decoration: BoxDecoration(
              color: AppColors.appBarColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: CustomText(
              text: reminder.apponitment == 'يوميا' ||
                      reminder.apponitment == 'اسبوعيا'
                  ? 'بدايه من  ${reminder.startDate} الى ${reminder.endDate}'
                  : '${reminder.times[0].month}  ,   ${reminder.times[0].time}',
              color: AppColors.darkColor,
              size: 12.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
        ],
      ),
    );
  }
}
