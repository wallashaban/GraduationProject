import '../utils/exports.dart';

var lightTheme = ThemeData(
  //border style
  inputDecorationTheme: InputDecorationTheme(
    suffixIconColor: AppColors.appBarColor,
    prefixIconColor: AppColors.appBarColor,
    contentPadding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 13.h),
    // fillColor: Colors.green,
    //focusColor: Colors.green,
    focusColor: AppColors.disabledColor,
    hoverColor: AppColors.enabledColor,
    floatingLabelStyle:
        TextStyle(color: AppColors.enabledColor, fontSize: 16.sp),
    //filled: true,
    labelStyle: TextStyle(
      color: AppColors.greyColor, //todo change color
      fontSize: 12.sp,
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(18.r),
      borderSide: BorderSide(
          color: AppColors.disabledColor.withOpacity(0.8), width: 1.5),
    ), //todo change color
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(18.r),
      borderSide: const BorderSide(color: AppColors.errorColor, width: 1.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(18.r),
      borderSide: BorderSide(color: AppColors.appBarColor, width: 1.5),
    ), //todo change color
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(18.r),
      borderSide: BorderSide(
          color: AppColors.disabledColor.withOpacity(0.8), width: 1.5),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(18.r),
      borderSide: const BorderSide(
        color: AppColors.errorColor,
        width: 1.5,
      ),
    ),
  ),
  // primarySwatch: Colors.orange,
  //todo find a way to make the color you want
  scaffoldBackgroundColor: AppColors.white,
  fontFamily: 'Changa',
  textTheme: TextTheme(
      bodyLarge: TextStyle(
    color: AppColors.darkGreyColor,
    fontWeight: FontWeight.bold,
    fontSize: 60.sp,
    overflow: TextOverflow.ellipsis,
  )),
  //  primarySwatch: AppColors.errorColor,
  appBarTheme: AppBarTheme(
    elevation: 0.0,
    toolbarHeight: 75.h,
    backgroundColor: AppColors.appBarColor,
    actionsIconTheme: IconThemeData(
      color: AppColors.white,
    ),
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: AppColors.white,
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
    ),

    // color: AppColors.darkColor,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      showUnselectedLabels: true,
      elevation: 400.0, //todo fix elevation
      selectedItemColor: AppColors.appBarColor,
      unselectedItemColor: AppColors.disabledNavbarColor,
      unselectedIconTheme: IconThemeData(
        color: AppColors.appBarColor,
      ),
      selectedIconTheme: IconThemeData(
        color: AppColors.textColor,
      )),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
        padding: MaterialStateProperty.resolveWith(
            (states) => EdgeInsets.symmetric(horizontal: 32.w, vertical: 8.r)),
        shape: MaterialStateProperty.resolveWith((_) {
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              16.r,
            ),
          );
        }),
        elevation: MaterialStateProperty.resolveWith((states) => 4),
        animationDuration: const Duration(milliseconds: 2000),
        overlayColor: MaterialStateProperty.resolveWith(
            (states) => AppColors.darkColor.withOpacity(0.5)),
        textStyle: MaterialStateProperty.resolveWith(
          (states) => TextStyle(
            color: AppColors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          return AppColors.white;
        }),
        backgroundColor:
            MaterialStateColor.resolveWith((states) => AppColors.appBarColor)),
  ),
);
