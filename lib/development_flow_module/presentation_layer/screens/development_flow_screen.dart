import 'package:graduation_project/development_flow_module/presentation_layer/controllers/development_flow_cubit.dart';
import 'package:graduation_project/development_flow_module/presentation_layer/controllers/development_flow_state.dart';
import '../../../core/utils/exports.dart';
import '../../data_layer/model/development_flow_parameters.dart';
import '../widgets/development_flow_widget.dart';
class DevelopmentFlowScreen extends StatelessWidget {
   DevelopmentFlowScreen({super.key});
  List parameters=[
    DevelopmentFlowParameters(status: 0, questionId: 11).toMap(),
    DevelopmentFlowParameters(status: 0, questionId: 18).toMap(),
    DevelopmentFlowParameters(status: 1, questionId: 25).toMap(),
    DevelopmentFlowParameters(status: 1, questionId: 24).toMap(),
    DevelopmentFlowParameters(status: 0, questionId: 14).toMap(),

  ];
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<DevelopmentFlowCubit>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.appBarColor,
          elevation: 0,
          toolbarHeight: 100,
          title:  const Text(
            ' التطور',
            style: TextStyle(
            ),
          ),
          leading: Icon(
            Icons.arrow_back,
            color: AppColors.textColor,
          ),
        ),
        body: BlocConsumer<DevelopmentFlowCubit, DevelopmentFlowState>(
          listener: (context, state) {},
          builder: (context, state) => Column(
            children: [
                 Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: 
                  DevelopmentFlowWidget(
                      ),
                ),
          //     Checkbox(
          //   value: cubit.check,
          //   onChanged: (value) => cubit.changeCheckboxState(),//uncompleted
          // ),
              ElevatedButton(
                onPressed: () {
                  cubit.createTips(parameters);//cubit.updateTips(parameters); في الاسكرينه التانيه
                },
                child:  Text(
                  AppStrings.saveData,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
