import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/utils/exports.dart';
import '../../../settings_notifications_module/presentation_layer/cotrollers/settings_notifications_state.dart';

class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocBuilder<MedicalCubit, MedicalState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<MedicalCubit>(context);

          return WillPopScope(
            onWillPop: () async {
              bool willPPop = true;
              SystemNavigator.pop();
              return willPPop;
            },
            child: Scaffold(
              appBar: AppBar(
                leading: Padding(
                  padding: EdgeInsets.only(right: 24.w),
                  child: SvgPicture.asset(
                    // height: 45.h,
                    // width: 45.w,
                    AppImages.babyImage,
                    //fit: BoxFit.cover,
                  ),
                ),
                centerTitle: false,
                title: BlocBuilder<AuthenticationCubit, AuthenticationState>(
                  builder: (context, state) {
                    var cubitSettings =
                        BlocProvider.of<AuthenticationCubit>(context);
                    return Padding(
                      padding: EdgeInsets.only(right: 8.0.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            fontWeight: FontWeight.normal,
                            size: 16.sp,
                            text: cubitSettings
                                .userData!.name, // AppStrings.userData!.name,
                          ),
                          CustomText(
                            text: cubitSettings.userData!.gender!,
                            size: 14.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              body: cubit.screens[cubit.currentIndex],
              bottomNavigationBar: Container(
                height: 56.h,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30.r),
                      topLeft: Radius.circular(30.r)),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.appBarColor.withOpacity(0.3),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32.0.r),
                    topRight: Radius.circular(32.0.r),
                  ),
                  child: BottomNavigationBar(
                      currentIndex: cubit.currentIndex,
                      onTap: (index) {
                        cubit.changeNavbar(index);
                      },
                      selectedIconTheme: IconThemeData(
                        color: AppColors.appBarColor,
                      ),
                      unselectedIconTheme: IconThemeData(
                        color: AppColors.disabledColor,
                      ),
                      items: [
                        BottomNavigationBarItem(
                            icon: Icon(
                              PhosphorIcons.houseBold,
                              size: 24.r,
                            ),
                            label: AppStrings.mainPage),
                        BottomNavigationBarItem(
                          icon: Icon(
                            Icons.notifications_none_sharp,
                            size: 24.r,
                          ),
                          label: AppStrings.notifications,
                        ),
                        BottomNavigationBarItem(
                            icon: Icon(
                              Icons.analytics_outlined,
                              size: 24.r,
                            ),
                            label: AppStrings.reports),
                        BottomNavigationBarItem(
                            icon: Icon(
                              Icons.settings,
                              size: 24.r,
                            ),
                            label: AppStrings.settings),
                      ]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
