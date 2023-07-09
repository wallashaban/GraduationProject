import '../../../core/utils/exports.dart';

class NormalGrowWidget extends StatelessWidget {
  const NormalGrowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<GrowthCubit>(context);
    return Container(
      padding: EdgeInsets.only(right: 8.w, left: 8.h, top: 8.h, bottom: 8.h),
      decoration: BoxDecoration(
        color: AppColors.backColor,
        borderRadius: BorderRadius.circular(25.r),
        boxShadow: [
          BoxShadow(
              color: Colors.grey[400]!,
              blurRadius: 3,
              blurStyle: BlurStyle.outer),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 24.r,
              ),
              SizedBox(
                width: 8.h,
              ),
              CustomText(
                text: AppStrings.average,
                size: 16.sp,
              ),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            children: [
              SvgPicture.asset(
                AppImages.developImage,
                height: 84.h,
                width: 56.w,
              ),
              SizedBox(
                width: 16.w,
              ),
              Column(
                children: [
                  CustomText(
                    text:
                        '${AppStrings.height}  ${cubit.rangeGrowth!.heightStart} : ${cubit.rangeGrowth!.heightEnd} ${AppStrings.cm}',
                    size: 16.sp,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  CustomText(
                    text:
                        '${AppStrings.weight}  ${cubit.rangeGrowth!.weightStart} : ${cubit.rangeGrowth!.weightEnd} ${AppStrings.kg}',
                    size: 16.sp,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: CustomText(
              text: AppStrings.compare,
              size: 12.sp,
              textAlign: TextAlign.end,
              color: AppColors.appBarColor,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
