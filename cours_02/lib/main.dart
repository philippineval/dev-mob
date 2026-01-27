import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formation_flutter/l10n/app_localizations.dart';
import 'package:formation_flutter/res/app_colors.dart';
import 'package:formation_flutter/res/app_icons.dart';
import 'package:formation_flutter/res/app_vectorial_images.dart';

import 'screens/product_details_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.nutriscoreA),
        fontFamily: 'Avenir',
        textTheme: const TextTheme(
          headlineMedium: TextStyle(),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.my_scans_screen_title),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Padding(
              padding: EdgeInsetsDirectional.only(end: 8.0),
              child: Icon(AppIcons.barcode),
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Spacer(flex: 20),
              SvgPicture.asset(AppVectorialImages.illEmpty),
              const Spacer(flex: 15),
              const Text(
                'Vous n\'avez pas encore scanné de produit',
                textAlign: TextAlign.center,
              ),
              const Spacer(flex: 10),

              TextButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.blue,
                  backgroundColor: AppColors.yellow,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(22.0)),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const ProductDetailsPage(),
                    ),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(localizations.my_scans_screen_button.toUpperCase()),
                    const SizedBox(width: 4.0),
                    const Icon(Icons.arrow_right_alt_rounded),
                  ],
                ),
              ),

              const Spacer(flex: 20),
            ],
          ),
        ),
      ),
    );
  }
}
