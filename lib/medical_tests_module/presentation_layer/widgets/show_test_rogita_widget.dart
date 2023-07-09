import 'package:graduation_project/core/caching_data/pres_cach.dart';
import 'package:graduation_project/core/caching_data/test_cach.dart';

import '../../../core/utils/exports.dart';

class ShowTestRogita extends StatelessWidget {
  final PresCach? prescription;
  final TestCach? medicalTests;
  final bool isPrescription;
  const ShowTestRogita(
      {super.key,
      required this.isPrescription,
      this.medicalTests,
      this.prescription});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: isPrescription ? AppStrings.showRogita : AppStrings.showTest,
          ),
          leading: const Icon(
            Icons.arrow_back,
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 32.h, left: 32.w, right: 24.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Image(
                    image: NetworkImage(
                      isPrescription
                          ? prescription!.file
                          : medicalTests!.labFile,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  children: [
                    CustomText(
                      text:
                          '${isPrescription ? AppStrings.rogitaDate : AppStrings.testDate} : ',
                      color: AppColors.appBarColor,
                      size: 16.sp,
                      fontWeight: FontWeight.normal,
                    ),
                    SizedBox(
                      width: 8.h,
                    ),
                    CustomText(
                      text: isPrescription
                          ? prescription!.date
                          : medicalTests!.labDate, //listtttttttttttt
                      size: 14.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: isPrescription
                          ? '${AppStrings.note} :   '
                          : '${AppStrings.testType} :  ',
                      color: AppColors.appBarColor,
                      size: 16.sp,
                      fontWeight: FontWeight.normal,
                    ),
                    SizedBox(
                      width: 8.h,
                    ),
                    Expanded(
                      child: CustomText(
                        size: 14.sp,
                        fontWeight: FontWeight.normal,
                        text: isPrescription
                            ? prescription!.note ?? 'لا توجد ملاحظات لعرضها'
                            : medicalTests!.type,
                        maxLines: 6,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                if (!isPrescription)
                  Row(
                    children: [
                      CustomText(
                        text: '${AppStrings.labName} : ',
                        color: AppColors.appBarColor,
                        size: 16.sp,
                        fontWeight: FontWeight.normal,
                      ),
                      SizedBox(
                        width: 8.h,
                      ),
                      CustomText(
                        text: medicalTests!.labName,
                        size: 14.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    ],
                  ),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
