
import '../../../core/utils/exports.dart';

class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocBuilder<MedicalCubit, MedicalState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<MedicalCubit>(context);
          var box = Hive.box('userDataCach');
          var user = box.get('user');
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
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    fontWeight: FontWeight.normal,
                    size: 16.sp,
                    text: user.name, // AppStrings.userData.name,
                  ),
                  CustomText(
                    text: user.gender,
                    size: 14.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ],
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
