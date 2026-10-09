import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  bool _orderConfirmed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Inglorious Bastards',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: cinemaBrand,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Text(
              'Basically Nazis get fucked up.'
              '${_orderConfirmed ? ' You are going to see the movie!' : ''}',
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                color: cinemaFontWhite,
              ),
            ),
            const SizedBox(height: 60),
            const Text(
              'Number of tickets',
              style: TextStyle(
                fontSize: 16,
                color: cinemaBrand,
              ),
            ),
            const SizedBox(height: 10),
            DropdownMenu<int>(
              initialSelection: 1,
              onSelected: (int? value) {
                if (value != null) {
                  setState(() {
                    
                  });
                }
              },
              dropdownMenuEntries: List.generate(
                5,
                (index) => DropdownMenuEntry<int>(
                  value: index + 1,
                  label: '${index + 1} ${index == 0 ? 'ticket' : 'tickets'}',
                ),
              ),
            ),
          ],
        ),
      ),
    floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _orderConfirmed = true;
          });
        },

    ));
  }
}
