// ignore_for_file: must_be_immutable

import 'package:graduation_project/core/utils/exports.dart';
import 'package:graduation_project/settings_notifications_module/presentation_layer/cotrollers/settings_notifications_state.dart';

class ContactUsScreen extends StatelessWidget {
  ContactUsScreen({super.key});
  var controller = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<SettingsNotificationsCubit>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const CustomText(
            text: AppStrings.contactUs,
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /* CustomText(
                    text: AppStrings.sendNote,
                    size: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 10.h,
                  ), */
                  textAreaWidget(controller),
                  SizedBox(
                    height: 32.h,
                  ),
                  BlocConsumer<SettingsNotificationsCubit,
                      SettingsNotificationsState>(
                    listener: (context, state) {
                      if (state is MakeReviewErrorState) {
                        AppConstants.showSnackbar(
                            context: context, content: state.error);
                      }
                      if (state is MakeReviewSuccessState) {
                        AppConstants.showSnackbar(
                          context: context,
                          content: cubit.review.message,
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is MakeReviewLoadingState) {
                        return CustomButton(
                          isLoading: true,
                        );
                      } else {
                        return CustomButton(
                            text: AppStrings.send,
                            onPressed: () {
                              BlocProvider.of<SettingsNotificationsCubit>(
                                      context)
                                  .makeReview(
                                controller.text,
                              );
                            });
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget textAreaWidget(controller) => Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          // color: Colors.transparent,
          boxShadow: [
            BoxShadow(
                color: Colors.grey[400]!,
                blurRadius: 2.r,
                blurStyle: BlurStyle.outer),
          ]),
      child: ClipRRect(
        child: TextFormField(
            cursorColor: AppColors.appBarColor,
            controller: controller,
            textInputAction: TextInputAction.done,
            minLines: 12,
            maxLines: 12,
            keyboardType: TextInputType.multiline,
            validator: (value) {
              return null;
            },
            decoration: InputDecoration(
              hintText: AppStrings.opinions,
              filled: true,
              fillColor: AppColors.white,
            )),
      ),
    );
