import 'package:graduation_project/development_flow_module/domain_layer/entity/get_question.dart';
import 'package:graduation_project/development_flow_module/presentation_layer/controllers/development_flow_cubit.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../authentication_module/presentaion_layer/widgets/cutom_circular.dart';
import '../../../core/utils/exports.dart';
import '../../../medication_reminder_module/presentation_layer/Screens/no_internet_screen.dart';
import '../../../prescription_module/presentation_layer/widgets/no_data_widget.dart';
import '../controllers/development_flow_state.dart';
import '../widgets/subject_with_question_widget.dart';

class DevelopmentParameters {
  int? id;
  bool isEdit;
  DevelopmentParameters({
    this.id,
    required this.isEdit,
  });
}

class SubjectWithQuestionsScreen extends StatefulWidget {
  final DevelopmentParameters developmentParameters;
  //final bool isEdit;
  const SubjectWithQuestionsScreen(
      {super.key, required this.developmentParameters});

  @override
  State<SubjectWithQuestionsScreen> createState() =>
      _SubjectWithQuestionsScreenState();
}

class _SubjectWithQuestionsScreenState
    extends State<SubjectWithQuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<DevelopmentFlowCubit>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () async {
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
              if (((cubit.subjectWithQuestion == null) ||
                      (widget.developmentParameters.isEdit &&
                          cubit.questionsOfTip == null)) &&
                  snapshot.data == InternetConnectionStatus.disconnected) {
                return const NoInternetScreen();
              } else {
                return SingleChildScrollView(
                  child:
                      BlocConsumer<DevelopmentFlowCubit, DevelopmentFlowState>(
                    listener: (context, state) {
                      if (state is CreateTipsErrorState) {
                        AppConstants.showSnackbar(
                          context: context,
                          content: state.error,
                        );
                      }
                      if (state is UpdateTipsErrorState) {
                        AppConstants.showSnackbar(
                          context: context,
                          content: state.error,
                        );
                      }
                      if ((state is UpdateTipsSuccessState) ||
                          (state is CreateTipsSuccessState)) {
                        AppConstants.showSnackbar(
                          context: context,
                          content: AppStrings.saveSuccess,
                        );
                      }
                    },
                    builder: (context, state) {
                      if (!widget.developmentParameters.isEdit &&
                          cubit.subjectWithQuestion == null) {
                        cubit.getSubjectsWithQuestions();
                      } else if (widget.developmentParameters.isEdit &&
                          cubit.questionsOfTip == null) {
                        cubit.allQuestionsOfTips(
                            widget.developmentParameters.id!);
                      }
                      if ((state is SubjectsWithQuestionsLoadingState) ||
                          (!widget.developmentParameters.isEdit &&
                              cubit.subjectWithQuestion == null) ||
                          (widget.developmentParameters.isEdit &&
                              cubit.questionsOfTip == null)) {
                        return const CustomCircularProgress();
                      } else if (!widget.developmentParameters.isEdit &&
                          cubit.subjectWithQuestion!.isEmpty) {
                        return const NoDataWidget(
                          text: AppStrings.developMentMessage,
                          image: AppImages.noDevelopmentImage,
                        );
                      } else {
                        return Padding(
                          padding: EdgeInsets.only(
                            top: 24.h,
                            left: 24.w,
                            right: 16.w,
                          ),
                          child: Column(
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: widget.developmentParameters.isEdit
                                    ? cubit.questionsOfTip!.length
                                    : cubit.subjectWithQuestion!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return SubjectWithQuestionWidget(
                                    subjectWithQuestion:
                                        widget.developmentParameters.isEdit
                                            ? cubit.questionsOfTip![index]
                                            : cubit.subjectWithQuestion![index],
                                    tipsParameters: widget
                                            .developmentParameters.isEdit
                                        ? cubit.tipsParametersQuestions[index]
                                        : cubit.tipsParameters[index],
                                  );
                                },
                              ),
                              SizedBox(
                                height: 32.h,
                              ),
                              if ((state is CreateTipsLoadingState) ||
                                  (state is UpdateTipsLoadingState))
                                CustomButton(
                                  isLoading: true,
                                ),
                              if ((state is! CreateTipsLoadingState) &&
                                  (state is! UpdateTipsLoadingState))
                                CustomButton(
                                  text: widget.developmentParameters.isEdit
                                      ? AppStrings.edit
                                      : AppStrings.saveData,
                                  onPressed: () {
                                    /* debugPrint(
                                        'tips ${cubit.tipsParameters[1].status}'); */
                                    List tips = [];
                                    // ignore: avoid_function_literals_in_foreach_calls
                                    cubit.tipsParameters.forEach((element) {
                                      tips += [
                                        TipsParameters(
                                                questionId: element.questionId,
                                                status: element.status)
                                            .toMap()
                                      ];
                                    });
                                    widget.developmentParameters.isEdit
                                        ? cubit.updateTips(UpdateTipsParameters(
                                            id: widget
                                                .developmentParameters.id!,
                                            tips: tips,
                                          ))
                                        : cubit.createTips(
                                            tips,
                                          );
                                  },
                                ),
                              SizedBox(
                                height: 32.h,
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                );
              }
            }),
      ),
    );
  }
}
