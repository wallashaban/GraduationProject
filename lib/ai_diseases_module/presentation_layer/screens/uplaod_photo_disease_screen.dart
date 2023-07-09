import 'package:graduation_project/core/utils/exports.dart';
import 'package:graduation_project/prescription_module/presentation_layer/widgets/custom_divider.dart';

import '../widgets/take_photo_widget.dart';

class UploadPhotoOfDiseaseScreen extends StatelessWidget {
  final String field;
  const UploadPhotoOfDiseaseScreen({super.key, required this.field});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<DiseaseCubit>(context);
    return Directionality(
      textDirection: TextDirection.ltr,
      child: WillPopScope(
        onWillPop: () async {
          bool willPop = true;
          cubit.clear();
          //cubit.close();
          return willPop;
        },
        child: Scaffold(
          /*    appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  cubit.pickedFile = null;
                },
                icon: const Icon(
                  Icons.arrow_back,
                )),
            title: const CustomText(
              text: AppStrings.diagnoseDisease,
            ),
          ),
        */
          body: Padding(
            padding: EdgeInsets.all(0.0.r),
            child: BlocConsumer<DiseaseCubit, DiseaseState>(
              listener: (context, state) {
                if (state is StoreDiseaseErrorState) {
                  AppConstants.showSnackbar(
                    context: context,
                    content: state.error,
                  );
                }
                if (state is PredictDiseaseErrorState) {
                  AppConstants.showSnackbar(
                    context: context,
                    content: state.error,
                  );
                }
                if (state is StoreDiseaseSuccessState) {
                  AppConstants.showSnackbar(
                    context: context,
                    content: AppStrings.saveSuccess,
                  );
                  if (cubit.disease == 'حاول مره اخرى') {
                    AppConstants.showSnackbar(
                      context: context,
                      content: cubit.disease!,
                    );
                  }
                }
              },
              builder: (context, state) {
                return Column(
                  children: [
                    if (cubit.disease != null && cubit.file != null)
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.w, vertical: 48.h),
                          child: Column(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    40.r,
                                  ),
                                  child: Image.file(
                                    cubit.file!,
                                    fit: BoxFit.fill,
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        0.4,
                                  )),
                              SizedBox(
                                height: 32.h,
                              ),
                              CustomText(
                                text: cubit.disease!,
                              ),
                              CustomDivider(
                                color: AppColors.appBarColor.withOpacity(0.6),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star_border,
                                    color: AppColors.appBarColor,
                                    size: 10.r,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Expanded(
                                    child: CustomText(
                                      text: cubit.disease!.contains('غير مصاب')
                                          ? AppStrings.advice
                                          : cubit.disease == 'unknown'
                                              ? '${AppStrings.cantDiagnose} ${AppStrings.advice}'
                                              : AppStrings.diseaseAdvice,
                                      maxLines: 4,
                                      size: 14.sp,
                                      color: AppColors.black.withOpacity(0.8),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 32.h,
                              ),
                              if (state is StoreDiseaseLoadingState)
                                CustomButton(
                                  isLoading: true,
                                ),
                              if (state is! StoreDiseaseLoadingState)
                                CustomButton(
                                    text: AppStrings.save,
                                    onPressed: () {
                                      cubit.storeAiDisease(
                                        DiseaseParameters(
                                          prediction:
                                              cubit.disease == 'غير مصاب'
                                                  ? 0
                                                  : 1,
                                          photo: cubit.filePath,
                                          disease: cubit.disease!,
                                        ),
                                      );
                                    })
                            ],
                          ),
                        ),
                      ),
                    if (cubit.disease == null || cubit.file == null)
                      Column(children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(top: 32.h),
                          height: MediaQuery.of(context).size.height * 0.8,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey[400]!,
                                    blurRadius: 2,
                                    blurStyle: BlurStyle.outer),
                              ],
                              color: AppColors
                                  .appBarColor, //: AppColors.backColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(40.r),
                                bottomRight: Radius.circular(40.r),
                              )
                              // BorderRadius.circular(25.r),
                              ),
                          child: Stack(
                            //crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              if (cubit.pickedFile == null) const SizedBox(),
                              if (cubit.pickedFile != null)
                                ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(40.r),
                                      bottomRight: Radius.circular(40.r),
                                    ),
                                    child: Image.file(
                                      cubit.file!,
                                      fit: BoxFit.fill,
                                      width: double.infinity,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.8,
                                    )),
                              Padding(
                                padding: EdgeInsets.only(left: 16.sp, top: 8.h),
                                child: CircleAvatar(
                                  radius: 16.r,
                                  backgroundColor: AppColors.white,
                                  child: InkWell(
                                      onTap: () {
                                        cubit.deleteImage();
                                        /* cubit.isGallery
                                          ? cubit.pickImageFromGallery()
                                          : cubit.pickImageFromCamera(); */
                                      },
                                      child: Icon(
                                        Icons.close_rounded,
                                        size: 24.r,
                                        color: AppColors.appBarColor,
                                      )),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 52.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  cubit.pickImageFromGallery();
                                },
                                child: Container(
                                  height: 45.h,
                                  width: 45.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        AppColors.appBarColor.withOpacity(0.15),
                                  ),
                                  child: Icon(
                                    Icons.image_outlined,
                                    color: AppColors.appBarColor,
                                    size: 24.r,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  if (cubit.filePath == null) {
                                    AppConstants.showSnackbar(
                                      context: context,
                                      content: AppStrings.addPhoto,
                                    );
                                  } else {
                                    cubit.predictDisease(
                                      PredictDiseaseParameters(
                                        field: field,
                                        photo: cubit.filePath,
                                      ),
                                    );
                                  }
                                },
                                child: state is PredictDiseaseLoadingState
                                    ? const TakePhotoWidget(
                                        isLoading: true,
                                      )
                                    : const TakePhotoWidget(),
                              ),
                              InkWell(
                                onTap: () {
                                  cubit.pickImageFromCamera();
                                },
                                child: Container(
                                  height: 45.h,
                                  width: 45.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        AppColors.appBarColor.withOpacity(0.15),
                                  ),
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    color: AppColors.appBarColor,
                                    size: 24.r,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        /*  SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        InkWell(
                          onTap: () {
                            cubit.pickImageFromCamera();
                          },
                          child: const TakePhotoWidget(),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            UploadPhotoWidget(
                              icon: Icons.restore_outlined,
                              text: AppStrings.oldResults,
                              onTap: () {
                                AppConstants.navigateTo(
                                  context: context,
                                  routeName: AppRoutes.previousDiseasesScreen,
                                );
                              },
                            ),
                            UploadPhotoWidget(
                              icon: Icons.upload_file_rounded,
                              text: AppStrings.upload,
                              onTap: () {
                                cubit.pickImageFromGallery();
                              },
                            ),
                          ],
                        ),
                     */
                      ]),
                    /* if (cubit.pickedFile != null)

                      Column(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(20.r),
                              child: Image.file(
                                cubit.file!,
                                width: double.infinity,
                                height: 250.h,
                                fit: BoxFit.cover,
                              ) /* Image(
                              image: NetworkImage(
                                cubit.pickedFile,
                              ),
                              width: double.infinity,
                              height: 250.h,
                              fit: BoxFit.cover,
                            ), */
                              ),
                          SizedBox(
                            height: 40.h,
                          ),
                          if (cubit.disease != null)
                            Column(
                              children: [
                                CustomText(
                                  text: cubit.disease!,
                                ),
                                CustomDivider(
                                  color: AppColors.appBarColor.withOpacity(0.6),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star_border,
                                      color: AppColors.appBarColor,
                                      size: 10.r,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Expanded(
                                      child: CustomText(
                                        text: cubit.disease == 'غير مصاب'
                                            ? AppStrings.advice
                                            : cubit.disease == 'unknown'
                                                ? '${AppStrings.cantDiagnose} ${AppStrings.advice}'
                                                : AppStrings.diseaseAdvice,
                                        maxLines: 4,
                                        size: 14.sp,
                                        color: AppColors.black.withOpacity(0.8),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                ),
                                if (state is StoreDiseaseLoadingState)
                                  CustomButton(
                                    isLoading: true,
                                  ),
                                if (state is! StoreDiseaseLoadingState)
                                  CustomButton(
                                      text: AppStrings.save,
                                      onPressed: () {
                                        cubit.storeAiDisease(
                                          DiseaseParameters(
                                            prediction:
                                                cubit.disease == 'غير مصاب'
                                                    ? 0
                                                    : 1,
                                            photo: cubit.filePath,
                                            disease: cubit.disease!,
                                          ),
                                        );
                                      })
                              ],
                            ),
                          if (cubit.disease == null)
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomButtonWithIcon(
                                      onPressed: () {
                                        cubit.isGallery
                                            ? cubit.pickImageFromGallery()
                                            : cubit.pickImageFromCamera();
                                      },
                                      icon: Icons.replay_10_outlined,
                                      text: AppStrings.exchange,
                                    ),
                                    CustomButtonWithIcon(
                                      onPressed: () {
                                        cubit.deleteImage();
                                      },
                                      icon: Icons.delete_outline,
                                      text: AppStrings.delete,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                ),
                                if (state is PredictDiseaseLoadingState)
                                  CustomButton(
                                    isLoading: true,
                                  ),
                                if (state is! PredictDiseaseLoadingState)
                                  CustomButton(
                                    text: AppStrings.diagnose,
                                    onPressed: () {
                                      cubit.predictDisease(
                                        PredictDiseaseParameters(
                                          field: field,
                                          photo: cubit.filePath,
                                        ),
                                      );
                                    },
                                  ),
                              ],
                            )
                        ],
                      ) */
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
