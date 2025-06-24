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
        "videoUrl":
            "https://movie.requestbot.workers.dev/1603491/%5BMM%5D+Oppenheimer+%282023%29+English+BluRay+720p+HEVC+%28DD5.1.mkv?hash=AgAD_B",
      },
      {
        "title": "Barbie",
        "thumbnail":
            "https://m.media-amazon.com/images/M/MV5BYjI3NDU0ZGYtYjA2YS00Y2RlLTgwZDAtYTE2YTM5ZjE1M2JlXkEyXkFqcGc@._V1_FMjpg_UY2814_.jpg",
        "description":
            "Barbie and Ken leave Barbieland and discover the real world.",
        "cast": [
          "Margot Robbie",
          "Ryan Gosling",
          "Will Ferrell",
          "America Ferrera",
          "Simu Liu",
        ],
        "videoUrl":
            "https://movie.requestbot.workers.dev/1603509/Barbie.2023.720p.WEBRip.800MB.x264-GalaxyRG.mkv?hash=AgADDj",
      },
      {
        "title": "The Marvels",
        "thumbnail":
            "https://cdn.marvel.com/content/1x/goatrodeo_pay1_pre-sunrise_ka_v4_lg.jpg",
        "description":
            "Carol Danvers teams up with Ms. Marvel and Monica Rambeau.",
        "cast": [
          "Brie Larson",
          "Iman Vellani",
          "Teyonah Parris",
          "Samuel L. Jackson",
          "Zawe Ashton",
        ],
        "videoUrl":
            "https://movie.requestbot.workers.dev/1603526/The.Marvels.2023.720p.WEBRip..mkv?hash=AgADUD",
      },
      {
        "title": "Napoleon",
        "thumbnail":
            "https://upload.wikimedia.org/wikipedia/en/2/2e/Napoleon_Film_poster.jpg",
        "description":
            "An epic depiction of Napoleon Bonaparte's rise and fall.",
        "cast": [
          "Joaquin Phoenix",
          "Vanessa Kirby",
          "Tahar Rahim",
          "Ben Miles",
          "Ludivine Sagnier",
        ],
        "videoUrl":
            "https://movie.requestbot.workers.dev/1603545/Napoleon.2023.720p.AMZN.WEBRip.900MB.x264-GalaxyRG.mkv?hash=AgADSD",
      },
      {
        "title": "Pushpa: The Rise - Part 1",
        "thumbnail":
            "https://resizing.flixster.com/-XZAfHZM39UwaGJIFWKAE8fS0ak=/v3/t/assets/p21200456_p_v10_aa.jpg",
        "description":
            "A red sandalwood smuggler from Seshachalam forest in Andhra Pradesh, India, fights against the authorities to protect his business and the rights of his workers.",
        "cast": ["Allu Arjun", "Rakul Preet Singh", "Sunil", "Dhananjay"],
        "videoUrl":
            "https://movie.requestbot.workers.dev/1603655/%5BMS%5D+Pushpa+The+Rise+%282021%29+Telugu+HDRip+1080p+%28DD%2B5..mkv?hash=AgAD7x",
      },
      {
        "title": "Minnal Murali",
        "thumbnail":
            "https://resizing.flixster.com/9DXfheQGvFlQV4K-PJOSAgnJ6cc=/ems.cHJkLWVtcy1hc3NldHMvbW92aWVzLzExYmRjOGJhLWUxNmYtNGVmNS04MTUyLTVhZDFjMTczZGUyZC5qcGc=",
        "description":
            "A tailor gains superpowers after being struck by lightning and becomes a local hero.",
        "cast": [
          "Tovino Thomas",
          "Guru Somasundaram",
          "Femina George",
          "Shelly Kishore",
          "Aju Varghese",
        ],
        "videoUrl":
            "https://movie.requestbot.workers.dev/1603629/MINNAL+MURALI+2021+720p+%40ALBCINEMASALL+MALAYALAM+10bit.mkv?hash=AgADBw",
      },
      {
        "title": "John Wick: Chapter 4",
        "thumbnail":
            "https://resizing.flixster.com/ayiSi8HrUS3_i-Jkru1P2oMM58Q=/ems.cHJkLWVtcy1hc3NldHMvbW92aWVzLzhiODAwYWIyLTM1MmItNGI1ZS1iOWQzLTdjZjAzMzI1MDc2Yy5qcGc=",
        "description":
            "John Wick uncovers a path to defeating The High Table. But before he can earn his freedom, Wick must face off against a new enemy with powerful alliances across the globe and forces that turn old friends into foes.",
        "cast": [
          "Keanu Reeves",
          "Laurence Fishburne",
          "Ian McShane",
          "Rina Sawayama",
          "Donnie Yen",
        ],
        "videoUrl":
            "https://movie.requestbot.workers.dev/1603663/%5BMS%5D+John+Wick+Chapter+4+%282023%29+BluRay+720p+x264+%28DD.mkv?hash=AgAD0R",
      },
      {
        "title": "Fast X",
        "thumbnail":
            "https://resizing.flixster.com/8ZFc4VKwZN8NGV3ZqhCIFCHekxM=/ems.cHJkLWVtcy1hc3NldHMvbW92aWVzLzJlNDAyYWUzLWEwZTUtNDVlNy04MDliLTRmZWIzNDMzMzJmYS5qcGc=",
        "description":
            "Dom Toretto and his family are targeted by a vengeful and dangerous enemy.",
        "cast": [
          "Vin Diesel",
          "Michelle Rodriguez",
          "Tyrese Gibson",
          "Chris 'Ludacris' Bridges",
          "Jordana Brewster",
        ],
        "videoUrl":
            "https://movie.requestbot.workers.dev/1603672/Fast.X.2023.720p.PCOK.WEBRip.900MB.x264-GalaxyRG.mkv?hash=AgADBD",
      },
    ],
    "Top Rated": [
      {
        "title": "The Shawshank Redemption",
        "thumbnail":
            "https://resizing.flixster.com/hgcQ8juhhUYQofbQ6wsXfhicb3Y=/v2/https://resizing.flixster.com/-XZAfHZM39UwaGJIFWKAE8fS0ak=/v3/t/assets/p15987_p_v13_ap.jpg",
        "description":
            "Two imprisoned men bond over years, finding solace and redemption.",
        "cast": [
          "Tim Robbins",
          "Morgan Freeman",
          "Bob Gunton",
          "William Sadler",
          "Clancy Brown",
        ],
        "videoUrl":
            "https://movie.requestbot.workers.dev/1603555/%40CC_Links.The.Shawshank.Redemption.1994.720p.x264.YIFY.mp4?hash=AgAD_Q",
      },
      {
        "title": "The Godfather",
        "thumbnail":
            "https://resizing.flixster.com/-XZAfHZM39UwaGJIFWKAE8fS0ak=/v3/t/assets/p6326_p_v13_be.jpg",
        "description":
            "The aging patriarch of an organized crime dynasty transfers control to his son.",
        "cast": [
          "Marlon Brando",
          "Al Pacino",
          "James Caan",
          "Robert Duvall",
          "Diane Keaton",
        ],
        "videoUrl":
            "https://movie.requestbot.workers.dev/1603568/The.Godfather.1972.cultcinema1.720p.BluRay.x265.HEVC-PSA.mkv?hash=AgADtQ",
      },
      {
        "title": "The Dark Knight",
        "thumbnail":
            "https://resizing.flixster.com/Wg25mLoPWxjcxXzNyaSF4VGgGE4=/ems.cHJkLWVtcy1hc3NldHMvbW92aWVzL2ZiNjZiNWFkLWVhNzEtNDRhMC1iNGIwLTFmY2FkNzllNTJlMi5qcGc=",
        "description":
            "Batman faces the Joker, a criminal mastermind who plunges Gotham into chaos.",
        "cast": [
          "Christian Bale",
          "Heath Ledger",
          "Aaron Eckhart",
          "Michael Caine",
          "Gary Oldman",
        ],
        "videoUrl":
            "https://movie.requestbot.workers.dev/1603579/takiesmedia_%E0%B4%AE%E0%B5%82%E0%B4%B5%E0%B4%BF_%E0%B4%B8%E0%B5%80%E0%B4%B0%E0%B5%80%E0%B4%B8%E0%B5%8D_The_Dark_Knight_2008.mkv?hash=AgAD0A",
      },
      {
        "title": "Pulp Fiction",
        "thumbnail":
            "https://resizing.flixster.com/-XZAfHZM39UwaGJIFWKAE8fS0ak=/v3/t/assets/p15684_p_v8_ai.jpg",
        "description":
            "The lives of two hitmen, a boxer, and others intertwine in tales of violence.",
        "cast": [
          "John Travolta",
          "Samuel L. Jackson",
          "Uma Thurman",
          "Bruce Willis",
          "Ving Rhames",
        ],
        "videoUrl":
            "https://movie.requestbot.workers.dev/1603593/%5BCC%5D.Pulp.Fiction.1994.720p.BrRip.x265.HEVCBay.mkv?hash=AgADfg",
      },
    ],
    "Malayalam": [
      {
        "title": "Premam",
        "thumbnail":
            "https://resizing.flixster.com/tnmyrFEK6lS2pAtt93ASk2Cp07Q=/ems.cHJkLWVtcy1hc3NldHMvbW92aWVzLzJiNTg2MDNiLWJjYTAtNDRkZi05YTlkLTk0MTRhMWU5MzA5MC53ZWJw",
        "description":
            "A coming-of-age romantic drama following George through three stages of love.",
        "cast": [
          "Nivin Pauly",
          "Sai Pallavi",
          "Madonna Sebastian",
          "Anupama Parameswaran",
          "Soubin Shahir",
        ],
        "videoUrl":
            "https://movie.requestbot.workers.dev/1603601/%5BMM%5D+Premam+%282015%29+Malayalam+-+BR-Rip.mkv?hash=AgAD1Q",
      },
      {
        "title": "Drishyam",
        "thumbnail":
            "https://resizing.flixster.com/BlqqNT-QTW7UF26TCWlWoJDVeUw=/ems.cHJkLWVtcy1hc3NldHMvbW92aWVzLzQ0NDJkOWE2LTY3OTQtNGI3OS1hOGZmLTU3ZDNkMTQxMmVkOC53ZWJw",
        "description":
            "A man goes to great lengths to protect his family after a crime.",
        "cast": [
          "Mohanlal",
          "Meena",
          "Asha Sarath",
          "Esther Anil",
          "Ansiba Hassan",
        ],
        "videoUrl":
            "https://movie.requestbot.workers.dev/1603609/%E0%B4%9F%E0%B4%BE%E0%B4%95%E0%B5%8D%E0%B4%95%E0%B5%80%E0%B4%B8%E0%B5%8D_%E0%B4%AE%E0%B5%80%E0%B4%A1%E0%B4%BF%E0%B4%AF_%E0%B4%B1%E0%B4%BF%E0%B4%B2%E0%B5%80%E0%B4%B8%E0%B5%8D_Drishyam_2013.mkv?hash=AgADxQ",
      },
      {
        "title": "Kumbalangi Nights",
        "thumbnail":
            "https://resizing.flixster.com/6bpeD8s6WyhwbnzsYowxl4mZC5o=/ems.cHJkLWVtcy1hc3NldHMvbW92aWVzL2ZhOWFkZTBiLTEwNTYtNGYxYy1iYjliLWQxYzZjOWZlMmM1ZC53ZWJw",
        "description":
            "A tale of four brothers in a dysfunctional family living in a fishing village.",
        "cast": [
          "Fahadh Faasil",
          "Soubin Shahir",
          "Sreenath Bhasi",
          "Shane Nigam",
          "Anna Ben",
        ],
        "videoUrl":
            "https://movie.requestbot.workers.dev/1603619/%40Tamilrockers_TG+-+Kumbalangi+Nights+%5B2019%5D+HDRip.mkv?hash=AgADzA",
      },
      {
        "title": "Minnal Murali",
        "thumbnail":
            "https://resizing.flixster.com/9DXfheQGvFlQV4K-PJOSAgnJ6cc=/ems.cHJkLWVtcy1hc3NldHMvbW92aWVzLzExYmRjOGJhLWUxNmYtNGVmNS04MTUyLTVhZDFjMTczZGUyZC5qcGc=",
        "description":
            "A tailor gains superpowers after being struck by lightning and becomes a local hero.",
        "cast": [
          "Tovino Thomas",
          "Guru Somasundaram",
          "Femina George",
          "Shelly Kishore",
          "Aju Varghese",
        ],
        "videoUrl":
            "https://movie.requestbot.workers.dev/1603629/MINNAL+MURALI+2021+720p+%40ALBCINEMASALL+MALAYALAM+10bit.mkv?hash=AgADBw",
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
      body: SafeArea(
        child: ListView(
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
                              if (event.logicalKey ==
                                      LogicalKeyboardKey.select ||
                                  event.logicalKey ==
                                      LogicalKeyboardKey.enter) {
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
                                        ? Border.all(
                                            color: Colors.red,
                                            width: 3,
                                          )
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
      ),
    );
  }
}
