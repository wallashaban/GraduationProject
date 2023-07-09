import 'package:graduation_project/authentication_module/presentaion_layer/widgets/cutom_circular.dart';
import 'package:graduation_project/core/caching_data/growth_cach.dart';
import 'package:graduation_project/core/utils/exports.dart';

import '../../../prescription_module/presentation_layer/widgets/no_data_widget.dart';
import '../widgets/growth_history_widget.dart';
import '../widgets/normal_growth_widget.dart';
import 'growth_screen.dart';

class GrowthHistoryScreen extends StatelessWidget {
  const GrowthHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GrowParameters growParameters = GrowParameters(
      isEdit: false,
    );
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const CustomText(
            text: AppStrings.growthHistory,
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 32.h, left: 24.w, right: 16.w),
            child: BlocBuilder<GrowthCubit, GrowthState>(
              builder: (context, state) {
                var cubit = BlocProvider.of<GrowthCubit>(context);
                if (cubit.rangeGrowth == null) {
                  cubit.getRangeGrowth();
                }
                return Column(
                  children: [
                    if (cubit.rangeGrowth != null) const NormalGrowWidget(),
                    SizedBox(
                      height: 8.h,
                    ),
                    ValueListenableBuilder(
                      valueListenable: Hive.box('growthCach').listenable(),
                      builder: (context, value, child) {
                        List<GrowrhCach> dataa = [];

                        /* final data =  */ value.values.map((e) {
                          if (e.key.split(' ').last.contains(
                              CashHelper.getData(key: 'id').toString())) {
                            dataa += [e];
                          }
                        }).toList();

                        if (dataa.isEmpty && cubit.rangeGrowth == null) {
                          return NoDataWidget(
                            text: AppStrings.noRecords,
                            image: AppImages.developImage,
                            textButton: AppStrings.addNewRecord,
                            screen: AppRoutes.growthScreen,
                            arguments: growParameters,
                          );
                        } else {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: dataa.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GrowthHistoryWidget(
                                growth: dataa[index],
                              );
                            },
                          );
                        }
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    if (/* Hive.box('growthCach').isEmpty && */
                    cubit.rangeGrowth != null)
                      CustomButton(
                          text: AppStrings.addNewRecord,
                          onPressed: () {
                            GrowParameters parameters = GrowParameters(
                              isEdit: false,
                            );
                            AppConstants.navigateTo(
                              arguments: parameters,
                              context: context,
                              routeName: AppRoutes.growthScreen,
                            );
                          }),
                    SizedBox(
                      height: 32.h,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
