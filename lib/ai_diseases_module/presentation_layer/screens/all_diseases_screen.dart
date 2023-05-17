import 'package:graduation_project/core/utils/exports.dart';

import '../cubit/disease_cubit.dart';
import '../widgets/all_diseases_widget.dart';

class PreviousDiseasesScreen extends StatelessWidget {
  const PreviousDiseasesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<DiseaseCubit>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
              )),
          title: const CustomText(
            text: AppStrings.oldResults,
          ),
        ),
        body: BlocConsumer<DiseaseCubit, DiseaseState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.separated(
                itemCount: cubit.allDiseases.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 15.h,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return AllDiseasesWidget(
                    disease: cubit.allDiseases[index],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
