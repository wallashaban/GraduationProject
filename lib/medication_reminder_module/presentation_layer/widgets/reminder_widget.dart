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
              ),
              SizedBox(
                width: 3.w,
              ),
              DottedBorder(
                color: AppColors.appBarColor,
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                borderType: BorderType.RRect,
                radius: Radius.circular(10.r),
                child: CustomText(
                  text: reminder.reminderName,
                  color: AppColors.appBarColor,
                  size: 12.sp,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          CustomText(
            text: reminder.apponitment,
            color: AppColors.appBarColor,
            size: 12.sp,
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: 'بدايه من  ${reminder.startDate} الى ${reminder.endDate}',
                color: AppColors.appBarColor,
                size: 12.sp,
              ),
              IconButton(
                  onPressed: () {
                    AppConstants.showDialoog(context,id: reminder.id,isReminder:true);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: AppColors.appBarColor,
                  ))
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
        ],
      ),
    );
  }
}
