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
    return InkWell(
      onTap: () {},
      child: Container(
        height: 100.h,
        margin: EdgeInsets.only(bottom: 10.h, top: 5.h, left: 5.w, right: 5.w),
        decoration: BoxDecoration(
            color: AppColors.backColor,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[400]!,
                  blurRadius: 5,
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
                  ? AppImages.medicalImage
                  : notifications.type == 'التطعيمات'
                      ? AppImages.vaccinationImage
                      : notifications.type == 'التطور'
                          ? AppImages.developImage
                          : notifications.type == 'الاسنان'
                              ? AppImages.teethImage
                              : AppImages.developImage,
              onTap: () {},
              text: notifications.type,
            ),
            SizedBox(
              width: 15.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: notifications.title,
                  size: 12.sp,
                ),
                CustomText(
                  text: notifications.body,
                  size: 10.sp,
                  fontWeight: FontWeight.normal,
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.all(20.w),
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
      ),
    );
  }
}
