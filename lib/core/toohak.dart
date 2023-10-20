
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:toohak/_toohak.dart';

class Toohak extends StatelessWidget {
  const Toohak({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    
     MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        navigatorObservers: <NavigatorObserver>[
          sl<NavigationManager>(),
        ],
        title: 'Toohak',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        supportedLocales: const <Locale>[
          Locale('pl'),
        ],
        navigatorKey: thRouter.navigatorKey,
        onGenerateRoute: thRouter.router.generator,
        builder: (BuildContext context, Widget? child) {
          return child ?? const SizedBox();
        },
      
    );
  }
}
