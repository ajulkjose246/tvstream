import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'movie_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Map<String, List<Map<String, dynamic>>> categories = {
    "New": [
      {
        "title": "Oppenheimer",
        "thumbnail":
            "https://m.media-amazon.com/images/M/MV5BMDBmYTZjNjUtN2M1MS00MTQ2LTk2ODgtNzc2M2QyZGE5NTVjXkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_.jpg",
        "description":
            "The story of J. Robert Oppenheimer and his role in the development of the atomic bomb.",
        "cast": [
          "Cillian Murphy",
          "Emily Blunt",
          "Matt Damon",
          "Robert Downey Jr.",
          "Florence Pugh",
        ],
        "videoUrl": "https://www.youtube.com/watch?v=bK6ldnjE3Y0",
      },
      {
        "title": "Barbie",
        "thumbnail":
            "https://m.media-amazon.com/images/M/MV5BMDBmYTZjNjUtN2M1MS00MTQ2LTk2ODgtNzc2M2QyZGE5NTVjXkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_.jpg",
        "description":
            "Barbie and Ken leave Barbieland and discover the real world.",
        "cast": [
          "Margot Robbie",
          "Ryan Gosling",
          "Will Ferrell",
          "America Ferrera",
          "Simu Liu",
        ],
        "videoUrl": "https://www.youtube.com/watch?v=pBk4NYhWNMM",
      },
      {
        "title": "The Marvels",
        "thumbnail":
            "https://m.media-amazon.com/images/M/MV5BMDBmYTZjNjUtN2M1MS00MTQ2LTk2ODgtNzc2M2QyZGE5NTVjXkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_.jpg",
        "description":
            "Carol Danvers teams up with Ms. Marvel and Monica Rambeau.",
        "cast": [
          "Brie Larson",
          "Iman Vellani",
          "Teyonah Parris",
          "Samuel L. Jackson",
          "Zawe Ashton",
        ],
        "videoUrl": "https://www.youtube.com/watch?v=iuk77TjvfmE",
      },
      {
        "title": "Napoleon",
        "thumbnail":
            "https://m.media-amazon.com/images/M/MV5BMDBmYTZjNjUtN2M1MS00MTQ2LTk2ODgtNzc2M2QyZGE5NTVjXkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_.jpg",
        "description":
            "An epic depiction of Napoleon Bonaparte's rise and fall.",
        "cast": [
          "Joaquin Phoenix",
          "Vanessa Kirby",
          "Tahar Rahim",
          "Ben Miles",
          "Ludivine Sagnier",
        ],
        "videoUrl": "https://www.youtube.com/watch?v=LIsfMO5Jd_w",
      },
    ],
    "Top Rated": [
      {
        "title": "The Shawshank Redemption",
        "thumbnail":
            "https://m.media-amazon.com/images/M/MV5BMDBmYTZjNjUtN2M1MS00MTQ2LTk2ODgtNzc2M2QyZGE5NTVjXkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_.jpg",
        "description":
            "Two imprisoned men bond over years, finding solace and redemption.",
        "cast": [
          "Tim Robbins",
          "Morgan Freeman",
          "Bob Gunton",
          "William Sadler",
          "Clancy Brown",
        ],
        "videoUrl": "https://www.youtube.com/watch?v=6hB3S9bIaco",
      },
      {
        "title": "The Godfather",
        "thumbnail":
            "https://m.media-amazon.com/images/M/MV5BMDBmYTZjNjUtN2M1MS00MTQ2LTk2ODgtNzc2M2QyZGE5NTVjXkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_.jpg",
        "description":
            "The aging patriarch of an organized crime dynasty transfers control to his son.",
        "cast": [
          "Marlon Brando",
          "Al Pacino",
          "James Caan",
          "Robert Duvall",
          "Diane Keaton",
        ],
        "videoUrl": "https://www.youtube.com/watch?v=sY1S34973zA",
      },
      {
        "title": "The Dark Knight",
        "thumbnail":
            "https://m.media-amazon.com/images/M/MV5BMDBmYTZjNjUtN2M1MS00MTQ2LTk2ODgtNzc2M2QyZGE5NTVjXkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_.jpg",
        "description":
            "Batman faces the Joker, a criminal mastermind who plunges Gotham into chaos.",
        "cast": [
          "Christian Bale",
          "Heath Ledger",
          "Aaron Eckhart",
          "Michael Caine",
          "Gary Oldman",
        ],
        "videoUrl": "https://www.youtube.com/watch?v=EXeTwQWrcwY",
      },
      {
        "title": "Pulp Fiction",
        "thumbnail":
            "https://m.media-amazon.com/images/M/MV5BMDBmYTZjNjUtN2M1MS00MTQ2LTk2ODgtNzc2M2QyZGE5NTVjXkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_.jpg",
        "description":
            "The lives of two hitmen, a boxer, and others intertwine in tales of violence.",
        "cast": [
          "John Travolta",
          "Samuel L. Jackson",
          "Uma Thurman",
          "Bruce Willis",
          "Ving Rhames",
        ],
        "videoUrl": "https://www.youtube.com/watch?v=s7EdQ4FqbhY",
      },
    ],
    "Malayalam": [
      {
        "title": "Premam",
        "thumbnail":
            "https://m.media-amazon.com/images/M/MV5BMDBmYTZjNjUtN2M1MS00MTQ2LTk2ODgtNzc2M2QyZGE5NTVjXkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_.jpg",
        "description":
            "A coming-of-age romantic drama following George through three stages of love.",
        "cast": [
          "Nivin Pauly",
          "Sai Pallavi",
          "Madonna Sebastian",
          "Anupama Parameswaran",
          "Soubin Shahir",
        ],
        "videoUrl": "https://www.youtube.com/watch?v=_biTn89Zgx4",
      },
      {
        "title": "Drishyam",
        "thumbnail":
            "https://m.media-amazon.com/images/M/MV5BMDBmYTZjNjUtN2M1MS00MTQ2LTk2ODgtNzc2M2QyZGE5NTVjXkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_.jpg",
        "description":
            "A man goes to great lengths to protect his family after a crime.",
        "cast": [
          "Mohanlal",
          "Meena",
          "Asha Sarath",
          "Esther Anil",
          "Ansiba Hassan",
        ],
        "videoUrl": "https://www.youtube.com/watch?v=DSb5kV9SYpY",
      },
      {
        "title": "Kumbalangi Nights",
        "thumbnail":
            "https://m.media-amazon.com/images/M/MV5BMDBmYTZjNjUtN2M1MS00MTQ2LTk2ODgtNzc2M2QyZGE5NTVjXkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_.jpg",
        "description":
            "A tale of four brothers in a dysfunctional family living in a fishing village.",
        "cast": [
          "Fahadh Faasil",
          "Soubin Shahir",
          "Sreenath Bhasi",
          "Shane Nigam",
          "Anna Ben",
        ],
        "videoUrl": "https://www.youtube.com/watch?v=0gkF3Zt2j5g",
      },
      {
        "title": "Minnal Murali",
        "thumbnail":
            "https://m.media-amazon.com/images/M/MV5BMDBmYTZjNjUtN2M1MS00MTQ2LTk2ODgtNzc2M2QyZGE5NTVjXkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_.jpg",
        "description":
            "A tailor gains superpowers after being struck by lightning and becomes a local hero.",
        "cast": [
          "Tovino Thomas",
          "Guru Somasundaram",
          "Femina George",
          "Shelly Kishore",
          "Aju Varghese",
        ],
        "videoUrl": "https://www.youtube.com/watch?v=tFMo3UJ4B4g",
      },
    ],
    "English": [
      {
        "title": "Inception",
        "thumbnail":
            "https://m.media-amazon.com/images/M/MV5BMDBmYTZjNjUtN2M1MS00MTQ2LTk2ODgtNzc2M2QyZGE5NTVjXkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_.jpg",
        "description":
            "A thief who steals corporate secrets through dream-sharing technology is given a chance to erase his past.",
        "cast": [
          "Leonardo DiCaprio",
          "Joseph Gordon-Levitt",
          "Elliot Page",
          "Tom Hardy",
          "Ken Watanabe",
        ],
        "videoUrl": "https://www.youtube.com/watch?v=YoHD9XEInc0",
      },
      {
        "title": "Interstellar",
        "thumbnail":
            "https://m.media-amazon.com/images/M/MV5BMDBmYTZjNjUtN2M1MS00MTQ2LTk2ODgtNzc2M2QyZGE5NTVjXkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_.jpg",
        "description":
            "A team of explorers travels through a wormhole in space in an attempt to ensure humanity's survival.",
        "cast": [
          "Matthew McConaughey",
          "Anne Hathaway",
          "Jessica Chastain",
          "Michael Caine",
          "Matt Damon",
        ],
        "videoUrl": "https://www.youtube.com/watch?v=zSWdZVtXT7E",
      },
      {
        "title": "The Matrix",
        "thumbnail":
            "https://m.media-amazon.com/images/M/MV5BMDBmYTZjNjUtN2M1MS00MTQ2LTk2ODgtNzc2M2QyZGE5NTVjXkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_.jpg",
        "description":
            "A computer hacker learns the world is a simulated reality and joins a rebellion against its controllers.",
        "cast": [
          "Keanu Reeves",
          "Laurence Fishburne",
          "Carrie-Anne Moss",
          "Hugo Weaving",
          "Joe Pantoliano",
        ],
        "videoUrl": "https://www.youtube.com/watch?v=vKQi3bBA1y8",
      },
      {
        "title": "Fight Club",
        "thumbnail":
            "https://m.media-amazon.com/images/M/MV5BMDBmYTZjNjUtN2M1MS00MTQ2LTk2ODgtNzc2M2QyZGE5NTVjXkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_.jpg",
        "description":
            "An insomniac office worker and a devil-may-care soap maker form an underground fight club.",
        "cast": [
          "Brad Pitt",
          "Edward Norton",
          "Helena Bonham Carter",
          "Meat Loaf",
          "Jared Leto",
        ],
        "videoUrl": "https://www.youtube.com/watch?v=SUXWAEX2jlg",
      },
    ],
  };

  // Store focus nodes for each row
  final Map<String, List<FocusNode>> _rowFocusNodes = {};
  final ScrollController _scrollController = ScrollController();
  final Map<String, GlobalKey> _rowKeys = {};

  @override
  void initState() {
    super.initState();
    // Initialize focus nodes and keys for each card in each row
    categories.forEach((key, value) {
      _rowFocusNodes[key] = List.generate(value.length, (_) => FocusNode());
      _rowKeys[key] = GlobalKey();
    });
    // Set initial focus to the first card in the first row
    final firstRowKey = categories.keys.first;
    _rowFocusNodes[firstRowKey]![0].requestFocus();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    for (var nodes in _rowFocusNodes.values) {
      for (var node in nodes) {
        node.dispose();
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        controller: _scrollController,
        padding: const EdgeInsets.all(16),
        children: categories.entries.map((entry) {
          final rowKey = entry.key;
          final focusNodes = _rowFocusNodes[rowKey]!;
          return Column(
            key: _rowKeys[rowKey],
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                rowKey,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              FocusTraversalGroup(
                policy: ReadingOrderTraversalPolicy(),
                child: SizedBox(
                  height: 180,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: entry.value.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      final movie = entry.value[index];
                      return Focus(
                        focusNode: focusNodes[index],
                        onFocusChange: (hasFocus) {
                          if (hasFocus) {
                            final context = _rowKeys[rowKey]?.currentContext;
                            if (context != null) {
                              Scrollable.ensureVisible(
                                context,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                alignment: 0.1,
                              );
                            }
                          }
                        },
                        onKey: (node, event) {
                          if (event is RawKeyDownEvent) {
                            if (event.logicalKey ==
                                    LogicalKeyboardKey.arrowRight &&
                                index < focusNodes.length - 1) {
                              focusNodes[index + 1].requestFocus();
                              return KeyEventResult.handled;
                            }
                            if (event.logicalKey ==
                                    LogicalKeyboardKey.arrowLeft &&
                                index > 0) {
                              focusNodes[index - 1].requestFocus();
                              return KeyEventResult.handled;
                            }
                            // Up/Down: move to previous/next row if exists
                            final rowKeys = categories.keys.toList();
                            final currentRow = rowKeys.indexOf(rowKey);
                            if (event.logicalKey ==
                                    LogicalKeyboardKey.arrowDown &&
                                currentRow < rowKeys.length - 1) {
                              final nextRowNodes =
                                  _rowFocusNodes[rowKeys[currentRow + 1]]!;
                              final nextIndex = index < nextRowNodes.length
                                  ? index
                                  : nextRowNodes.length - 1;
                              nextRowNodes[nextIndex].requestFocus();
                              return KeyEventResult.handled;
                            }
                            if (event.logicalKey ==
                                    LogicalKeyboardKey.arrowUp &&
                                currentRow > 0) {
                              final prevRowNodes =
                                  _rowFocusNodes[rowKeys[currentRow - 1]]!;
                              final prevIndex = index < prevRowNodes.length
                                  ? index
                                  : prevRowNodes.length - 1;
                              prevRowNodes[prevIndex].requestFocus();
                              return KeyEventResult.handled;
                            }
                            // Handle select/enter for navigation
                            if (event.logicalKey == LogicalKeyboardKey.select ||
                                event.logicalKey == LogicalKeyboardKey.enter) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => MovieDetailsPage(
                                    title: movie['title']!,
                                    thumbnail: movie['thumbnail']!,
                                    description: movie['description']!,
                                    cast: List<String>.from(movie['cast']!),
                                    videoUrl: movie['videoUrl']!,
                                  ),
                                ),
                              );
                              return KeyEventResult.handled;
                            }
                          }
                          return KeyEventResult.ignored;
                        },
                        child: Builder(
                          builder: (context) {
                            final isFocused = Focus.of(context).hasFocus;
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => MovieDetailsPage(
                                      title: movie['title']!,
                                      thumbnail: movie['thumbnail']!,
                                      description: movie['description']!,
                                      cast: List<String>.from(movie['cast']!),
                                      videoUrl: movie['videoUrl']!,
                                    ),
                                  ),
                                );
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: isFocused
                                      ? Border.all(color: Colors.red, width: 3)
                                      : null,
                                ),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.network(
                                        movie['thumbnail']!,
                                        width: 120,
                                        height: 140,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    SizedBox(
                                      width: 120,
                                      child: Text(
                                        movie['title']!,
                                        style: TextStyle(
                                          color: isFocused
                                              ? Colors.red
                                              : Colors.white,
                                          fontWeight: isFocused
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          );
        }).toList(),
      ),
    );
  }
}
