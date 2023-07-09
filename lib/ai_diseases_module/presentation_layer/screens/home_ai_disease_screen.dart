import 'package:graduation_project/core/utils/exports.dart';
import 'package:graduation_project/medical_details_module/presentation_layer/widgets/block_widget.dart';

class HomeAiDiseaseScreen extends StatelessWidget {
  const HomeAiDiseaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
              )),
          title: const CustomText(
            text: AppStrings.diagnoseDisease,
          ),
        ),
        
        body: Padding(
          padding: EdgeInsets.all(20.r),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: BlockWidget(
                      isMedicalHealthRecord: false,
                      image: AppImages.skinImage,
                      text: AppStrings.skin,
                      textSize: 16.sp,
                      onTap: () {
                        AppConstants.navigateTo(
                            context: context,
                            routeName:
                                CashHelper.getData(key: 'visited') == true
                                    ? AppRoutes.uploadPhotoOfDiseaseScreen
                                    : AppRoutes.advicesPageViewScreen,
                            arguments: 'skin');
                      },
                      width: 150.w,
                      height: 165.h,
                      imageWidth: 112.w,
                      imageHeight: 112.h,
                    )),
                SizedBox(
                  height: 30.h,
                ),
                Align(
                    alignment: Alignment.center,
                    child: BlockWidget(
                      width: 150.w,
                      height: 165.h,
                      imageWidth: 94.w,
                      imageHeight: 69.h,
                      isMedicalHealthRecord: false,
                      image: AppImages.babiesImage,
                      text: AppStrings.safra,
                      onTap: () {
                        AppConstants.navigateTo(
                            context: context,
                            routeName:
                                CashHelper.getData(key: 'visited') == true
                                    ? AppRoutes.uploadPhotoOfDiseaseScreen
                                    : AppRoutes.advicesPageViewScreen,
                            arguments: 'lgp');
                      },
                    )),
                SizedBox(
                  height: 30.h,
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: BlockWidget(
                      isMedicalHealthRecord: false,
                      imageWidth: 97.w,
                      imageHeight: 102.h,
                      width: 150.w,
                      height: 165.h,
                      image: AppImages.eyeImage,
                      text: AppStrings.eye,
                      onTap: () {
                        AppConstants.navigateTo(
                            context: context,
                            routeName:
                                CashHelper.getData(key: 'visited') == true
                                    ? AppRoutes.uploadPhotoOfDiseaseScreen
                                    : AppRoutes.advicesPageViewScreen,
                            arguments: 'mpc');
                      },
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
