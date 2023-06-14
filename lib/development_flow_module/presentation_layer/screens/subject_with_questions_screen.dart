import 'package:graduation_project/development_flow_module/presentation_layer/controllers/development_flow_cubit.dart';

import '../../../core/utils/exports.dart';
import '../controllers/development_flow_state.dart';
import '../widgets/subject_with_question_widget.dart';

class SubjectWithQuestionsScreen extends StatefulWidget {
  const SubjectWithQuestionsScreen({super.key});

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
        body: SingleChildScrollView(
          child: BlocConsumer<DevelopmentFlowCubit, DevelopmentFlowState>(
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
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.h),
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cubit.subjectWithQuestion.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SubjectWithQuestionWidget(
                          subjectWithQuestion: cubit.subjectWithQuestion[index],
                          tipsParameters: cubit.tipsParameters[index],
                        );
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    if ((state is CreateTipsLoadingState) ||
                        (state is UpdateTipsLoadingState))
                      CustomButton(
                        isLoading: true,
                      ),
                    if ((state is! CreateTipsLoadingState) &&
                        (state is! UpdateTipsLoadingState))
                      CustomButton(
                        text: AppStrings.saveData,
                        onPressed: () {
                          debugPrint('tips ${cubit.tipsParameters[1].status}');
                          List tips = [];
                          cubit.tipsParameters.forEach((element) {
                            tips += [
                              TipsParameters(
                                      questionId: element.questionId,
                                      status: element.status)
                                  .toMap()
                            ];
                          });
                          cubit.updateTips(
                            tips,
                          );
                        },
                      ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
