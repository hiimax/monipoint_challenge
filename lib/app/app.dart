import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monipoint_challenge/app/provider_setup.dart';
import 'package:monipoint_challenge/app/router.dart';
import 'package:monipoint_challenge/resources/colors.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

class MoniePoint extends StatelessWidget {
  const MoniePoint({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: ToastificationWrapper(
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (_, child) => MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(textScaler: const TextScaler.linear(0.8)),
            child: OverlaySupport.global(
              child: MaterialApp.router(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  fontFamily: 'Sora',
                  floatingActionButtonTheme:
                      const FloatingActionButtonThemeData(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    elevation: 0,
                  ),
                  appBarTheme: const AppBarTheme(
                    surfaceTintColor: Colors.white,
                    elevation: 0,
                    color: Colors.white,
                    titleTextStyle: TextStyle(
                      color: AppColors.sampleColor11,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  scaffoldBackgroundColor: Colors.white,
                  textSelectionTheme: TextSelectionThemeData(
                    cursorColor: AppColors.primaryColor,
                    selectionColor: AppColors.primaryColor.withOpacity(0.3),
                    selectionHandleColor: AppColors.primaryColor,
                  ),
                  tabBarTheme: const TabBarTheme(
                    labelStyle: TextStyle(
                      fontSize: 14,
                      color: AppColors.sampleColor11,
                    ),
                    unselectedLabelStyle: TextStyle(
                      fontSize: 14,
                      color: AppColors.sampleColor11,
                    ),
                    indicator: BoxDecoration(),
                    dividerColor: Colors.transparent,
                  ),
                  checkboxTheme: CheckboxThemeData(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    side: const BorderSide(
                      color: AppColors.primaryColor,
                      width: 0.8,
                    ),
                    fillColor: WidgetStateProperty.resolveWith(
                      (states) {
                        if (states.contains(WidgetState.selected)) {
                          return AppColors.primaryColor;
                        }
                        return AppColors.sampleColor11;
                      },
                    ),
                  ),
                  radioTheme: RadioThemeData(
                    fillColor: WidgetStateProperty.resolveWith(
                      (states) {
                        if (states.contains(WidgetState.selected)) {
                          return AppColors.primaryColor;
                        }
                        return AppColors.sampleColor11;
                      },
                    ),
                  ),
                  bottomSheetTheme: const BottomSheetThemeData(
                    dragHandleColor: AppColors.sampleColor11,
                    dragHandleSize: Size(60, 5),
                    showDragHandle: true,
                    backgroundColor: AppColors.skyWhite,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                  ),
                ),
                routerConfig: router,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
