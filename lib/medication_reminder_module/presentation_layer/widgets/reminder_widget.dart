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
                  onPressed: () {
                    AppConstants.showDialoog(context,
                        id: reminder.id, isReminder: true);
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
                      ? reminder.times.length * 55.w >
                              MediaQuery.of(context).size.width
                          ? double.infinity
                          : reminder.times.length * 55.w
                      : reminder.times.length * 70.w >
                              MediaQuery.of(context).size.width
                          ? double.infinity
                          : reminder.times.length * 70.w,
                  height: 25.h,
                  //width: MediaQuery.of(context).size.width * 0.6,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: AppColors.appBarColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: reminder.apponitment == 'اسبوعيا'
                        ? reminder.days!.length
                        : reminder.times.length,
                    itemBuilder: (context, index) => SizedBox(
                      width: reminder.apponitment == 'اسبوعيا' ? 50.w : 70.w,
                      child: CustomText(
                        text: reminder.apponitment == 'اسبوعيا'
                            ? '${reminder.days![index].day}    ${index != reminder.days!.length - 1 ? ' و' : ''}'
                            : '${reminder.times[index].time}   ${index != reminder.times.length - 1 ? ' و' : ''}',
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
                  : '${reminder.times[0].month}     ${reminder.times[0].time}',
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
