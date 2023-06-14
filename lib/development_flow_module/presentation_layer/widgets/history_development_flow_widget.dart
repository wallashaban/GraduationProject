// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/core/utils/app_strings.dart';
import 'package:graduation_project/development_flow_module/presentation_layer/screens/all_tips_screen.dart';
class DevelopmentFlowHistoryWidget extends StatelessWidget {
  const DevelopmentFlowHistoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // AppConstants.navigateTo(
        //   arguments: model,
        //   context: context,
        //   routeName: AppRoutes.vaccineDetailsScreen,
        // );
      },
    child: Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            blurRadius: 5.5,
            blurStyle: BlurStyle.outer,
            color: Colors.black12,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/star.svg',
                  ),
                  const Text('09/02/2023'),
                ],
              ),
              IconButton(onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => 
             const AllTipsScreen(),),);
              }, icon: SvgPicture.asset(
                'assets/icons/star.svg',
              ),)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children:  [
                  Text(AppStrings.age),
                  Text('شهرين'),
                ],
              ),
              const Text('نصائح'),
            ],
          ),
        ],
      ),),
    );
  }
}

          