import 'package:graduation_project/core/utils/exports.dart';
import '../controllers/vaccinations_cubit.dart';
import '../widgets/vaccine_widget.dart';

class VaccinationScreen extends StatelessWidget {
  const VaccinationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<VaccinationsCubit>(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const CustomText(
            text: AppStrings.vaccine,
          ),
          leading: const Icon(
            Icons.arrow_back,
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
          listener: (context, state) {
            /*  if (state is GetAllVaccinationsSuccessState) {
              cubit.getAllVaccinations();
            } */
          },
          builder: (context, state) => Padding(
            padding: EdgeInsets.symmetric(vertical: 20.r, horizontal: 10.r),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      CustomText(
                        text: '${AppStrings.roya}"',
                        size: 14.sp,
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      CustomText(
                        text: '"${AppStrings.vaccineNote}',
                        size: 14.sp,
                      ),
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return VaccineWidget(
                        model: cubit.allVaccinations[index],
                      );
                    },
                    itemCount: cubit.allVaccinations.length,
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
