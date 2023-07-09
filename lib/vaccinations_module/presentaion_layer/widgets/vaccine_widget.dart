// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_local_variable, unrelated_type_equality_checks, use_build_context_synchronously

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:graduation_project/core/utils/exports.dart';
import '../../domain_layer/entities/vaccination.dart';

class VaccineWidget extends StatelessWidget {
  final Vaccination model;
  const VaccineWidget({
    Key? key,
    required this.model,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<VaccinationsCubit>(context);
    return InkWell(
      onTap: () {
        AppConstants.navigateTo(
          arguments: model,
          context: context,
          routeName: AppRoutes.vaccineDetailsScreen,
        );
      },
      child: Container(
        padding: EdgeInsets.all(10.r),
        margin: EdgeInsets.only(top: 4.h, bottom: 4.h, left: 4.w, right: 4.w),
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
            Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: Row(
                children: [
                  SvgPicture.asset(AppImages.hoknaImage),
                  SizedBox(
                    width: 5.w,
                  ),
                  CustomText(
                      text: '(${model.vaccineAge})  ${AppStrings.month}'),
                  SizedBox(
                    width: 15.w,
                  ),
                  CustomText(text: model.proposedVaccinationDate),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                if (model.important == 1)
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                SizedBox(
                  width: 5.w,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: CustomText(
                    text: model.name,
                    size: 14.sp,
                    fontWeight: FontWeight.w500,
                    maxLines: 3,
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                if (model.status == 0)
                  CustomText(
                    text: 'الحقنه ${model.numberOfSyrings}',
                    color: AppColors.darkGreyColor,
                  ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: 30.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomText(
                      text: model.prevention,
                      size: 12.sp,
                      color: AppColors.darkGreyColor,
                      maxLines: 3,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      if (await AppConstants.checkConnectivity() ==
                          ConnectivityResult.none) {
                        AppConstants.showSnackbar(
                          context: context,
                          content: AppStrings.noInternet,
                        );
                      } else {
                        cubit.attatchVaccination(model.id);
                      }
                    },
                    child: Row(
                      children: [
                        CustomText(
                          text: model.status == 1
                              ? 'تم التطعيم'
                              : 'لم يتم التطعيم',
                          size: 12.sp,
                          color: AppColors.darkGreyColor,
                        ),
                        SizedBox(
                          width: 4.w,
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
                  ),
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
