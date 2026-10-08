import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int _ticketQuantity = 1;

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
            const Text(
              'Basically Nazis get fucked up.',
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Color.fromARGB(221, 255, 255, 255),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Number of tickets',
              style: TextStyle(
                fontSize: 16,
                color: cinemaBrand,
              ),
            ),
            const SizedBox(height: 8),
            DropdownMenu<int>(
              initialSelection: 1,
              onSelected: (int? value) {
                if (value != null) {
                  setState(() {
                    _ticketQuantity = value;
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
    );
  }
}
