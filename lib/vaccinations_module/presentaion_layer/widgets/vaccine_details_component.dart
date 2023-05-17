// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:graduation_project/core/utils/exports.dart';
import '../../domain_layer/entities/vaccination.dart';

class VaccineDetailsFirstComponent extends StatelessWidget {
  final Vaccination vaccineDetailsFirstModel;
  const VaccineDetailsFirstComponent({
    Key? key,
    required this.vaccineDetailsFirstModel,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.h, bottom: 5.h, left: 10.w, right: 10.w),
      decoration: BoxDecoration(
        color: AppColors.backColor,
        boxShadow: [
          BoxShadow(
              color: Colors.grey[400]!,
              blurRadius: 5,
              blurStyle: BlurStyle.outer),
        ],
        borderRadius: BorderRadius.circular(
          15.r,
        ),
      ),
      child: Column(
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: vaccineDetailsFirstModel.name,
                size: 14.sp,
                fontWeight: FontWeight.normal,
              ),
              const Spacer(),
              CustomText(
                text: AppStrings.vaccineNon,
                color: AppColors.darkGreyColor,
              ),
              SizedBox(
                height: 5.h,
              ),
              ClipRRect(
                clipBehavior: Clip.none,
                borderRadius: BorderRadius.circular(15.r),
                child: const Icon(
                  Icons.check_box,
                  color: Colors.green,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Text(
                vaccineDetailsFirstModel.proposedVaccinationDate,
                style: TextStyle(color: AppColors.textColor),
              ),
              SizedBox(
                width: 10.w,
              ),
              CustomText(
                text: AppStrings.proposedVaccineTime,
                size: 14.sp,
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            children: [
              CustomText(
                text: AppStrings.vaccineTime,
                color: AppColors.appBarColor,
                size: 12.sp,
              ),
              const Spacer(),
              CustomText(
                text: vaccineDetailsFirstModel.vaccinationDate,
                size: 12.sp,
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            children: [
              CustomText(
                text: AppStrings.reminderDate,
                size: 12.sp,
              ),
              const Spacer(),
              CustomText(
                text: vaccineDetailsFirstModel.vaccinationDate, //?
                size: 12.sp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
/*
Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/Polygon 10.svg',
                    ),
                    Text(
                      AppStrings.aboutVaccine,
                      style: TextStyle(color: AppColors.darkColor),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  sDetailsModel!.name,
                  style: TextStyle(color: AppColors.textColor),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/Polygon 10.svg',
                    ),
                    Text(
                      AppStrings.diseasePrevention,
                      style: TextStyle(color: AppColors.darkColor),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  sDetailsModel!.prevention,
                  style: TextStyle(color: AppColors.textColor),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/Polygon 10.svg',
                    ),
                    Text(
                      AppStrings.vaccineTime,
                      style: TextStyle(color: AppColors.darkColor),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  sDetailsModel!.vaccineAge == "0"
                      ? '(${sDetailsModel!.vaccineAge}) ${AppStrings.whileBorn}'
                      : '${sDetailsModel!.vaccineAge} ${AppStrings.month} ',
                  style: TextStyle(color: AppColors.textColor),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/Polygon 10.svg',
                    ),
                    Text(
                      AppStrings.sideEffects,
                      style: TextStyle(color: AppColors.darkColor),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  sDetailsModel!.vaccinationDate,
                  style: TextStyle(color: AppColors.textColor),
                ),
              ],
            ),
 */