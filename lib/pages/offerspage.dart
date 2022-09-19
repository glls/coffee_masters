import 'package:flutter/material.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Offer(
          title: "My great offer",
          description: "Buy 1 get 10 free!",
        ),
        Offer(
          title: "My great offer",
          description: "Buy 1 get 10 free!",
        ),
        Offer(
          title: "My great offer",
          description: "Buy 1 get 10 free!",
        ),
        Offer(
          title: "My great offer",
          description: "Buy 1 get 10 free!",
        ),
        Offer(
          title: "My great offer",
          description: "Buy 1 get 10 free!",
        ),
      ],
    );
  }
}

class Offer extends StatelessWidget {
  //properties
  final String title;
  final String description;
  const Offer({Key? key, required this.title, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.amber.shade50,
          elevation: 7,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("images/background.png")),
            ),
            child: Column(
              children: [
                Center(
                    child: Container(
                  color: Colors.amber.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(title,
                          style: Theme.of(context).textTheme.headline5),
                    ),
                  ),
                )),
                Center(
                    child: Container(
                  color: Colors.amber.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(description,
                          style: Theme.of(context).textTheme.headline6),
                    ),
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
