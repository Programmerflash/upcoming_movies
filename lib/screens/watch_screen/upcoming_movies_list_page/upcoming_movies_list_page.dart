import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '/providers/upcoming_movies_provider.dart';
import '/screens/watch_screen/movie_detail_page.dart/movie_detail_page.dart';

import '../../../models/movie.dart';

class UpcomingMoviesListPage extends StatefulWidget {
  const UpcomingMoviesListPage({super.key});

  @override
  State<UpcomingMoviesListPage> createState() => _UpcomingMoviesListPageState();
}

class _UpcomingMoviesListPageState extends State<UpcomingMoviesListPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UpcomingMoviesProvider>(
        builder: (context, provider, child) {
      return provider.movies.isEmpty
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : ListView.builder(
              itemCount: provider.movies.length,
              itemBuilder: (_, index) => _MovieOverViewCard(
                movie: provider.movies[index],
              ),
            );
    });
  }
}

class _MovieOverViewCard extends StatelessWidget {
  const _MovieOverViewCard({required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (_) => MovieDetailPage(movie: movie))),
      child: Container(
        height: size.height * 0.225,
        width: size.width * 0.9,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(movie.imageURL), fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(10),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                spreadRadius: 4,
                color: Colors.transparent,
              )
            ]),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            movie.name,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.poppins().fontFamily),
          ),
        ),
      ),
    );
  }
}
