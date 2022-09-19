import 'package:flutter/material.dart';

import '../datamodel.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    var p = Product(
        id: 1, name: "Black Coffee", price: 1.25, image: "black_coffee.png");
    var q = Product(
        id: 2, name: "White Coffee", price: 1.25, image: "black_coffee.png");

    return ListView(children: [
      ProductItem(product: p),
      ProductItem(product: q),
    ]);
  }
}

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("images/${product.image}"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(product.name,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("\$${product.price.toStringAsFixed(2)} ea"),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("Add")),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
