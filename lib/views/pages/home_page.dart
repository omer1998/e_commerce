import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/utilities/assets.dart';
import 'package:e_commerce/views/sharedWidgets/product_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

_buildHeader({
  required BuildContext context,
  required String title,
  required String subtitle,
}){
  return ListTile(
    title: Text(title, style: Theme.of(context).textTheme.headline3!.copyWith(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),),
    subtitle: Text(subtitle, style: Theme.of(context).textTheme.bodySmall!.copyWith(
      color: Colors.black,
    ),),
    trailing: TextButton(
      onPressed: (){},
      child: Text("View All", style: Theme.of(context).textTheme.bodySmall!.copyWith(
        color: Colors.black,
      ),),
    ),
  );
  
}
  @override
  Widget build(BuildContext context) {
    final homeSize = MediaQuery.of(context).size;
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image.network(
                  // opacity: const AlwaysStoppedAnimation(0.3),
                  // the property above is responsible of the opacity of the image
                  AppAssets.topBannerHomeImageAsset2,
                  width: double.infinity,
                  height: homeSize.height * 0.3,
                  fit: BoxFit.cover,
                ),
                Opacity(
                  opacity: 0.4,
                  child: Container(
                    width: double.infinity,
                    height: homeSize.height * 0.3,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Text("Home Page",
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            _buildHeader(
              context: context,
              title: "Sale",
              subtitle: "Super summer sale",
            ),
            SizedBox(
               height: 300,
              child: ListView.builder(
                // padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: dummyProductList.length,
                itemBuilder: (context, index) {
                  return ProductItem(
                    product: dummyProductList[index],
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
            _buildHeader(
              context: context,
              title: "New",
              subtitle: "You've never seen before",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: SizedBox(
                height:300,
                child: ListView.builder(
                  // padding: EdgeInsets.symmetric(horizontal: 16),
                  itemCount: dummyProductList.length,
                  itemBuilder: (context, index) {
                    return ProductItem(
                      product: dummyProductList[index],
                    );
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
      
          ],
      
      
          ),
      ),
      );
  }
}