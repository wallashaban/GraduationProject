// ignore_for_file: unused_local_variable

import 'package:graduation_project/core/utils/exports.dart';

class VaccinationReminderScreen extends StatelessWidget {
  const VaccinationReminderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<VaccinationsCubit>(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const CustomText(
            text: AppStrings.vaccineReminder,
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
        ),
        body: BlocBuilder<VaccinationsCubit, VaccinationsState>(
          builder: (context, state) => Container(
            padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.h),
            margin: EdgeInsets.only(top: 32.h),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[400]!,
                    blurRadius: 2,
                    blurStyle: BlurStyle.outer),
              ],
              color: AppColors.backColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: AppStrings.reminderVaccine,
                  color: AppColors.appBarColor,
                  fontWeight: FontWeight.bold,
                  size: 16.sp,
                ),
                GestureDetector(
                  onTap: () async {
                    debugPrint('${CashHelper.getData(
                      key: 'reminder',
                    )}');
                    await cubit.showMessage(context);
                  },
                  child: Icon(
                    CashHelper.getData(
                                  key: 'reminder',
                                ) ==
                                null ||
                            CashHelper.getData(
                                  key: 'reminder',
                                ) ==
                                true
                        ? Icons.toggle_on
                        : Icons.toggle_off,
                    size: 55.w,
                    color: CashHelper.getData(
                                  key: 'reminder',
                                ) ==
                                null ||
                            CashHelper.getData(
                                  key: 'reminder',
                                ) ==
                                true
                        ? AppColors.appBarColor
                        : AppColors.greyColor.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
