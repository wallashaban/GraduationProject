import '../../../core/utils/exports.dart';
import '../../domain_layer/entities/teeth.dart';

class TeethWidget extends StatelessWidget {
  final Teeth teeth;
  const TeethWidget({
    super.key,
    required this.teeth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 15.h,
        horizontal: 10.w,
      ),
      margin: EdgeInsets.symmetric(
        vertical: 10.h,
        horizontal: 10.w,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey[400]!,
              blurRadius: 4,
              blurStyle: BlurStyle.outer),
        ],
        color: AppColors.backColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: teeth.apperenceDate,
            size: 16.sp,
            fontWeight: FontWeight.normal,
          ),
          SizedBox(
            height: 5.h,
          ),
          CustomText(
            text: '${AppStrings.age} : ${teeth.ageInMonths}${AppStrings.month}',
            size: 14.sp,
            fontWeight: FontWeight.normal,
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            children: [
              Icon(
                Icons.telegram,
                color: AppColors.appBarColor,
              ),
              CustomText(
                text: ' ${teeth.teethName}',
                size: 14.sp,
                fontWeight: FontWeight.normal,
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    AppConstants.showDialoog(context, isTooth: true,id: teeth.id);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: AppColors.appBarColor,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
