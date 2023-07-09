import 'package:graduation_project/development_flow_module/presentation_layer/controllers/development_flow_cubit.dart';
import 'package:graduation_project/development_flow_module/presentation_layer/screens/subject_with_questions_screen.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../authentication_module/presentaion_layer/widgets/cutom_circular.dart';
import '../../../core/utils/exports.dart';
import '../../../medication_reminder_module/presentation_layer/Screens/no_internet_screen.dart';
import '../../../prescription_module/presentation_layer/widgets/no_data_widget.dart';
import '../controllers/development_flow_state.dart';
import '../widgets/history_development_widget.dart';

class HistoryDevelopmentFlowScreen extends StatelessWidget {
  const HistoryDevelopmentFlowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<DevelopmentFlowCubit>(context);
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
          title: CustomText(
            text: AppStrings.development,
          ),
        ),
        body: StreamBuilder<Object>(
            stream: InternetConnectionChecker().onStatusChange,
            builder: (context, snapshot) {
              if (cubit.allTips == null &&
                  snapshot.data == InternetConnectionStatus.disconnected) {
                return const NoInternetScreen();
              } else {
                return BlocConsumer<DevelopmentFlowCubit, DevelopmentFlowState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (cubit.allTips == null) {
                      cubit.toGetAllTips();
                    }
                    if ((state is AllTipsLoadingState) ||
                        (cubit.allTips == null)) {
                      return const CustomCircularProgress();
                    } else if (cubit.allTips!.isEmpty) {
                      return NoDataWidget(
                        text: AppStrings.noTests,
                        image: AppImages.noDevelopmentImage,
                        textButton: AppStrings.addNewRecord,
                        screen: AppRoutes.subjectWithQuestionScreen,
                        arguments: DevelopmentParameters(isEdit: false),
                      );
                    }
                    return SingleChildScrollView(
                      child: Padding(
                        padding:
                            EdgeInsets.only(top: 32.h, left: 24.w, right: 16.w),
                        child: Column(
                          children: [
                            ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: cubit.allTips!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return HistoryDevelopmentWidget(
                                    allTips: cubit.allTips![index]);
                              },
                            ),
                            SizedBox(
                              height: 32.h,
                            ),
                            CustomButton(
                              text: AppStrings.addNewRecord,
                              onPressed: () {
                                DevelopmentParameters parameters =
                                    DevelopmentParameters(
                                  isEdit: false,
                                );
                                AppConstants.navigateTo(
                                  context: context,
                                  routeName:
                                      AppRoutes.subjectWithQuestionScreen,
                                  arguments: parameters,
                                );
                              },
                            ),
                            SizedBox(
                              height: 32.h,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            }),
      ),
    );
  }
}
