import 'package:graduation_project/ai_diseases_module/domain_layer/entities/disease.dart';

import '../../../core/utils/exports.dart';

class AllDiseasesWidget extends StatelessWidget {
  final AiDisease disease;
  const AllDiseasesWidget({
    super.key,
    required this.disease,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: AppColors.backColor,
        borderRadius: BorderRadius.circular(
          15.r,
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.grey[400]!,
              blurRadius: 5,
              blurStyle: BlurStyle.outer),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: disease.createdAt,
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              SvgPicture.asset(
                AppImages.cameraImage,
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                children: [
                  CustomText(
                    text: disease.disease == 'allergy'
                        ? AppStrings.allergyDisease
                        : disease.disease == 'bacteria'
                            ? AppStrings.bacteria
                            : AppStrings.allergyDisease,
                  ),
                  /*  SizedBox(
                    height: 5.h,
                  ), */
                  CustomText(
                    text: disease.prediction,
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete,
                  color: AppColors.appBarColor,
                  size: 27.r,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
