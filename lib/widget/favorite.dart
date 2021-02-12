import 'package:flutter/material.dart';
import 'package:proje_app/models/product.dart';

Widget favorite() {
  return InkWell(
    onTap: () => null, // Kampanyalı ürün fonksiyonu,
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 160.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Product.productList.length,
        itemBuilder: (context, index) {
          return Container(
            width: 160.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Image(
                  image: NetworkImage(Product.productList[index].productUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    ),
  );
}
