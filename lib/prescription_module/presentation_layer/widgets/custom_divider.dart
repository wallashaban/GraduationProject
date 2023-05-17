import '../../../core/utils/exports.dart';

class CustomDivider extends StatelessWidget {
  final double height;
  final double thickness;
  final Color? color;
  const CustomDivider({
    super.key,
    this.height = 15,
    this.thickness = 3,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color:color?? AppColors.appBarColor,
      height: height.h,
      thickness: thickness,
      indent: 5,
      endIndent: 5,
    );
  }
}
