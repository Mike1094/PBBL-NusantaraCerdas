import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'navigation/app_routes.dart';
import 'cubit/favorit_cubit.dart';
import 'cubit/pengajuan_cubit.dart';
import 'cubit/theme_cubit.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FavoritCubit()),
        BlocProvider(create: (context) => PengajuanCubit()),
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, currentThemeMode) {
        return MaterialApp(
          title: 'Nusantara Cerdas',
          debugShowCheckedModeBanner: false,

          theme: ThemeData(
            colorSchemeSeed: Colors.teal,
            useMaterial3: true,
            brightness: Brightness.light,
          ),

          darkTheme: ThemeData(
            colorSchemeSeed: Colors.teal,
            useMaterial3: true,
            brightness: Brightness.dark,
          ),

          themeMode: currentThemeMode,

          initialRoute: AppRoutes.beranda,
          routes: AppRoutes.daftarRoute(),
          onGenerateRoute: AppRoutes.bentukRoute,
          onUnknownRoute: AppRoutes.routeTidakDikenal,
        );
      },
    );
  }
}