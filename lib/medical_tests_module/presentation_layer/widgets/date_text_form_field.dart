// ignore_for_file: prefer_typing_uninitialized_variables

import '../../../core/utils/exports.dart';

class DateTextFormField extends StatelessWidget {
  final controller;
  const DateTextFormField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: UnderlineInputBorder(
            borderSide: BorderSide(width: 3, color: AppColors.appBarColor),
          ),
          hintStyle: TextStyle(
              color: AppColors.textColor, fontWeight: FontWeight.bold),
          hintText: '01/01/2023',
          prefixIcon: IconButton(
            onPressed: () async {
              controller.text = await AppConstants.showDate(context);
            },
            icon: const Icon(Icons.date_range),
            color: AppColors.textColor,
          ),
        ),
      ),
    );
  }
}
