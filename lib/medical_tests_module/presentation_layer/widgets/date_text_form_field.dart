// ignore_for_file: prefer_typing_uninitialized_variables

import '../../../core/utils/exports.dart';

class DateTextFormField extends StatelessWidget {
  const DateTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeethDevelopmentCubit, TeethDevelopmentState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            AppConstants.showDate(context).then(
              (value) => BlocProvider.of<TeethDevelopmentCubit>(context)
                  .changeDate(value),
            );
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.3,
            padding: EdgeInsets.symmetric(vertical: 5.h),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: AppColors.appBarColor, width: 1.5.w))),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  color: AppColors.appBarColor,
                  size: 24.r,
                ),
                SizedBox(
                  width: 6.w,
                ),
                CustomText(
                  size: 14.sp,
                  text: BlocProvider.of<TeethDevelopmentCubit>(context).date,
                  color: AppColors.appBarColor,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
