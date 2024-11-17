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
            ChangeCard(isFavorite: true,),
            ChangeCard(),
            ChangeCard(isFavorite: true,),
            ChangeCard(),
          ],
        ),
      ),
    ));

class ChangeCard extends StatelessWidget {
  final bool? isFavorite;
  const ChangeCard({
    super.key,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    Container? con;
    if (isFavorite == true) {
      con = Container(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Title',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.cyan,
                      ),
                    ),
                    Text(
                      'Description',
                      style: TextStyle(
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
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      con = Container(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Title',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.cyan,
                      ),
                    ),
                    Text(
                      'Description',
                      style: TextStyle(
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
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite,
                ),
              ),
            ),
          ],
        ),
      );
    }
    return con;
  }
}
