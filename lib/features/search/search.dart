import 'package:flutter/material.dart';
import 'package:verve/features/Home/components/home_category.dart';
import 'package:verve/features/Home/model/grid_model_product.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Verve",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        actionsPadding: const EdgeInsets.symmetric(horizontal: 20),
        actions: const [
          Icon(Icons.search, size: 30),
          SizedBox(width: 10),
          Icon(Icons.shopping_bag_rounded, size: 30),
        ],
      ),
      // إزالة الـ Column الخارجية واستخدام SingleChildScrollView بدلاً من ListView الداخلي
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: const HomeCategorySection(),
            ),
            const SizedBox(height: 20),
          Padding(
              padding: const EdgeInsets.all(20),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 16,
                  mainAxisExtent:
                      320, // تم ضبط الارتفاع ليكون أرق وأنسب لتصميم الـ Grid
                ),
                itemCount: listOfGridProducts.length,
                itemBuilder: (context, index) =>
                    GridProductCard(productModel: listOfGridProducts[index]),
              ),
            ),  ],
          
        ),
      ),
    );
  }
}
