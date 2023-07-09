// ignore_for_file: sized_box_for_whitespace

import 'package:graduation_project/core/utils/exports.dart';

Future showMessageComponent({context, required bool isOn}) async {
  return await showDialog(
    context: context,
    builder: (ctx) => Stack(
      alignment: Alignment.topCenter,
      children: [
        AlertDialog(
          clipBehavior: Clip.none,
          shadowColor: Colors.grey[400]!,
          elevation: 123,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: AppColors.appBarColor),
              borderRadius: BorderRadius.circular(20.r)),
          content: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 12.h,
                ),
                CustomText(
                  text: isOn
                      ? AppStrings.textMessage
                      : AppStrings.textMessageOff,
                  size: 14.sp,
                  maxLines: 7,
                  textAlign: TextAlign.end,
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Align(
                alignment: Alignment.bottomLeft,
                child: CustomText(
                  text: AppStrings.iKnow,
                  color: AppColors.appBarColor,
                  size: 16.sp,
                  //textAlign: TextAlign.start,
                ),
              ),
            ),
          ],
        ),
        if (isOn)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.31,
            child: SvgPicture.asset(
              AppImages.alarmImage,
            ),
          ),
      ],
    ),
  );
}
