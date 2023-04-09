import 'package:graduation_project/core/utils/exports.dart';

class CustomDropdownList extends StatelessWidget {
  final dynamic onChanged;
  final List<DropdownMenuItem> items;
  final String? value;
  final double width;
  const CustomDropdownList({
    super.key,
    required this.items,
    required this.onChanged,
    required this.value,
    this.width=double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: AppColors.textColor, width: 2.w)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(items: items, value: value, onChanged: onChanged),
      ),
    );
  }
}
