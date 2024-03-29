// ignore_for_file: must_be_immutable

import 'package:graduation_project/core/utils/exports.dart';

import '../widgets/page_view_widget.dart';

class AdvicesPageViewScreen extends StatelessWidget {
  final String field;

  const AdvicesPageViewScreen({super.key, required this.field});
  // int index = 1;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        //backgroundColor: AppColors.black,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
              )),
          title: const CustomText(
            text: AppStrings.diagnoseDisease,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0.r),
          child: PageviewWidget(
            field: field,
          ),
        ),
      ),
    );
  }
}
