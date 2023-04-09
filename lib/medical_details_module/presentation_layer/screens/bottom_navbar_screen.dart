
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
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 70.h,
              leading: Row(
                children: [
                  SizedBox(width: 10.w,),
                  SvgPicture.asset(
                    height: 45.h,
                    width: 45.w,
                    AppImages.developImage,
                  ),
                ],
              ),
              title: Column(
                children: [
                  CustomText(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    size: 20,
                    text: 'ركان على سليم',
                  ),
                  CustomText(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    size: 20,
                    text: 'شهرين',
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
                elevation: 30,
                // fixedColor: AppColors.textColor,
                backgroundColor: AppColors.appBarColor,
                selectedItemColor: AppColors.darkColor,
                unselectedItemColor: AppColors.textColor,
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
