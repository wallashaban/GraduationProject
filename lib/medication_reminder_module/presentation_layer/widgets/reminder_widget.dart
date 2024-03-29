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
      margin: EdgeInsets.symmetric(
        vertical: 8.h,
      ),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.backColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
              color: Colors.grey[400]!,
              blurRadius: 2,
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
                size: 24.r,
              ),
              SizedBox(
                width: 8.w,
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
                  onPressed: () async {
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
                    Icons.cancel_outlined,
                    color: AppColors.appBarColor,
                    size: 24.r,
                  ))
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomText(
            text: reminder.apponitment,
            color: AppColors.appBarColor,
            size: 12.sp,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(
            height: 8.h,
          ),
          if (reminder.apponitment == 'اسبوعيا' ||
              reminder.apponitment == 'يوميا')
            Column(
              children: [
                reminder.apponitment == 'اسبوعيا'
                    ? SizedBox(
                        height: 16.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: reminder.days!.length,
                          itemBuilder: (context, index) => SizedBox(
                            width: 55.w,
                            child: CustomText(
                              text:
                                  '${reminder.days![index].day} ${index != reminder.days!.length - 1 ? ',' : ''}',
                              color: AppColors.appBarColor,
                              size: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                    : SizedBox(
                        height: 16.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: reminder.times.length,
                          itemBuilder: (context, index) => SizedBox(
                            width: 60.w,
                            child: CustomText(
                              text:
                                  '${reminder.times[index].time.split(' ').first} ${reminder.times[index].time.split(' ').last == 'pm' ? 'م' : 'ص'} ${index != reminder.times.length - 1 ? ',' : ''}',
                              color: AppColors.appBarColor,
                              size: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          CustomText(
            text: reminder.apponitment == 'يوميا' ||
                    reminder.apponitment == 'اسبوعيا'
                ? 'بدايه من  ${reminder.startDate} الى ${reminder.endDate}'
                : '${reminder.times[0].month}  ,   ${reminder.times[0].time}',
            color: AppColors.appBarColor,
            size: 12.sp,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(
            height: 5.h,
          ),
        ],
      ),
    );
  }
}
