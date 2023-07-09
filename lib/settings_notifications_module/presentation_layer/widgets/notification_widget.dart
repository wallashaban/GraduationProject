import 'package:graduation_project/settings_notifications_module/domain_layer/entities/notifications.dart';

import '../../../core/utils/exports.dart';
import '../../../medical_details_module/presentation_layer/widgets/block_widget.dart';

class NotificationWidget extends StatelessWidget {
  final Notifications notifications;
  const NotificationWidget({
    super.key,
    required this.notifications,
  });
  @override
  Widget build(BuildContext context) {
    List<String> date = notifications.createdAt.split(' ');
    return Container(
      height: 100.h,
      margin: EdgeInsets.only(bottom: 12.h, top: 4.h, left: 4.w, right: 4.w),
      decoration: BoxDecoration(
          color: AppColors.backColor,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
                color: Colors.grey[400]!,
                blurRadius: 2,
                blurStyle: BlurStyle.outer),
          ]),
      child: Row(
        children: [
          BlockWidget(
            textSize: 12.sp,
            width: 100.w,
            isMedicalHealthRecord: false,
            height: 100.h,
            imageWidth: 90.w,
            imageHeight: 55.h,
            image: notifications.type == 'الادوية'
                ? AppImages.reminderImage
                : notifications.type == 'التطعيمات'
                    ? AppImages.vaccinationImage
                    : notifications.type == 'التطور'
                        ? AppImages.developmentImage
                        : notifications.type == 'الاسنان'
                            ? AppImages.teethImage
                            : AppImages.developImage,
            onTap: () {},
            text: notifications.type,
          ),
          SizedBox(
            width: 16.w,
          ),
          Container(
            padding: EdgeInsets.only(top: 16.h),
            width: MediaQuery.of(context).size.width * 0.3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: notifications.title,
                  size: 12.sp,
                ),
                Expanded(
                  child: CustomText(
                    text: notifications.body,
                    size: 10.sp,
                    fontWeight: FontWeight.normal,
                    maxLines: 5,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 16.h, bottom: 0),
            child: Align(
              alignment: Alignment.topLeft,
              child: CustomText(
                text: '${date[1]} ${date[2] == 'pm' ? 'م' : 'ص'}',
                size: 11.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.appBarColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
