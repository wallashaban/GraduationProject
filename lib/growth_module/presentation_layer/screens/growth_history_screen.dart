import 'package:graduation_project/core/utils/exports.dart';

import '../controllers/growth_cubit.dart';
import '../widgets/growth_history_widget.dart';
import '../widgets/normal_growth_widget.dart';
import 'growth_screen.dart';

class GrowthHistoryScreen extends StatelessWidget {
  const GrowthHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.all(20.0),
            child: BlocBuilder<GrowthCubit, GrowthState>(
              builder: (context, state) {
                var cubit = BlocProvider.of<GrowthCubit>(context);
                return Column(
                  children: [
                    const NormalGrowWidget(),
                    SizedBox(
                      height: 20.h,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cubit.allGrowth.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 15.h,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return GrowthHistoryWidget(
                            growth: cubit.allGrowth[index]);
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
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
                        })
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
