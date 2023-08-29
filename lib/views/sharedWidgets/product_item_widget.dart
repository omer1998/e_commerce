import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/utilities/appRoutes.dart';
import 'package:e_commerce/utilities/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({required this.product, super.key});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context, rootNavigator: true)
          .pushNamed(AppRoutes.productDetailPage, arguments: product),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(alignment: Alignment.topLeft, children: [
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.network(
                  product.imgUrl,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    //this very useful when the image still loading to enhance ui using circularprogressindicator, you can also use builder when there is error
                    if (loadingProgress == null) return child;
                    return Container(
                      width: 200,
                      height: 200,
                      child: Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Container(
              //   // we can use ClipRRect()
              //   // clipBehavior: Clip.hardEdge,
              //   width: 200,
              //   height: 200,

              //   decoration: BoxDecoration(
              //       image: DecorationImage(
              //           image: NetworkImage(product.imgUrl), fit: BoxFit.cover),
              //       borderRadius: BorderRadius.circular(15)),
              // ),
              product.discountValue != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 12.0),
                      child: SizedBox(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            child: Text(
                              "SALE ${product.discountValue.toString()} %",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(),
              Positioned(
                bottom: 2.0,
                right: 2.0,
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_border_outlined),
                    color: Colors.grey[700],
                  ),
                ),
              ),
              product.isNew != null && product.isNew == true
                  ? Positioned(
                      top: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "NEW",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                            ),
                          ),
                        ),
                      ))
                  : Container(),
            ]),
            RatingBarIndicator(
              rating: product.rate ?? 0.0,
              itemBuilder: (context, index) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 30,
              direction: Axis.horizontal,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
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
                child: product.discountValue != null
                    ? RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "\$${product.price.toString()}",
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey)),
                          TextSpan(
                              text:
                                  " \$${(product.price - (product.price * product.discountValue!) / 100).toString()} ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red))
                        ]),
                      )
                    : Text(
                        "\$${product.price.toString()}",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w500),
                      )),
          ],
        ),
      ),
    );
  }
}
