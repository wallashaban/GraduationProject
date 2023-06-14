// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/app_colors.dart';
import '../controllers/development_flow_cubit.dart';
import '../controllers/development_flow_state.dart';
import '../widgets/all_tips_widget.dart';

class AllTipsScreen extends StatelessWidget {
  const AllTipsScreen({
    Key? key,
  }) : super(key: key);

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
            title:  Text(
              'النصائح',
              style: TextStyle(
                color: AppColors.appBarColor,
              ),
            ),
            leading: Icon(
              Icons.arrow_back,
              color: AppColors.textColor,
            ),
          ),
        body: BlocConsumer<DevelopmentFlowCubit, DevelopmentFlowState>(
          listener: (context, state) {},
          builder: (context, state) => ListView.builder(
            shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => AllTipsWidget(allTipsDetails: cubit.allTips[index]),           
            itemCount: cubit.allTips.length,
          ),
          
        ),
      ),
    );
  }
}
