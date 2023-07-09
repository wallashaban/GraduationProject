import 'package:graduation_project/core/caching_data/teeth_cach%20.dart';

import '../../../core/utils/exports.dart';

class TeethWidget extends StatelessWidget {
  final TeethCach teeth;
  const TeethWidget({
    super.key,
    required this.teeth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 8.h,
        horizontal: 8.w,
      ),
      margin: EdgeInsets.only(
        left: 16.w,
        right: 8.w,
        top: 8.h,
        bottom: 8.h,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey[400]!,
              blurRadius: 2,
              blurStyle: BlurStyle.outer),
        ],
        color: AppColors.backColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: teeth.appearanceDate,
            size: 16.sp,
            fontWeight: FontWeight.normal,
          ),
          SizedBox(
            height: 8.h,
          ),
          CustomText(
            text:
                '${AppStrings.age} :  ${teeth.ageInMonth} ${AppStrings.month} , ${teeth.ageInYears} ${AppStrings.year}',
            size: 14.sp,
            fontWeight: FontWeight.normal,
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            children: [
              SvgPicture.asset(
                AppImages.toothImage,
                width: 18.w,
                height: 21.4.h,
                fit: BoxFit.fill,
              ),
              SizedBox(
                width: 8.w,
              ),
              CustomText(
                text: ' ${teeth.teeth}',
                size: 14.sp,
                fontWeight: FontWeight.normal,
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    AppConstants.showDialoog(context,
                        isTooth: true, id: teeth.id);
                  },
                  icon: Icon(
                    Icons.delete_outlined,
                    color: AppColors.appBarColor,
                    size: 30,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
