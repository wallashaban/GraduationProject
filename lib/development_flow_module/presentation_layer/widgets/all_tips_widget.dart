// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../../../core/utils/app_strings.dart';
import '../../domain_layer/entity/get_all_tips.dart';

class AllTipsWidget extends StatelessWidget {
    final AllTips allTipsDetails;

  const AllTipsWidget({
    Key? key,
    required this.allTipsDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {    

    return   Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.amberAccent,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            blurRadius: 5.5,
            blurStyle: BlurStyle.outer,
            color: Colors.black12,
          ),
        ],
      ),
      //alignment: Alignment.centerRight,
    child: Column(
            children: [
              Text('${allTipsDetails.id}'),
              Text(allTipsDetails.description),
              Text(allTipsDetails.ageStage),
              ElevatedButton(
                onPressed: () {
                },
                child:  Text(
                  AppStrings.date,
                ),
              ),
            ],
       
        ));
  }
}
