import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:question_task/controller/question_controller.dart';
import 'package:question_task/custom_scroll_behavoir.dart';
import 'package:question_task/home_screen.dart';

void main() async {
  Get.put(QuestionController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        designSize: const Size(360, 640),
        builder: (context, child) {
          return GetMaterialApp(
            title: 'GetX State',
            scrollBehavior: CustomScrollBehavior(),
            theme: ThemeData(textTheme: GoogleFonts.robotoTextTheme()),
            debugShowCheckedModeBanner: false,
            home: HomeScreen(),
          );
        });
  }
}
