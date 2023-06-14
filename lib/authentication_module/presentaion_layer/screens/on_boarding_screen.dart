import 'package:graduation_project/core/utils/exports.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/on_bording_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  var pageController = PageController(initialPage: 0);

  int index = 0;
  @override
  void initState() {
    CashHelper.saveData(key: 'onboarding', value: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          leading: TextButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.resolveWith(
                      (_) => const EdgeInsets.only(right: 15))),
              onPressed: () {
                AppConstants.navigateReplacement(
                  context: context,
                  routeName: AppRoutes.login,
                );
              },
              child: CustomText(
                text: AppStrings.skip,
                color: AppColors.darkColor,
                size: 15.sp,
              )),
        ),
        body: Padding(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            bottom: 30.h,
          ),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: PageView(
                  reverse: true,
                  controller: pageController,
                  onPageChanged: (value) {
                    setState(() {
                      index = value;
                    });
                  },
                  children: const [
                    OnboardingWidget(
                      image: AppImages.onBoarding1Image,
                      title: AppStrings.onboardingTitle1,
                    ),
                    OnboardingWidget(
                      image: AppImages.onBoarding2Image,
                      title: AppStrings.onboardingTitle2,
                    ),
                    OnboardingWidget(
                      image: AppImages.onBoarding3Image,
                      title: AppStrings.onboardingTitle3,
                    )
                  ],
                ),
              ),

              const Spacer(),
              Row(
                children: [
                  Container(
                    height: 40.h,
                    width: 70.w,
                    decoration: BoxDecoration(
                      color: AppColors.appBarColor,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: InkWell(
                        onTap: () {
                          if (pageController.page == 2) {
                            AppConstants.navigateReplacement(
                              context: context,
                              routeName: AppRoutes.login,
                            );
                          }
                          pageController.nextPage(
                            duration: const Duration(seconds: 2),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: AppColors.white,
                        )),
                  ),
                  SizedBox(
                    width: 50.w,
                  ),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: 3,
                      effect: ExpandingDotsEffect(
                        dotHeight: 8,
                        dotWidth: 10,
                        activeDotColor: AppColors.appBarColor,
                      ),
                    ),
                  ),
                ],
              ),

              //   Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       CustomButton(
              //         onPressed: () {
              //           if (pageController.page == 0) {
              //             CashHelper.saveData(key: 'onboarding', value: true);
              //           }
              //           if (pageController.page == 2) {
              //             AppConstants.navigateReplacement(
              //               context: context,
              //               routeName: AppRoutes.login,
              //             );
              //           }
              //           pageController.nextPage(
              //             duration: const Duration(seconds: 2),
              //             curve: Curves.easeInOut,
              //           );
              //         },
              //         text: AppStrings.next,
              //       ),
              //       if (index != 0)
              //         Container(
              //           padding: EdgeInsets.symmetric(horizontal: 12.w),
              //           decoration: BoxDecoration(
              //               border: Border.all(
              //                 color: AppColors.darkColor,
              //               ),
              //               borderRadius: BorderRadius.circular(8.r)),
              //           child: TextButton(
              //             onPressed: () {
              //               AppConstants.navigateReplacement(
              //                 context: context,
              //                 routeName: AppRoutes.login,
              //               );
              //             },
              //             style: ButtonStyle(
              //               shape: MaterialStateProperty.resolveWith((_) {
              //                 return RoundedRectangleBorder(
              //                   borderRadius: BorderRadius.circular(
              //                     15.r,
              //                   ),
              //                 );
              //               }),
              //             ),
              //             child: CustomText(
              //               text: AppStrings.skip,
              //               color: AppColors.darkColor,
              //               size: 14.sp,
              //             ),
              //           ),
              //         ),
              //     ],
              //   ),
              //
            ],
          ),
        ),
      ),
    );
  }
}
