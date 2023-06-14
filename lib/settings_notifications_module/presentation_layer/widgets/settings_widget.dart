// ignore_for_file: must_be_immutable

import '../../../core/utils/exports.dart';
import '../cotrollers/settings_notifications_cubit.dart';

class SettingsWidget extends StatelessWidget {
  IconData icon;
  String text;
  bool isAccount;
  bool isLogOut;
  bool isAddress;
  /*  required Widget */ String widget;
  String? gender;
  String? image;
  SettingsWidget({
    Key? key,
    required this.icon,
    required this.text,
    this.isAccount = false,
    this.isLogOut = false,
    this.isAddress = false,
    /* required */ this.widget = '', //todo remove this default value
    this.gender,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        if (isLogOut) {
          BlocProvider.of<SettingsNotificationsCubit>(context)
              .logOutUser(context)
              .then((value) {
            AppConstants.navigateReplacement(
              context: context,
              routeName: AppRoutes.login,
            );
          });
        }
      }),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              /* backgroundImage:
                  SvgPicture.asset(AppImages.pointImage) as ImageProvider, */
              radius: 25,
              child: isAccount
                  ? Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          25,
                        ),
                      ),
                      child: image!.contains('.svg')
                          ? SvgPicture.asset(
                              image!,
                              height: 100.h,
                              width: 100.w,
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                image!,
                                height: 100.h,
                                width: 100.w,
                                fit: BoxFit.cover,
                              ),
                            ))
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset(AppImages.pointImage),
                        Icon(
                          icon,
                          color: AppColors.appBarColor.withOpacity(0.8),
                        ),
                      ],
                    ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: text,
                  fontWeight: FontWeight.bold,
                  size: 14.sp,
                ),
                /* const SizedBox(
                  height: 10,
                ), */
                if (isAccount)
                  CustomText(
                    text: gender!,
                    fontWeight: FontWeight.normal,
                    size: 16.sp,
                  ),
              ],
            ),
            const Spacer(),
            if (!isLogOut)
              IconButton(
                onPressed: () {
                  AppConstants.navigateTo(context: context, routeName: widget);
                },
                icon: Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 20.r,
                  color: AppColors.appBarColor,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
