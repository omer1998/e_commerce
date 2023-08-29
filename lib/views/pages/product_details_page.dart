import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/views/sharedWidgets/auth_btn_widget.dart';
import 'package:e_commerce/views/sharedWidgets/custom_dropdown_form_field.dart';
import 'package:e_commerce/views/sharedWidgets/main_button.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final Product product;
  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.title),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              widget.product.imgUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: size.height * 0.5,
            ),
            SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: CustomDropdownFormField(options: ['S',"M","L", "XL","XXL","XXXL"], hint: "Size", onChanged: (value)=>{})),
                      Spacer(),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white
                        ),
                        child: IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_outlined), color: Colors.grey[700],),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Text(
                          widget.product.title,
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        Text(
                          " \$${widget.product.price.toString()}",
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                            fontWeight: FontWeight.w500
                          ),

                        )
                    ],
                  ),
                  Text(
                      widget.product.category.toString(),
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontSize: 13
                      ),
                    ),
                    SizedBox(height: 6,),
                    Text(
                      "This is a dummy disctription for this nike t shirt, hope we will do much better",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 17
                      ),
                    ),
                    SizedBox(height: 15,),
                    MainButton(onPressed: (){}, btnName: "Add to cart", hasCircularBorder: true,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
