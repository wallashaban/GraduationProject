// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../core/utils/exports.dart';
import '../../domain_layer/entity/all_tips.dart';

class AllTipsScreen extends StatelessWidget {
  final AllTips allTips;
  const AllTipsScreen({
    Key? key,
    required this.allTips,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // var cubit = BlocProvider.of<DevelopmentFlowCubit>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
              )),
          title: const CustomText(
            text: AppStrings.tips,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                  margin: EdgeInsets.symmetric(vertical: 23.h),
                  decoration: BoxDecoration(
                    color: AppColors.backColor,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[400]!,
                          blurRadius: 2,
                          blurStyle: BlurStyle.outer),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: AppStrings.behave,
                        size: 14.sp,
                        fontWeight: FontWeight.w600,
                        maxLines: 3,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: allTips.unanweredQuestions.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 10.r,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              CustomText(
                                  size: 14.sp,
                                  maxLines: 3,
                                  text: allTips
                                      .unanweredQuestions[index].question),
                            ],
                          );
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomText(
                        text: '${AppStrings.tips} :',
                        size: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomText(
                        text: allTips.description,
                        maxLines: 50,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                CustomButton(
                  text: AppStrings.done,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
