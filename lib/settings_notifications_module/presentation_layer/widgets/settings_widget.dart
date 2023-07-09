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
                  : Container(
                      height: 40.h,
                      width: 40.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: AppColors.settingdsColor),
                      child: Icon(
                        icon,
                        color: AppColors.darkColor,
                        size: 24.r,
                      ),
                    ),
            ),
            SizedBox(
              width: 16.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: text,
                  fontWeight: FontWeight.normal,
                  size: 16.sp,
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
                  size: 24.r,
                  color: AppColors.darkColor,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
