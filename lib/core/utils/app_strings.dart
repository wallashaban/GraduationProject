// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'shared_pref.dart';

class AppStrings {
  static const String yes = 'نعم';
  static const String no = 'لا';

  static const String loginText = 'تسجيل الدخول';
  static const String emilTextForm = 'برجاء ادخال البريد الالكترونى الخاص بك';
  static const String passwordTextForm = 'برجاء ادخال كلمه المرور الخاصه بك';
  static const String remeberMe = 'تذكرنى';
  static const String forgetPassword = 'نسيت كلمه المرور؟';
  static const String setPassword = 'ضبط كلمه المرور';

  static const String use = 'او باستخدام';
  static const String createAccount = 'انشاء حساب';
  static const String notHaveAccount = 'ليس لديك حساب؟';
  static const String welcomeText1 = 'مرحبا,لنقم بانشاء حساب طفلك';
  static const String welcomeText2 = 'اكتب معلومات طفلك من فضلك';
  static const String fullName = 'الاسم الكامل';
  static const String email = 'البريد الالكترونى';
  static const String birthdate = 'تاريخ الميلاد';
  static const String password = 'كلمه المرور';
  static const String male = 'ذكر';
  static const String female = 'انثى';
  static const String haveAccount = 'هل لديك حساب بالفعل؟';
  static const String resetPasswordTitle = 'اعاده تعيين كلمه السر';
  static const String verification = 'التحقق المطلوب';
  static const String verificationCode = 'التحقق من الكود';
  static const String resend = 'اعاده الارسال';
  static const String verficationTitle = 'اكتب الرمز الذى تلقيته';
  static const String notsend = 'الم يصلك بعد؟';
  static const String newPassword = 'كلمه المرور الجديده';
  static const String newPasswordTitle = 'انشأ كلمه المرور الجديده الخاصه بك';
  static const String confirmNewPassword = 'تأكيد كلمه المرور الجديده';
  static const String confirmPassword = 'تأكيد كلمه المرور';

  static const String confirm = 'تأكيد';
  static const String resetpassword = 'إعاده تعيين كلمه المرور';
  static const String forgetpassword = 'هل نسيت كلمه السر؟';
  static const String dontworry = 'لا تقلق نحن نهتم بهذا';
  static const String sendcode = 'ارسل الكود';
  static const String createnewpassword = 'انشاء كلمه مرور جديده خاصه بك';
  static const String newpassword = 'كلمه مرور جديده';
  static const String successPassword =
      'لقد تم تعيين كلمه المرور الجديده بنجاح';
  static const String startnew = 'ابدأ من جديد';
  static const String congratulation = 'تهاني لك';
  static const String assetName = 'assets/images/Group 1066.svg';
  static const String enteremail = 'أدخل البريد الالكتروني';
  static const String enternewpassword = 'كلمه المرور الجديده';
  static const String enternewpasswordconfirmation =
      'تأكيد كلمه المرور الجديده';
  static String token = CashHelper.getData(key: 'token');
  static String nameText = 'برجاء ادخال الاسم';
  static String birthdateText = 'برجاء ادخال تاريخ الميلاد';
  static String confirmText = 'برجاء تاكيد كلمه المرور';
  static String diseases = 'الامراض';
  static String mainPage = 'الرئيسيه';
  static String notifications = 'الاشعارات';
  static String reports = 'التقارير';
  static String settings = 'الاعدادات';
  static String vaccination = 'التطعيمات';
  static String medical = 'السجل الطبى';
  static String reminder = 'منبه الدواء';
  static String healthMedicalRecord = 'السجل الطبى الصحى';
  static String tests = 'التحاليل';
  static String medicalDetails = 'التفاصيل الطبيه';
  static String teeth = 'الاسنان';
  static String growth = 'النمو';
  static String development = 'التطور';
  static String prescribtion = 'الروشته';
  static String bloodType = 'فصيله الدم';
  static String allergy = 'حساسيه';
  static String chronicDisease = 'مرض مزمن';
  static String geneticDisease = 'اسم المرض الوراثى';
  static String geneticDiseaseName = ' مرض وراثى';

  static String haveMedicine = 'هل هناك أدويه يأخذها طفلك بشكل دائم؟';
  static String haveGeneticDisease = 'هل طفلك مصاب بمرض وراثى فى العائله؟';
  static String medicineName = 'اسم الدواء';
  static String saveData = 'حفظ البيانات';
  static String teethDevelopment = 'تطور الاسنان';
  static String toothName = 'اسم السن';
  static String date = 'تاريخ الظهور';
  static String age = 'المرحله العمريه';
  static String month = 'اشهر';
  static String addNewRecord = 'اضافه تسجبل جديد';
  static const String tips = 'نصائح';
  static const String medicationReminder = 'منبه الدواء';

  static const String reminderDetails =
      '''اضف ادويتك ... و نحن نقوم بتذكيرك قم باضافه الادويه التى تستعملها الى تنبيهاتك الطبيه لنتمكن من تذكيرك بها فى اوقاتها ''';
  static const String addReminder = 'اضافه منبه';
  static const String addNewReminder = 'اضافه منبه جديد';
  static const String time = 'الوقت';
  static const String quantity = 'الكميه';
  static const String timeUsage = 'موعد استعمال الدواء';
  static const String addNewDose = 'اضافه جرجه اخرى';
  static const String stopMedicineTime = 'موعد التوقف عن الدواء';
  static const String reBuy = 'اعاده الشراء';
  static const String existingNow = 'الموجود حاليا';
  static const String reBuyReminder = 'التنبيه باعاده الشراء';
  static const String disc = 'قرص';
  static const String prevTest = 'تحليل سابق';
  static const String testDate = 'تاريخ التحليل';
  static const String testType = 'نوع التحليل';
  static const String labName = 'اسم المعمل';
  static const String print = 'طباعه';
  static const String edit = 'تعديل';
  static const String editProfile = 'تعديل الحساب';

  static const String share = 'مشاركه';
  static const String delete = 'حذف';
  static const String addNewTest = 'اضاف تحليل جديد';
  static const String newTest = 'تحليل جديد';

  static const String note = 'ملاحظه';
  static const String rogitaDate = 'تاريخ الروشته';
  static const String addNewrRgeta = 'اضافه روشته جديده';
  static const String enterLabName = 'ادخل اسم المعمل';
  static const String newtest = 'تحليل جديد';
  static const String newRogita = 'روشته جديده';
  static const String prevRogita = 'روشته سابقه';
  static const String vaccine = 'تطعيم';
  static const String sure = 'هل انت متاكد من عمليه الحذف؟';
  static const String dateMonth = 'التاريخ';
  static const String noRogita = 'لا توجد روشتات سابقه';
  static const String showRogita = 'عرض الروشته';
  static const String showTest = 'عرض التحليل';
  static const String noTests = 'لا توجد تحاليل سابقه';
  static const String noRecords = 'لا توجد تسجيلات سابقه';
  static const String acount = 'حسابى';
  static const String stars = 'اعطى صحه طفلى خمسه نجوم';
  static const String toldFriends = 'اخبر أصدقائك عن صحه طفلى';
  static const String aboutApp = 'عن التطبيق';
  static const String contactUs = 'تواصل معنا';
  static const String signOut = 'تسجيل الخروج';
  static const String sendNote = 'ارسل ملاحظه';
  static const String opinions = 'أرسل لنا اقتراحاتك ,افكارك او تقارير الاخطاء';
  static const String send = 'ارسال';
  static const String safra = 'مرض الصفرا';
  static const String eye = 'التهاب ملتحمه العين';
  static const String skin = 'امراض جلديه';
  static const String diagnoseDisease = 'تشخيص الامراض';
  static const String next = 'التالى';
  static const String pressHere = 'اضغط هنا لالتقاط';
    static const String takePhoto = 'صوره المرض';

  static const String oldResults = 'نتائج سابقه';
  static const String upload = 'تحميل صوره';
  static const String exchange = 'استبدال';
  static const String diagnose = 'تشخيص';
  static const String diseaseAdvice =
      'نوصى بمراجعه الطبيب فى اقرب وقت ممكن اذا كان المرض يتقدم';
  static const String save = 'حفظ';
  static const String advice = 'للتشخيص الدقيق من فضلك استشر الطبيب';
  static const String cantDiagnose =
      'للاسف لا يمكننى تشخيص هذا المرض فى الوقت الراهن';
  static const String addNewDiagnose = 'اضافه تشخيص جديد';
  static const String noResults = 'لا توجد نتائج بعد';
  static const String robbotAdvice =
      'ليس من المفترض إستبدال طبيبك و لا أقدم أي ضمانات لدقة نتائجي يرجي التواصل مع طبيبك للحصول علي تشخصيات و نتائج دقيقة';

  static const String whileBorn = 'عند الولاده';
  static const String monthVaccine = 'أشهر';
  static const String vaccineReminder = 'التذكير بالتطعيمات';
  static const String reminderVaccine = 'تذكير بتطعيم الطفل';
  static const String vaccinedetails = 'تفاصيل التطعيمات';
  static const String diseasePrevention = 'الوقاية من الامراض';
  static const String aboutVaccine = 'نبذه عن التطعيم';
  static const String vaccineTime = 'التطعيمات وتوقيتها';
  static const String sideEffects = 'الاثار الجانبيه';
  static const String proposedVaccineTime = 'التوقيت المقترح للتطعيم';
  static const String vaccinedate = 'معاد التطعيم';
  static const String reminderDate = 'سوف نقوم بتذكيرك بتاريخ: ';
  static const String vaccineNon = 'لم يتم التطعيم';
  static const String vaccinedone = 'تم التطعيم';
  static const String textMessage =
      'تم تفعيل التذكير بالتطعيمات سيتم تذكيرك الساعة  العاشرة صباحا قبل ميعاد التطعيم بيوم واحد يرجي ملاحظة رسائل الإشعارات';
  static const String iKnow = "اعلم";
  static const String textMessageOff =
      'بعد إغلاق التذكير بالتطعيم قد تفوتك فرصة إعطاء الطفل التطعيم بالوقت الأمثل';
  static const String name = 'الاسم';
  static const String ageVaccine = 'العمر';
  static const String geneticDiseaseVaccine = 'مرض وراثي';
  static const String babyAbility = 'طفلك الان يستطيع ان :';
  static const String report = 'التقرير';
  static const String personalInfo = 'معلومات شخصيه';
  static const String developmentInfo = 'معلومات التطور';
  static const String teethInfo = 'معلومات الاسنان';
  static const String vaccineInfo = 'التطعيمات ';
  static const String diseaseInfo = 'الامراض';
  static const String babyDisease = 'الامراض التى اصيب بها طفلك :';
  static const String roya = 'رؤية';
  static const String vaccineNote = 'دلاله على انه تطعيم اجبارى';
  static const String allergyDisease = 'حساسيه حشريه';
  static const String bacteria = 'عدوى بكتيريه';
  static const String advice1 =
      'بعض التعليمات التي قد تساعدك في إلتقاط صورة جيدة :';
  static const String advice2 = 'إستخدم الكاميرا الخلفية بأداء جيد';
  static const String advice3 = 'لا تلتقط الصور بالداخل بالليل';
  static const String advice4 = 'يرجى إلتقاط الصور في مكان مشرق أثناء النهار';
  static const String advice5 =
      'إذا كانت الصورة الملتقطة غير واضحة أعد إلتقاطها مرة أخرى';

  static double width = 163.w;
  static var userData;
}
