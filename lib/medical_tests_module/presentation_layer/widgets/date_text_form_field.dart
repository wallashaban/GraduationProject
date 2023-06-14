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
                    bottom:
                        BorderSide(color: AppColors.appBarColor, width: 3))),
            child: Row(
              children: [
                Icon(
                  Icons.date_range,
                  color: AppColors.appBarColor,
                ),
                SizedBox(
                  width: 5.w,
                ),
                CustomText(
                  size: 14.sp,
                  text: BlocProvider.of<TeethDevelopmentCubit>(context).date,
                  color: AppColors.appBarColor,
                ),
              ],
            ),
          ),
          /*      TextField(
            controller: controller,
            enabled: false,
            decoration: InputDecoration(
              border: UnderlineInputBorder(
                borderSide: BorderSide(width: 3, color: AppColors.appBarColor),
              ),
              hintStyle: TextStyle(
                  color: AppColors.textColor, fontWeight: FontWeight.bold),
              hintText: '01/01/2023',
              prefixIcon: IconButton(
                onPressed: () async {
                  controller.text = await AppConstants.showDate(context);
                },
                icon: const Icon(Icons.date_range),
                color: AppColors.textColor,
              ),
            ),
          ),
        */
        );
      },
    );
  }
}
