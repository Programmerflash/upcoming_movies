import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/upcoming_movies_provider.dart';
import '/screens/home_page/home_page.dart';
import '/utilities/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UpcomingMoviesProvider(),
      child: MaterialApp(
        title: 'Upcoming Movies',
        theme: AppThemes.light,
        darkTheme: AppThemes.dark,
        home: const HomeScreen(),
      ),
    );
  }
}
