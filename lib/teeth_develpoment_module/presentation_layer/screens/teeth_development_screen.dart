import 'package:graduation_project/core/utils/exports.dart';

import '../widgets/teeth_widget.dart';

class TeethDevelopmentScreen extends StatelessWidget {
  const TeethDevelopmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
         appBar: AppBar(
            leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back,
                  color: AppColors.darkColor,
                )),
            title: CustomText(
              text: AppStrings.teethDevelopment,
              color: AppColors.textColor,
              size: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
       body: BlocBuilder<TeethDevelopmentCubit, TeethDevelopmentState>(
         builder: (context, state) {
          var cubit = BlocProvider.of<TeethDevelopmentCubit>(context);
           return Padding(
             padding:  EdgeInsets.symmetric(vertical:30.h,horizontal: 18.0.w),
             child: Column(children: [
                 Expanded(
                   child: ListView.builder(
                     itemCount: cubit.allTeeth.length,
                     itemBuilder: (BuildContext context, int index) {
                       return TeethWidget(teeth: cubit.allTeeth[index],);
                     },
                   ),
                 ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.appBarColor,
                      radius: 40.r,
                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                               Icon(Icons.light,color: AppColors.textColor,size: 22.r,),
                                CustomText(
                                        text: AppStrings.tips,
                                        color: AppColors.textColor,
                                        size: 15.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: AppColors.appBarColor,
                      radius: 40.r,
                      child: IconButton(icon: Icon(Icons.graphic_eq,color: AppColors.textColor,),onPressed: (){},),
                    ),
                  ],
                 ),
                                         SizedBox(
                          height: 25.h,
                        ),
                        Center(
                          child: CustomButton(text: AppStrings.addNewRecord,
                          
                          color: AppColors.textColor,onPressed: (){},size: 20.sp,fontWeight: FontWeight.bold,),
                        )
                ]),
           );
         },
       ),
      ),
    );
  }
}