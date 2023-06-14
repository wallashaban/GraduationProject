import 'package:graduation_project/core/utils/exports.dart';
import 'package:graduation_project/prescription_module/presentation_layer/widgets/custom_divider.dart';

import '../widgets/custom_button_with_icon.dart';
import '../widgets/take_photo_widget.dart';
import '../widgets/upload_photo_widget.dart';

class UploadPhotoOfDiseaseScreen extends StatelessWidget {
  final String field;
  const UploadPhotoOfDiseaseScreen({super.key, required this.field});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<DiseaseCubit>(context);
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
          padding: EdgeInsets.all(30.0.r),
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
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                  if (cubit.pickedFile == null)
                    Column(children: [
                      SizedBox(
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
                    ]),
                  if (cubit.pickedFile != null)
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
                    )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
