import 'package:flutter/material.dart';
import 'package:store_app/Screen/update_product.dart';
import 'package:store_app/models/product_model.dart';

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  CustomCard({
    super.key,
    required this.product,
  });
  ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, UpdateProductScreen.id,
                arguments: product);
          },
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 40,
                  color: Colors.grey.withOpacity(.2),
                  spreadRadius: 0,
                  offset: const Offset(1, 1)),
            ]),
            child: Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title.toString().substring(0, 15),
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            r'$' '${product.price}',
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                          const Icon(Icons.favorite)
                        ],
                      )
                    ],
                  ),
                )),
          ),
        ),
        Positioned(
          right: 10,
          bottom: 70,
          child: Image.network(
            product.image,
            height: 100,
            width: 100,
          ),
        ),
      ],
    );
  }
}







//  GridView.builder(
//             clipBehavior: Clip.none,
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 childAspectRatio: 1.4,
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 100),
//             itemBuilder: (context, index) {
//               return const CustomCard();
//             }),