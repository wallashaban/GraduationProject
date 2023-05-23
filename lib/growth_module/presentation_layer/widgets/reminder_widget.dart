// ignore_for_file: sized_box_for_whitespace

import 'package:graduation_project/core/utils/exports.dart';

Future showReminder(context) async {
  return await showDialog(
    context: context,
    builder: (ctx) => Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: AlertDialog(
          shape: RoundedRectangleBorder(
              side: BorderSide(color: AppColors.appBarColor),
              borderRadius: BorderRadius.circular(20.r)),
          title: CustomText(
            text: AppStrings.alarm,
            color: AppColors.appBarColor,
            size: 14.sp,
            fontWeight: FontWeight.bold,
          ),
          content: SizedBox(
            height: 50.0,
            width: double.infinity,
            child: Column(
              children: [
                CustomText(
                  text: AppStrings.growthNote1,
                  size: 14.sp,
                  fontWeight: FontWeight.bold,
                  maxLines: 2,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: CustomText(
                      text: AppStrings.check,
                      color: AppColors.appBarColor,
                      size: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
