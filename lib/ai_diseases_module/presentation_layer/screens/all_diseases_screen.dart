import 'package:graduation_project/core/caching_data/ai_disease_cach.dart';
import 'package:graduation_project/core/utils/exports.dart';
import '../../../prescription_module/presentation_layer/widgets/no_data_widget.dart';
import '../widgets/all_diseases_widget.dart';

class PreviousDiseasesScreen extends StatelessWidget {
  const PreviousDiseasesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<DiseaseCubit>(context);
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
            text: AppStrings.oldResults,
          ),
        ),
        body: SingleChildScrollView(
          child: BlocConsumer<DiseaseCubit, DiseaseState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: ValueListenableBuilder(
                    valueListenable: Hive.box('diseaseCach').listenable(),
                    builder:
                        (BuildContext context, dynamic value, Widget? child) {
                      List<AiDisease> dataa = [];

                      /* final data = */ value.values.map((e) {
                        if (e.key.split(' ').last.contains(
                            CashHelper.getData(key: 'id').toString())) {
                          dataa += [e];
                        }
                      }).toList();
                      debugPrint('data ${dataa.length}');
                      debugPrint('idd ${CashHelper.getData(key: 'id')}');
                      if (dataa.isEmpty) {
                        return const NoDataWidget(
                          text: AppStrings.noResults,
                          image: AppImages.noDiseaseImage,
                          textButton: AppStrings.addNewDiagnose,
                          screen: AppRoutes.uploadPhotoOfDiseaseScreen,
                        );
                      } else {
                        return Column(
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: dataa.length,
                              itemBuilder: (BuildContext context, int index) {
                                return AllDiseasesWidget(
                                  disease: dataa[index],
                                );
                              },
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            CustomButton(
                              text: AppStrings.addNewDiagnose,
                              onPressed: () {
                                AppConstants.navigateTo(
                                  context: context,
                                  routeName: AppRoutes.medicalDetailsScreen,
                                );
                              },
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                        );
                      }
                    }),
              );
            },
          ),
        ),
      ),
    );
  }
}
