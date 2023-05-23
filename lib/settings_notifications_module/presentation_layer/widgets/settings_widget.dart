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
        isLogOut
            ? BlocProvider.of<SettingsNotificationsCubit>(context)
                .logOutUser()
                .then((value) {
                CashHelper.deleteData(key: 'token');
                AppConstants.navigateReplacement(
                  context: context,
                  routeName: AppRoutes.login,
                );
              })
            : AppConstants.navigateTo(context: context, routeName: widget);
      }),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor:
                  isAccount ? Colors.transparent : AppColors.textColor,
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
                  : Icon(
                      icon,
                      color: AppColors.white,
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
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 20.r,
                  color: AppColors.darkColor,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
