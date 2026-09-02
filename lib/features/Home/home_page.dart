import 'package:flutter/material.dart';
import 'package:verve/features/Home/components/home_banner_section.dart';
import 'package:verve/features/Home/components/home_category.dart';
import 'package:verve/features/Home/model/Best_model_product.dart';
import 'package:verve/features/Home/model/grid_model_product.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            const HomeBannerSection(),
            const SizedBox(height: 20),

            // Best Seller Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Best Seller",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  TextButton(onPressed: () {}, child: const Text("See all")),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 400,
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 15),
                  itemBuilder: (context, i) =>
                      BestProduct(productModel: listOfProducts[i]),
                  itemCount: listOfProducts.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF0F1424),
                    Color(0xFF162550),
                    Color(0xFF1D35B3),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Winter Sale",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        height: 1.4,
                      ),
                      children: [
                        TextSpan(text: "Stay cozy with up to "),
                        TextSpan(
                          text: "40%",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: " off\nwinter clothing and accessories"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: const Color(0xFF1C1C1E), // خلفية داكنة كما في الصورة
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Sports",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "get in shape",
                    style: TextStyle(color: Colors.white70, fontSize: 15),
                  ),
                  const SizedBox(height: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      "https://images.unsplash.com/photo-1546519638-68e109498ffc?q=80&w=800&auto=format&fit=crop",
                      height: 320,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 400,
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 15),
                  itemBuilder: (context, i) =>
                      BestProduct(productModel: listOfProducts[i]),
                  itemCount: listOfProducts.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            const SizedBox(height: 25),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(
                  0xFF343997,
                ), // اللون الأزرق البنفسجي المأخوذ من التصميم
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // شبكة الصور 2x2
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.8,
                    children: [
                      // 1. صورة الهودي الأصفر
                      ClipRRect(
                        child: Image.network(
                          "https://images.unsplash.com/photo-1556905055-8f358a7a47b2?q=80&w=600&auto=format&fit=crop",
                          fit: BoxFit.cover,
                        ),
                      ),
                      // 2. صورة البنت بالهودي الأسود
                      ClipRRect(
                        child: Image.network(
                          "https://images.unsplash.com/photo-1509967419530-da38b4704bc6?q=80&w=600&auto=format&fit=crop",
                          fit: BoxFit.cover,
                        ),
                      ),
                      // 3. صورة الشاب بالنظارة والهودي الرمادي
                      ClipRRect(
                        child: Image.network(
                          "https://images.unsplash.com/photo-1513789181297-6f2ec112c0bc?q=80&w=600&auto=format&fit=crop",
                          fit: BoxFit.cover,
                        ),
                      ),
                      // 4. صورة الكلب بالهودي الأصفر والأزرق
                      ClipRRect(
                        child: Image.network(
                          "https://images.unsplash.com/photo-1583511655857-d19b40a7a54e?q=80&w=600&auto=format&fit=crop",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // الشريط السفلي: العنوان Inspirational ورابط See all
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      const Text(
                        "Inspirational",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.5,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          "See all",
                          style: TextStyle(
                            color: Color(0xFFB0B3E8),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
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
            ),

            Container(
              width: double.infinity,
              height: 700,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: NetworkImage(
                    "https://png.pngtree.com/thumb_back/fh260/background/20250305/pngtree-men-s-casual-fashion-with-minimalist-styl-image_17068437.jpg",
                  ),
                  fit: BoxFit.cover, // ملء الكونتينر بالكامل بالصورة
                ),
              ),
              child: Container(
                // التدرج المظلم بالأسفل لبروز النص
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                    stops: const [0.6, 1.0],
                  ),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "Summer Essentials",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Get your wardrobe ready for the sun",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
