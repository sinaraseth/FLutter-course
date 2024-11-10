import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Favorite cards"),
        ),
        body: const Column(
          children: [
            FavoriteCard(
              tittle: 'Flutter',
              describtion:
                  'Flutter is the new model language that hybrid for build the application',
            ),
            FavoriteCard(
              tittle: 'C++',
              describtion:
                  'C++ is tone language that grow for first code and it is the foundamental of student to study too',
            ),
            FavoriteCard(
              tittle: 'PHP',
              describtion:
                  'PHP is the language for write backed of web application',
            ),
            FavoriteCard(
              tittle: 'CSS',
              describtion:
                  'CSS is the code that use to design animation of web application',
            ),
            FavoriteCard(
              tittle: 'HTML',
              describtion:
                  'HTML is the code use for design front end of web applicationt',
            ),
          ],
        ),
      ),
    ));

class FavoriteCard extends StatefulWidget {
  final String? tittle;
  final String? describtion;
  const FavoriteCard({
    super.key,
    this.tittle,
    this.describtion,
  });

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  Color? iconColor = Colors.black;
  bool isFavorite = false;
  // ignore: non_constant_identifier_names
  void favorite_changeIcon() {
    setState(() {
      if (isFavorite = !isFavorite) {
        iconColor = Colors.red;
      } else {
        iconColor = Colors.black;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.tittle}',
                    style: const TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.cyan,
                    ),
                  ),
                  Text(
                    '${widget.describtion}',
                    style: const TextStyle(
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: IconButton(
              onPressed: favorite_changeIcon,
              icon: Icon(
                Icons.favorite,
                color: iconColor,
              ),
            ),
          ),
        ],
      ),
    );
    // return con;
  }
}
