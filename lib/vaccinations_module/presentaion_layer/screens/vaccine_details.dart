// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_local_variable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utils/app_strings.dart';

import '../../../authentication_module/presentaion_layer/widgets/custom_text.dart';
import '../../../core/routes/routers.dart';
import '../../../core/utils/app_constants.dart';
import '../../domain_layer/entities/vaccination.dart';
import '../controllers/vaccinations_cubit.dart';
import '../widgets/vaccine_details_component.dart';
import '../widgets/vaccine_details_second_component.dart';

class VaccinationDetailsScreen extends StatelessWidget {
  final Vaccination vaccineModel;
  const VaccinationDetailsScreen({
    Key? key,
    required this.vaccineModel,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<VaccinationsCubit>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const CustomText(
            text: AppStrings.vaccinedetails,
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                AppConstants.navigateTo(
                  context: context,
                  routeName: AppRoutes.vaccineReminderScreen,
                );
              },
              icon: const Icon(
                Icons.notification_add,
              ),
            ),
          ],
        ),
        body: BlocConsumer<VaccinationsCubit, VaccinationsState>(
          listener: (context, state) {},
          builder: (context, state) => Padding(
            padding: EdgeInsets.all(10.r),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  VaccineDetailsFirstComponent(
                    model: vaccineModel,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  VaccineDetailsSecondComponent(
                    model: vaccineModel,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
