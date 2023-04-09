import 'package:graduation_project/teeth_develpoment_module/domain_layer/entities/teeth.dart';

import '../../../core/utils/exports.dart';

class TeethWidget extends StatelessWidget {
  final Teeth teeth;
  const TeethWidget({super.key,required this.teeth,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 10.w,),
      //margin: EdgeInsets.symmetric(vertical: 5.h,horizontal: 10.w,),
      decoration: BoxDecoration(
        color: AppColors.appBarColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            CustomText(
                text: teeth.apperenceDate,
                color: AppColors.textColor,
                size: 20.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 5.h,),
                CustomText(
                text: '${AppStrings.age} : ${teeth.ageInMonths}${AppStrings.month}',
                color: AppColors.textColor,
                size: 20.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 5.h,),
              Row(
                children: [
                  Icon(Icons.telegram,color: AppColors.textColor,),
                   CustomText(
                text: ' ${teeth.teethName}',
                color: AppColors.textColor,
                size: 20.sp,
                fontWeight: FontWeight.bold,
              ),
                ],
              ),
        ],
      ),
    );
  }
}
