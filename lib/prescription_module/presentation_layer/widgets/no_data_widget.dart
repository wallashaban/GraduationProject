import '../../../core/utils/exports.dart';

class NoDataWidget extends StatelessWidget {
  final String text;
  final String image;
  const NoDataWidget({super.key, required this.text,required this.image,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
        ),
        SvgPicture.asset(
          image
        ),
        CustomText(
          text: text,
          color: AppColors.appBarColor,
          size: 16.sp,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
      ],
    );
  }
}
