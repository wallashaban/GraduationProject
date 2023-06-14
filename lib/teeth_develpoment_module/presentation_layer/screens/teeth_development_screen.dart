// ignore_for_file: must_be_immutable

import 'package:graduation_project/core/caching_data/teeth_cach%20.dart';
import 'package:graduation_project/prescription_module/presentation_layer/widgets/no_data_widget.dart';
import 'package:graduation_project/teeth_develpoment_module/presentation_layer/screens/add_tooth_screen.dart';

import '../../../core/utils/exports.dart';
import '../widgets/teeth_widget.dart';

class TeethDevelopmentScreen extends StatelessWidget {
  const TeethDevelopmentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    ToothParameters toothParameters = ToothParameters(
      isEdit: false,
    );
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back,
              )),
          title: CustomText(
            text: AppStrings.teethDevelopment,
          ),
        ),
        body: BlocConsumer<TeethDevelopmentCubit, TeethDevelopmentState>(
          listener: (context, state) {},
          builder: (context, state) {
            debugPrint('id ${CashHelper.getData(key: 'id')}');
            //  List<TeethCach> dataa = [];

            //  var cubit = BlocProvider.of<TeethDevelopmentCubit>(context);
            // if (cubit.allTeeth == null) return const CustomCircularProgress();
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10.h,
                  horizontal: 20.w,
                ),
                child: ValueListenableBuilder(
                  valueListenable: Hive.box('teethCach').listenable(),
                  builder: (context, value, child) {
                    List<TeethCach> dataa = [];
                    /* final data = */ value.values.map((e) {
                      debugPrint(
                          'statement in  ${BlocProvider.of<AuthenticationCubit>(context).userData!.id.toString()}');
                      if (e.key
                          .split(' ')
                          .last
                          .contains(CashHelper.getData(key: 'id').toString())) {
                        dataa += [e];
                      }
                    }).toList();
                    debugPrint('data ${dataa.length}');
                    debugPrint('idd ${CashHelper.getData(key: 'id')}');
                    if (dataa.isEmpty) {
                      return NoDataWidget(
                        text: AppStrings.noRecords,
                        image: AppImages.noTeethImage,
                        textButton: AppStrings.addNewRecord,
                        screen: AppRoutes.addToothScreen,
                        arguments: toothParameters,
                      );
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: dataa.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  ToothParameters toothParameters =
                                      ToothParameters(
                                          isEdit: true, teeth: dataa[index]);
                                  AppConstants.navigateTo(
                                    context: context,
                                    routeName: AppRoutes.addToothScreen,
                                    arguments: toothParameters,
                                  );
                                },
                                child: TeethWidget(
                                  teeth: dataa[index],
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          CircleAvatar(
                            backgroundColor: AppColors.appBarColor,
                            radius: 26.r,
                            child: Center(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.light_mode_rounded,
                                      color: AppColors.white,
                                      size: 22.r,
                                    ),
                                    CustomText(
                                      text: AppStrings.tips,
                                      color: AppColors.white,
                                      size: 9.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          CustomButton(
                            text: AppStrings.addNewRecord,
                            onPressed: () {
                              AppConstants.navigateTo(
                                arguments: ToothParameters(isEdit: false),
                                context: context,
                                routeName: AppRoutes.addToothScreen,
                              );
                            },
                          )
                        ],
                      );
                    }
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
