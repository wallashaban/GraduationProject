import 'package:graduation_project/core/utils/exports.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../authentication_module/presentaion_layer/widgets/cutom_circular.dart';
import '../../../medication_reminder_module/presentation_layer/Screens/no_internet_screen.dart';
import '../widgets/vaccine_widget.dart';

class VaccinationScreen extends StatelessWidget {
  const VaccinationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<VaccinationsCubit>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const CustomText(
            text: AppStrings.vaccine,
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                AppConstants.navigateTo(
                  context: context,
                  routeName: AppRoutes.vaccineReminderScreen,
                );
              },
              icon: Icon(
                Icons.notifications,
                size: 24.r,
              ),
            ),
          ],
        ),
        body: StreamBuilder<Object>(
            stream: InternetConnectionChecker().onStatusChange,
            builder: (context, snapshot) {
              if (cubit.allVaccinations == null &&
                  snapshot.data == InternetConnectionStatus.disconnected) {
                return const NoInternetScreen();
              } else {
                return BlocConsumer<VaccinationsCubit, VaccinationsState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (cubit.allVaccinations == null) {
                      cubit.getAllVaccinations();
                    }
                    if (cubit.allVaccinations == null) {
                      return const CustomCircularProgress();
                    } else {
                      return Padding(
                          padding: EdgeInsets.only(
                            top: 20.r,
                            left: 24.w,
                            right: 16.w,
                            bottom: 32.h,
                          ),
                          child: /* cubit.allVaccinations != null
                                      ? */
                              SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 10.0.w),
                                  child: Row(
                                    children: [
                                      CustomText(
                                        text: '${AppStrings.roya}"',
                                        size: 14.sp,
                                      ),
                                      const Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      CustomText(
                                        text: '"${AppStrings.vaccineNote}',
                                        size: 14.sp,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                if (cubit.allVaccinations != null)
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return VaccineWidget(
                                        model: cubit.allVaccinations![index],
                                      );
                                    },
                                    itemCount: cubit.allVaccinations!.length,
                                  ),
                              ],
                            ),
                          )
                          //: const SizedBox(),
                          );
                    }
                  },
                );
              }
            }),
      ),
    );
  }
}
