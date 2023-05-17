// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_local_variable, unrelated_type_equality_checks

import 'package:graduation_project/core/utils/exports.dart';
import '../../domain_layer/entities/vaccination.dart';
import '../controllers/vaccinations_cubit.dart';

class VaccineWidget extends StatelessWidget {
  final Vaccination model;
  const VaccineWidget({
    Key? key,
    required this.model,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // bool vaccinatedOrNot=false;
    var cubit = BlocProvider.of<VaccinationsCubit>(context);
    return InkWell(
      onTap: () {
        debugPrint('statement');
        AppConstants.navigateTo(
          arguments: model,
          context: context,
          routeName: AppRoutes.vaccineDetailsScreen,
        );
      },
      child: Container(
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
            /*  Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  /* model.vaccineAge == 0
                      ? '(${model.vaccineAge}) ${AppStrings.whileBorn}'
                      : */
                  '${model.vaccineAge} ${AppStrings.month} ',
                  style: TextStyle(color: AppColors.textColor),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  model
                      .proposedVaccinationDate, //هتتعدل على حسب تاريخ ميلاد الطفل
                  style: TextStyle(color: AppColors.textColor),
                ),
              ],
            ),
          */
            Row(
              children: [
                if (model.important == 1)
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                SizedBox(
                  width: 2.w,
                ),
                Expanded(
                  child: CustomText(
                    text: model.name,
                    size: 14.sp, //??
                    fontWeight: FontWeight.normal,
                    maxLines: 3,
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                CustomText(
                  text: 'الحقنه ${model.numberOfSyrings}',
                  color: AppColors.darkGreyColor,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: 40.r),
              child: Row(
                children: [
                  Expanded(
                    child: CustomText(
                      text: model.prevention,
                      size: 12.sp,
                      color: AppColors.darkGreyColor,
                      maxLines: 3,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      //model.status == 0
                      cubit.attatchVaccination([model.id]);
                      // : cubit.stopOrActiveVaccination(model.id);
                    },
                    child: CustomText(
                      text: model.status == 1 ? 'تم التطعيم' : 'لم يتم التطعيم',
                      size: 12.sp,
                      color: AppColors.darkGreyColor,
                    ),
                  ),
                  //attach api تبع الدوسه هنا لو تم التطعيم
                  IconButton(
                    onPressed: () {
                      //vaccinatedOrNot=true;
                    },
                    icon: const Icon(Icons.check_rounded),
                  )
                ],
              ),
            ),
            // const CustomDivider(),
          ],
        ),
      ),
    );
  }
}
