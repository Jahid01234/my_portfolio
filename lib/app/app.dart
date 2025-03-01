import 'package:flutter/material.dart';
import 'package:my_portfolio/app/scroll_behavior.dart';
import 'package:my_portfolio/themes/elevated_button_styles.dart';
import 'package:my_portfolio/themes/outlined_button_styles.dart';
import 'package:my_portfolio/themes/text_button_styles.dart';
import 'package:my_portfolio/themes/text_styles.dart';
import 'package:my_portfolio/themes/textfield_style.dart';
import 'package:my_portfolio/utils/web_color.dart';
import 'package:my_portfolio/viewModels/portfolio_view_model.dart';
import 'package:my_portfolio/views/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({super.key});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PortfolioViewModel())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
        builder: (context, child) => ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: [
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 769, end: 1920, name: DESKTOP),
          ],
        ),
        theme: ThemeData(
          textTheme: WebTextStyles.getTextStyle(),
          elevatedButtonTheme: ElevatedButtonStyles.getElevatedButtonStyles(),
          outlinedButtonTheme: OutlinedButtonStyle.getOutlineButtonStyle(),
          scaffoldBackgroundColor: WebColor.scaffoldBackgroundColor,
          textButtonTheme: TextButtonStyles.getTextButtonStyle(),
          inputDecorationTheme: TextFieldStyle.getTextFieldStyle(),
        ),
        scrollBehavior: AppScrollBehaviour(),
      ),
    );
  }
}