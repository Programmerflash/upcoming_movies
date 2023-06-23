import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/upcoming_movies_provider.dart';
import '/screens/watch_screen/upcoming_movies_list_page/upcoming_movies_list_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    UpcomingMoviesProvider provider =
        Provider.of<UpcomingMoviesProvider>(context, listen: false);
    provider.getMovies();
    provider.getGenresName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: const UpcomingMoviesListPage(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).cardColor,
        selectedItemColor: Colors.blue.shade700,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.shifting,
        selectedLabelStyle: const TextStyle(fontSize: 11),
        unselectedLabelStyle: const TextStyle(fontSize: 11),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
