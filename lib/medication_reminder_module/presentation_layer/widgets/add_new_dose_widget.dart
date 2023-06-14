
import '../../../core/utils/exports.dart';
import '../controllers/medication_reminder_cubit.dart';
import 'dose_time_widget.dart';

class AddNewDoseWidget extends StatelessWidget {
  final List timerController;
  const AddNewDoseWidget({
    super.key,
    required this.timerController,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<MedicationReminderCubit>(context);
    return Column(
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DoseTimeWidget(
                isDaily: true,
                timeController: timerController[
                    index] /* index==1?timeController1:  timerController[index] */,
              ),
            ],
          ),
          separatorBuilder: (context, index) => SizedBox(
            height: 10.h,
          ),
          itemCount: cubit.index,
        ),
        SizedBox(
          height: 10.h,
        ),
        InkWell(
          onTap: () {
            cubit.addTimer();
            
            cubit.addNewDose();
          },
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColors.appBarColor,
                child: Icon(
                  Icons.add,
                  color: AppColors.white,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              CustomText(
                text: AppStrings.addNewDose,
                color: AppColors.appBarColor,
                size: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
