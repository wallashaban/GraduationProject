import '../utils/exports.dart';

var lightTheme = ThemeData(
  //border style
  inputDecorationTheme: InputDecorationTheme(
    suffixIconColor: AppColors.appBarColor,
    prefixIconColor: AppColors.appBarColor,

    // fillColor: Colors.green,
    //focusColor: Colors.green,
    labelStyle: TextStyle(
      color: AppColors.greyColor, //todo change color
      fontWeight: FontWeight.bold,
      fontSize: 16.sp,
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.r),
      borderSide:
          BorderSide(color: AppColors.appBarColor.withOpacity(0.8), width: 2),
    ), //todo change color
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.r),
      borderSide: const BorderSide(color: AppColors.errorColor, width: 2),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.r),
      borderSide: BorderSide(color: AppColors.appBarColor, width: 2),
    ), //todo change color
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.r),
      borderSide:
          BorderSide(color: AppColors.appBarColor.withOpacity(0.8), width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.r),
      borderSide: const BorderSide(color: AppColors.errorColor, width: 2),
    ),
  ),
  // primarySwatch: Colors.orange,
  //todo find a way to make the color you want
  scaffoldBackgroundColor: AppColors.white,
  fontFamily: 'IBM Plex Sans Arabic',
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
    toolbarHeight: 70.h,
    backgroundColor: AppColors.appBarColor,

    actionsIconTheme: IconThemeData(
      color: AppColors.white,
    ),
    centerTitle: true,
    titleTextStyle: TextStyle(
          color: AppColors.white,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),

    // color: AppColors.darkColor,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      showUnselectedLabels: true,
      elevation: 190, //todo fix elevation
      selectedItemColor: AppColors.darkColor,
      unselectedItemColor: AppColors.textColor,
      unselectedIconTheme: IconThemeData(
        color: AppColors.appBarColor,
      ),
      selectedIconTheme: IconThemeData(
        color: AppColors.textColor,
      )),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.resolveWith(
          (states) => EdgeInsets.symmetric(horizontal: 35.w, vertical: 10.r)),
      shape: MaterialStateProperty.resolveWith((_) {
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            15.r,
          ),
        );
      }),
      elevation: MaterialStateProperty.resolveWith((states) => 10),
      animationDuration: const Duration(milliseconds: 2000),
      overlayColor:
          MaterialStateProperty.resolveWith((states) => AppColors.white),
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
      backgroundColor:MaterialStateColor.resolveWith((states) => AppColors.appBarColor)
    ),
  ),
);
