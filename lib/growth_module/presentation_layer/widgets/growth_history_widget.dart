import '../../../core/utils/exports.dart';
import '../../domain_layer/entities/growth.dart';

class GrowthHistoryWidget extends StatelessWidget {
  final Growth growth;
  const GrowthHistoryWidget({super.key, required this.growth});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: AppColors.backColor,
        borderRadius: BorderRadius.circular(25.r),
        boxShadow: [
          BoxShadow(
              color: Colors.grey[400]!,
              blurRadius: 10,
              blurStyle: BlurStyle.outer),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.date_range_sharp,
                color: AppColors.appBarColor,
              ),
              CustomText(
                text: '   ${growth.measureDate}',
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: '${AppStrings.height}  ',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      )),
                  TextSpan(
                    text: '${growth.height} ',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.appBarColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                      text: ' ${AppStrings.cm} ',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      )),
                ]),
              ),
              SizedBox(
                width: 40.w,
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: '${AppStrings.weight}  ',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      )),
                  TextSpan(
                    text: '${growth.weight} ',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.appBarColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                      text: ' ${AppStrings.kg} ',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      )),
                ]),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              CustomText(
                text: growth.weightStatus,
                fontWeight: FontWeight.bold,
                size: 13.sp,
                color: growth.weightStatus.contains('طبيعي')
                    ? AppColors.greenColor
                    : AppColors.redColor,
              ),
              SizedBox(
                width: 60.h,
              ),
              CustomText(
                size: 13.sp,
                text: growth.heightStatus,
                fontWeight: FontWeight.bold,
                color: growth.heightStatus.contains('طبيعية')
                    ? AppColors.greenColor
                    : AppColors.redColor,
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}
