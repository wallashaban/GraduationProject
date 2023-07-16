import 'package:graduation_project/authentication_module/presentaion_layer/widgets/cutom_circular.dart';
import 'package:graduation_project/medication_reminder_module/presentation_layer/controllers/medication_reminder_cubit.dart';
import 'package:graduation_project/prescription_module/presentation_layer/widgets/no_data_widget.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../core/utils/exports.dart';
import '../../../logger.dart';
import '../widgets/reminder_widget.dart';
import 'no_internet_screen.dart';

class AllMedicationReminderScreen extends StatelessWidget {
  const AllMedicationReminderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    logger.e('error all reminder');
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
            text: AppStrings.reminder,
          ),
        ),
        body: StreamBuilder<Object>(
            stream: InternetConnectionChecker().onStatusChange,
            builder: (context, snapshot) {
              var cubit = BlocProvider.of<MedicationReminderCubit>(context);
              if (cubit.allReminders == null &&
                  snapshot.data == InternetConnectionStatus.disconnected) {
                return const NoInternetScreen();
              } else {
                return BlocConsumer<MedicationReminderCubit, ReminderState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (cubit.allReminders == null) {
                      cubit.getAllReminders();
                      //cubit.getAllDays();
                    }
                    if ((state is GetAllRemindersLoadingState) ||
                        (cubit.allReminders == null)) {
                      return const CustomCircularProgress();
                    } else {
                      return SingleChildScrollView(
                        child: cubit.allReminders != null &&
                                cubit.allReminders!.isEmpty
                            ? const NoDataWidget(
                                text: 'لا يوجد مواعيد مضافه',
                                image: AppImages.noDiseaseImage,
                                textButton: AppStrings.addReminder,
                                screen: AppRoutes.addMedicationReminderScreen,
                              )
                            : cubit.allReminders != null &&
                                    cubit.allReminders!.isNotEmpty
                                ? Padding(
                                    padding: EdgeInsets.only(
                                        left: 24.w,
                                        right: 16.w,
                                        top: 24.h,
                                        bottom: 32.h,
                                        ),
                                    child: Column(
                                      children: [
                                        ListView.builder( 
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: cubit.allReminders!.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return ReminderWidget(
                                              reminder:
                                                  cubit.allReminders![index],
                                            );
                                          },
                                        ),
                                        SizedBox(
                                          height: 40.h,
                                        ),
                                        CustomButton(
                                          text: AppStrings.addNewReminder,
                                          onPressed: () {
                                            AppConstants.navigateTo(
                                              context: context,
                                              routeName: AppRoutes
                                                  .addMedicationReminderScreen,
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  )
                                : const SizedBox(),
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
