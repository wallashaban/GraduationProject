import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/utils/exports.dart';

class CustomDropdownList extends StatelessWidget {
  final dynamic onChanged;
  final List<DropdownMenuItem> items;
  final String? value;
  final double width;
  final String hint;
  const CustomDropdownList({
    super.key,
    required this.items,
    required this.onChanged,
    required this.value,
    required this.hint,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 48.h,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(color: AppColors.disabledColor, width: 1.5.w)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          items: items,
          value: value,
          /*   icon: Icon(
            Icons.arrow_downward,
          ), */
          onChanged: onChanged,
          isExpanded: true,
          iconSize: 24.r,
          iconDisabledColor: AppColors.appBarColor,
          iconEnabledColor: AppColors.greyColor,
          selectedItemBuilder: (BuildContext context) {
            return items.map((item) {
              return CustomText(
                text: item.value,
              );
            }).toList();
          },
          hint: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: CustomText(
              text: hint,
              size: 12.sp,
              color: AppColors.greyColor,
            ),
          ),
        ),
      ),
    );
  }
}
