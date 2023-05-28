import '../../../core/utils/exports.dart';

class NoDataWidget extends StatelessWidget {
  final String text;
  final String image;
  final String? textButton;
  final String? screen;
  const NoDataWidget({
    super.key,
    required this.text,
    required this.image,
     this.textButton,
     this.screen,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
        ),
        SvgPicture.asset(image),
        CustomText(
          text: text,
          color: AppColors.appBarColor,
          size: 16.sp,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        SizedBox(
          height: 40.h,
        ),
        CustomButton(
          text: textButton,
          onPressed: () {
            AppConstants.navigateTo(
              context: context,
              routeName: screen!,
            );
          },
        ),
      ],
    );
  }
}
