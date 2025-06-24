import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Map<String, List<Map<String, String>>> categories = {
    "New": [
      {
        "title": "Oppenheimer",
        "thumbnail":
            "https://m.media-amazon.com/images/M/MV5BMDBmYTZjNjUtN2M1MS00MTQ2LTk2ODgtNzc2M2QyZGE5NTVjXkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_.jpg",
      },
      {
        "title": "Barbie",
        "thumbnail":
            "https://m.media-amazon.com/images/M/MV5BMDBmYTZjNjUtN2M1MS00MTQ2LTk2ODgtNzc2M2QyZGE5NTVjXkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_.jpg",
      },
      {
        "title": "The Marvels",
        "thumbnail":
            "https://m.media-amazon.com/images/M/MV5BMDBmYTZjNjUtN2M1MS00MTQ2LTk2ODgtNzc2M2QyZGE5NTVjXkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_.jpg",
      },
      {
        "title": "Napoleon",
        "thumbnail":
            "https://m.media-amazon.com/images/M/MV5BMDBmYTZjNjUtN2M1MS00MTQ2LTk2ODgtNzc2M2QyZGE5NTVjXkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_.jpg",
      },
    ],
    "Top Rated": [
      {
        "title": "The Shawshank Redemption",
        "thumbnail":
            "https://m.media-amazon.com/images/M/MV5BMDBmYTZjNjUtN2M1MS00MTQ2LTk2ODgtNzc2M2QyZGE5NTVjXkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_.jpg",
      },
      {
        "title": "The Godfather",
        "thumbnail":
            "https://m.media-amazon.com/images/M/MV5BMDBmYTZjNjUtN2M1MS00MTQ2LTk2ODgtNzc2M2QyZGE5NTVjXkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_.jpg",
      },
      {
        "title": "The Dark Knight",
        "thumbnail":
            "https://m.media-amazon.com/images/M/MV5BMDBmYTZjNjUtN2M1MS00MTQ2LTk2ODgtNzc2M2QyZGE5NTVjXkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_.jpg",
      },
      {
        "title": "Pulp Fiction",
        "thumbnail":
            "https://m.media-amazon.com/images/M/MV5BMDBmYTZjNjUtN2M1MS00MTQ2LTk2ODgtNzc2M2QyZGE5NTVjXkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_.jpg",
      },
    ],
    "Malayalam": [
      {
        "title": "Premam",
        "thumbnail":
            "https://m.media-amazon.com/images/M/MV5BMDBmYTZjNjUtN2M1MS00MTQ2LTk2ODgtNzc2M2QyZGE5NTVjXkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_.jpg",
      },
      {
        "title": "Drishyam",
        "thumbnail":
            "https://m.media-amazon.com/images/M/MV5BMDBmYTZjNjUtN2M1MS00MTQ2LTk2ODgtNzc2M2QyZGE5NTVjXkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_.jpg",
      },
      {
        "title": "Kumbalangi Nights",
        "thumbnail":
            "https://m.media-amazon.com/images/M/MV5BMDBmYTZjNjUtN2M1MS00MTQ2LTk2ODgtNzc2M2QyZGE5NTVjXkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_.jpg",
      },
      {
        "title": "Minnal Murali",
        "thumbnail":
            "https://m.media-amazon.com/images/M/MV5BMDBmYTZjNjUtN2M1MS00MTQ2LTk2ODgtNzc2M2QyZGE5NTVjXkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_.jpg",
      },
    ],
    "English": [
      {
        "title": "Inception",
        "thumbnail":
            "https://m.media-amazon.com/images/M/MV5BMDBmYTZjNjUtN2M1MS00MTQ2LTk2ODgtNzc2M2QyZGE5NTVjXkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_.jpg",
      },
      {
        "title": "Interstellar",
        "thumbnail":
            "https://m.media-amazon.com/images/M/MV5BMDBmYTZjNjUtN2M1MS00MTQ2LTk2ODgtNzc2M2QyZGE5NTVjXkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_.jpg",
      },
      {
        "title": "The Matrix",
        "thumbnail":
            "https://m.media-amazon.com/images/M/MV5BMDBmYTZjNjUtN2M1MS00MTQ2LTk2ODgtNzc2M2QyZGE5NTVjXkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_.jpg",
      },
      {
        "title": "Fight Club",
        "thumbnail":
            "https://m.media-amazon.com/images/M/MV5BMDBmYTZjNjUtN2M1MS00MTQ2LTk2ODgtNzc2M2QyZGE5NTVjXkEyXkFqcGdeQXVyNzAwMjU2MTY@._V1_.jpg",
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
                          }
                          return KeyEventResult.ignored;
                        },
                        child: Builder(
                          builder: (context) {
                            final isFocused = Focus.of(context).hasFocus;
                            return GestureDetector(
                              onTap: () {
                                // Handle play or navigation
                                print('Selected: \\${movie['title']}');
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
