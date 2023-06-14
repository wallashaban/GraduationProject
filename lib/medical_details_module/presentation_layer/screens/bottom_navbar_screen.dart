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

          return Scaffold(
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: SvgPicture.asset(
                  /* height: 45.h,
                  width: 45.w, */
                  AppImages.babyImage,
                ),
              ),
              centerTitle: false,
              title: BlocBuilder<AuthenticationCubit, AuthenticationState>(
                builder: (context, state) {
                  var cubitSettings =
                      BlocProvider.of<AuthenticationCubit>(context);
                  return Column(
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
                  );
                },
              ),
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  cubit.changeNavbar(index);
                },
                items: [
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.home), label: AppStrings.mainPage),
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.notifications),
                      label: AppStrings.notifications),
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.copy), label: AppStrings.reports),
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.settings),
                      label: AppStrings.settings),
                ]),
          );
        },
      ),
    );
  }
}
