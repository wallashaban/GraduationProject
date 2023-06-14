// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:graduation_project/core/utils/exports.dart';
import '../../domain_layer/entities/vaccination.dart';

class VaccineDetailsFirstComponent extends StatelessWidget {
  final Vaccination model;
  const VaccineDetailsFirstComponent({
    Key? key,
    required this.model,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<VaccinationsCubit>(context);
    return Container(
      padding: EdgeInsets.all(10.r),
      margin: const EdgeInsets.only(top: 10, bottom: 5, left: 5, right: 5),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey[400]!,
              blurRadius: 5,
              blurStyle: BlurStyle.outer),
        ],
        color: AppColors.backColor,
        borderRadius: BorderRadius.all(
          Radius.circular(15.r),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomText(
                  text: model.name,
                  size: 14.sp,
                  maxLines: 4,
                  fontWeight: FontWeight.normal,
                ),
              ),
              TextButton(
                onPressed: () {
                  cubit.attatchVaccination(model.id);
                },
                child: CustomText(
                  text: model.status == 1 ? 'تم التطعيم' : 'لم يتم التطعيم',
                  size: 12.sp,
                  color: AppColors.darkGreyColor,
                ),
              ),
              CircleAvatar(
                  radius: 10.r,
                  backgroundColor: model.status == 0
                      ? AppColors.greyColor
                      : AppColors.appBarColor,
                  child: Icon(
                    Icons.check_rounded,
                    color: AppColors.white,
                    size: 16.r,
                  )),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            children: [
              CustomText(
                text: model.proposedVaccinationDate,
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
                text: AppStrings.vaccinedate,
                color: AppColors.appBarColor,
                size: 12.sp,
                fontWeight: FontWeight.bold,
              ),
              const Spacer(),
              CustomText(
                text: model.vaccinationDate,
                size: 12.sp,
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          /*  Row(
            children: [
              CustomText(
                text: AppStrings.reminderDate,
                size: 12.sp,
              ),
              const Spacer(),
              CustomText(
                text: model.vaccinationDate, //?
                size: 12.sp,
              ),
            ],
          ), */
        ],
      ),
    );
  }
}
