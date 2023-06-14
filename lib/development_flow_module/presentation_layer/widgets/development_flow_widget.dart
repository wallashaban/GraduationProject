// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data_layer/model/checkbox_state.dart';
import '../controllers/development_flow_cubit.dart';
import '../controllers/development_flow_state.dart';

class DevelopmentFlowWidget extends StatefulWidget {
  DevelopmentFlowWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<DevelopmentFlowWidget> createState() => _DevelopmentFlowWidgetState();
}

class _DevelopmentFlowWidgetState extends State<DevelopmentFlowWidget> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<DevelopmentFlowCubit>(context);
    //final checkboxStates = cubit.subjectWithQuestion.length;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(),
          body: BlocConsumer<DevelopmentFlowCubit, DevelopmentFlowState>(
              listener: (context, state) {},
              builder: (context, state) =>
                  //  customCheckboxListTile(CheckboxState(
                  //    title: cubit.subjectWithQuestion[0].question, subject: cubit.subjectWithQuestion[0].subject)),
                  ListView.builder(
                    itemCount: cubit.subjectWithQuestion.length,
                    itemBuilder: (context, index) => customCheckboxListTile(
                      CheckboxState(
                          title: cubit.subjectWithQuestion[index].question,
                          value: checked,
                          subject: cubit.subjectWithQuestion[index].subject),
                    ),
                  )
              //   SingleChildScrollView(
              //     child: Column(
              //       children: cubit.subjectWithQuestion.map((e) => customCheckboxListTile(CheckboxState(title: e.question, subject: e.subject))).toList(),
              //       // [
              //       //   InkWell(
              //       //     onTap: (){
              //       //       debugPrint('screen ${cubit.subjectWithQuestion[0]}');
              //       //     },
              //       //     child: Text('${cubit.subjectWithQuestion[0]}',maxLines: 20
              //       //     ,),
              //       //   ),
              //       //         SizedBox(
              //       //           height: 400,
              //       //            child: customCheckboxListTile(CheckboxState(title: cubit.subjectWithQuestion[0].question,subject: cubit.subjectWithQuestion[0].subject))),

              //       // ]

              //     ),
              //   ),
              // ))
              )),
    );
  }

  Widget customCheckboxListTile(CheckboxState checkbox) => Row(
        children: [
          Container(
            width: 90,
            height: 80,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.cyan,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 5.5,
                  blurStyle: BlurStyle.outer,
                  color: Colors.black12,
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(
              height: 20,
              child: Text(
                checkbox.subject,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          // Checkbox(value: BlocProvider.of<DevelopmentFlowCubit>(context).check, onChanged: (value){
          //   //setState(() {
          //     BlocProvider.of<DevelopmentFlowCubit>(context).changeCheckboxState();
          //   //});

          //   })
          Expanded(
            //height: 10,
            child: CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              value: checkbox.value,
              title: Text(
                checkbox.title,
              ),
              onChanged: (value) => setState(() {
                debugPrint('value $value');
                checkbox.value = value!;
              }), //uncompleted
            ),
          ),
        ],
      );
}
