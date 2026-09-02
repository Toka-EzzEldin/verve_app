import 'package:flutter/material.dart';

class BestProductModel {
  final String title;
  final double price;
  final String image;
  final String subTitle;
  final double discount;
  final bool isNew;
  final bool isExcl;

  BestProductModel({
    required this.title,
    required this.price,
    required this.image,
    required this.subTitle,
    required this.discount,
    required this.isNew,
    required this.isExcl,
  });
}

final List<BestProductModel> listOfProducts = [
  // 2. المنتج الثاني من الصورة (الحذاء الملون)
  BestProductModel(
    title: "Chucklesome Shoes",
    subTitle: "Hoofin' It",
    price: 100,
    discount: 0,
    image:
        "https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=600&auto=format&fit=crop",
    isNew: true,
    isExcl: false,
  ),
  // 3. جاكيت أسود منفوخ
  BestProductModel(
    title: "Sloppy Puffer Jacket",
    subTitle: "Urban Outfits",
    price: 180,
    discount: 15,
    image:
        "https://images.unsplash.com/photo-1544441893-675973e31985?q=80&w=600&auto=format&fit=crop",
    isNew: false,
    isExcl: true,
  ),
  // 4. جاكيت جينز
  BestProductModel(
    title: "Rocky Denim Class",
    subTitle: "Surf Style",
    price: 120,
    discount: 0,
    image:
        "https://images.unsplash.com/photo-1576995853123-5a10305d93c0?q=80&w=600&auto=format&fit=crop",
    isNew: true,
    isExcl: false,
  ),
  // 5. معطف شتوي وردي
  BestProductModel(
    title: "Cosy Wool Overcoat",
    subTitle: "Main Seasons",
    price: 250,
    discount: 20,
    image:
        "https://images.unsplash.com/photo-1539533018447-63fcce2678e3?q=80&w=600&auto=format&fit=crop",
    isNew: false,
    isExcl: true,
  ),
  // 6. هودي أصفر
  BestProductModel(
    title: "Streetwear Hoodie",
    subTitle: "Inspirational",
    price: 85,
    discount: 5,
    image:
        "https://images.unsplash.com/photo-1556905055-8f358a7a47b2?q=80&w=600&auto=format&fit=crop",
    isNew: true,
    isExcl: false,
  ),
  // 7. عطر رجالي
  BestProductModel(
    title: "Fragrance Elixir",
    subTitle: "Total Essence",
    price: 150,
    discount: 10,
    image:
        "https://images.unsplash.com/photo-1522337360788-8b13dee7a37e?q=80&w=600&auto=format&fit=crop",
    isNew: true,
    isExcl: true,
  ),
  // 8. بطلن جينز كلاسيك
  BestProductModel(
    title: "Casual Slim Denim",
    subTitle: "Verve Basics",
    price: 95,
    discount: 0,
    image:
        "https://images.unsplash.com/photo-1541099649105-f69ad21f3246?q=80&w=600&auto=format&fit=crop",
    isNew: false,
    isExcl: false,
  ),
];

class BestProduct extends StatelessWidget {
  const BestProduct({super.key, required this.productModel});
  final BestProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            width: 235,

            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,

                image: NetworkImage(productModel.image),
              ),
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      child: Text(
                        "-${productModel.discount}%",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_border, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                Row(
                  spacing: 10,
                  children: [
                    if (productModel.isNew == true)
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 6,
                        ),
                        child: Text(
                          "New",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                    if (productModel.isExcl == true)
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 6,
                          ),
                          child: Text(
                            "Exclusive",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Text(" The Blue Banter Co.", style: TextStyle(fontSize: 16)),
        Text(
          productModel.title,

          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          "\$${productModel.price}",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
