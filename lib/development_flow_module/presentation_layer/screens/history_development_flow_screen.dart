import 'package:graduation_project/development_flow_module/presentation_layer/controllers/development_flow_cubit.dart';
import 'package:graduation_project/development_flow_module/presentation_layer/screens/development_flow_screen.dart';

import '../../../core/utils/exports.dart';
import '../controllers/development_flow_state.dart';
import '../widgets/history_development_flow_widget.dart';

class HistoryDevelopmentFlowScreen extends StatelessWidget {
  const HistoryDevelopmentFlowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.appBarColor,
          elevation: 0,
          toolbarHeight: 100,
          title: const Text(
            'التطور',
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
                ListView.builder(
            shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => const Padding(
                padding: EdgeInsets.all(20.0),
                child: DevelopmentFlowHistoryWidget(),
              ),           
            itemCount: 1,
          ),              
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => 
                   DevelopmentFlowScreen(),));
                },
                child:  Text(
                  AppStrings.nameText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
