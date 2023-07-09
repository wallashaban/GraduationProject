// ignore_for_file: unused_local_variable, unnecessary_string_interpolations

import 'package:graduation_project/core/caching_data/pres_cach.dart';
import 'package:graduation_project/core/utils/exports.dart';
import 'package:graduation_project/prescription_module/presentation_layer/screens/new_prescription_screen.dart';

import '../../../authentication_module/presentaion_layer/widgets/cutom_circular.dart';
import '../../../medical_tests_module/presentation_layer/widgets/tests_prescription_block.dart';
import '../widgets/no_data_widget.dart';

class PreviousPrescriptionsScreen extends StatelessWidget {
  const PreviousPrescriptionsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<PrescriptionCubit>(context);
    var pres = PresParameters(
      isEdit: false,
    );
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const CustomText(
            text: AppStrings.prevRogita,
          ),
          leading: const Icon(
            Icons.arrow_back,
          ),
        ),
        body: BlocConsumer<PrescriptionCubit, PrescriptionState>(
            listener: (context, state) {},
            builder: (context, state) {
              return SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.h, horizontal: 3.w),
                  child: ValueListenableBuilder(
                    valueListenable: Hive.box('presCach').listenable(),
                    builder: (context, value, child) {
                      List<PresCach> dataa = [];
                      String s = 'a 34';
                      debugPrint('statement ${s.split(' ').first}');
                      /*  final data = */ value.values.map((e) {
                        if (e.key.split(' ').last.contains(
                            CashHelper.getData(key: 'id').toString())) {
                          dataa += [e];
                        }
                      }).toList();
                      debugPrint('data ${dataa.length}');
                      debugPrint('idd ${CashHelper.getData(key: 'id')}');
                      if (dataa.isEmpty) {
                        return NoDataWidget(
                          text: AppStrings.noRogita,
                          image: AppImages.noRogitaImage,
                          textButton: AppStrings.addNewrRgeta,
                          screen: AppRoutes.newPrescriptionScreen,
                          arguments: pres,
                        );
                      } else {
                        return Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: Column(
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: dataa.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () {
                                      PresParameters presParameters =
                                          PresParameters(
                                              isEdit: true,
                                              presccription: dataa[index]);
                                      AppConstants.navigateTo(
                                        context: context,
                                        routeName: AppRoutes.addToothScreen,
                                        arguments: presParameters,
                                      );
                                    },
                                    child: TestsPrescriptionBlock(
                                      prescriptionModel: dataa[index],
                                      isPrescription: true,
                                    ),
                                  );
                                },
                              ),
                              Padding(
                                padding: EdgeInsets.all(20.0.r),
                                child: CustomButton(
                                  text: AppStrings.addNewrRgeta,
                                  onPressed: () {
                                    AppConstants.navigateTo(
                                      arguments: pres,
                                      context: context,
                                      routeName:
                                          AppRoutes.newPrescriptionScreen,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ),
              );
            }),
      ),
    );
  }
}
