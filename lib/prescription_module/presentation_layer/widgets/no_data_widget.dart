import '../../../core/utils/exports.dart';

class NoDataWidget extends StatelessWidget {
  final String text;
  final String image;
  final String? textButton;
  final String? screen;
  final dynamic arguments;
  final bool isReport;
  const NoDataWidget({
    super.key,
    required this.text,
    required this.image,
    this.textButton,
    this.screen,
    this.arguments,
    this.isReport = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: isReport
              ? MediaQuery.of(context).size.height * 0.3
              : MediaQuery.of(context).size.height * 0.2,
        ),
        Center(child: SvgPicture.asset(image)),
        SizedBox(
          height: 16.h,
        ),
        CustomText(
          text: text,
          color: AppColors.disabledColor,
          size: 16.sp,
        ),
        if ((!isReport) || textButton != null)
          Column(
            children: [
              SizedBox(
                height: 32.h,
              ),
              if (textButton != null)
                CustomButton(
                  text: textButton,
                  onPressed: () {
                    AppConstants.navigateTo(
                        context: context,
                        routeName: screen!,
                        arguments: arguments);
                  },
                ),
            ],
          )
      ],
    );
  }
}
