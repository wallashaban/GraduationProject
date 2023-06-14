import 'package:graduation_project/development_flow_module/domain_layer/entity/subject_questions.dart';

import '../../../core/utils/exports.dart';

class SubjectWithQuestionWidget extends StatefulWidget {
  final SubjectWithQuestion subjectWithQuestion;
  final TipsParameters tipsParameters;
  const SubjectWithQuestionWidget(
      {super.key,
      required this.subjectWithQuestion,
      required this.tipsParameters});

  @override
  State<SubjectWithQuestionWidget> createState() =>
      _SubjectWithQuestionWidgetState();
}

class _SubjectWithQuestionWidgetState extends State<SubjectWithQuestionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: AppColors.backColor,
        boxShadow: [
          BoxShadow(
              color: Colors.grey[400]!,
              blurRadius: 8,
              blurStyle: BlurStyle.outer),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 99.w,
            height: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color:
                  widget.subjectWithQuestion.subject == 'تطور الحركات الكبيره'
                      ? AppColors.pinkColor
                      : widget.subjectWithQuestion.subject == 'تطور الحواس'
                          ? AppColors.babyBlueColor
                          : widget.subjectWithQuestion.subject ==
                                  'تطور الحركات الدقيقه'
                              ? AppColors.orangeColor
                              : AppColors.appBarColor,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[400]!,
                    blurRadius: 2,
                    blurStyle: BlurStyle.outer),
              ],
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: CustomText(
                  text: widget.subjectWithQuestion.subject,
                  size: 16.sp,
                  color: AppColors.white,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          buidCheckBox(widget.tipsParameters),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: CustomText(
                text: widget.subjectWithQuestion.question,
                size: 14.sp,
                maxLines: 4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  buidCheckBox(TipsParameters tipsParameters) => Checkbox(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
        value: tipsParameters.status == 1 ? true : false,
        onChanged: (value) {
          setState(() {
            tipsParameters.status = value == true ? 1 : 0;
          });
          debugPrint('statement ${tipsParameters.status}');
        },
        fillColor:
            MaterialStateColor.resolveWith((states) => AppColors.appBarColor),
      );
}

class CheckBoxState {
  bool value;
  CheckBoxState({
    required this.value,
  });
}
