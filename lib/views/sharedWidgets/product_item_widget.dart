import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/utilities/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({required this.product, super.key});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(alignment: Alignment.topLeft, children: [
            Container(
              // we can use ClipRRect()
              // clipBehavior: Clip.hardEdge,
              width: 200,
              height: 200,

              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(product.imgUrl), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(15)
              ),
            ),
            product.rate != null ? Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              child: SizedBox(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Text(
                      "${product.rate.toString()} %",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                ),
              ),
            ): Container()
          ]),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
          child: Text(
            "${product.category}",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.black,
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            "${product.title}",
            style: Theme.of(context)
                .textTheme
                .subtitle2!
                .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '${product.price}\$',
            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  color: Colors.grey,
                ),
          ),
        ),
      ],
    );
  }
}
