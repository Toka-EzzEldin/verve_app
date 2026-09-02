import 'package:flutter/material.dart';

// 1. موديل خاص بالـ Grid لمنع التعارض
class GridProductModel {
  final String title;
  final double price;
  final String image;
  final String subTitle;
  final double discount;
  final bool isNew;
  final bool isExcl;

  GridProductModel({
    required this.title,
    required this.price,
    required this.image,
    required this.subTitle,
    required this.discount,
    required this.isNew,
    required this.isExcl,
  });
}

// 2. قائمة منتجات الـ Grid باسم متميز (listOfGridProducts)
final List<GridProductModel> listOfGridProducts = [
  GridProductModel(
    title: "Minimalist Loafers",
    subTitle: "Urban Chic",
    price: 135,
    discount: 10,
    image: "https://images.unsplash.com/photo-1535043934128-cf0b28d52f95?q=80&w=600&auto=format&fit=crop",
    isNew: true,
    isExcl: true,
  ),
  GridProductModel(
    title: "Beanie Winter Cap",
    subTitle: "Cozy Vibe",
    price: 35,
    discount: 0,
    image: "https://images.unsplash.com/photo-1576871337632-b9aef4c17ab9?q=80&w=600&auto=format&fit=crop",
    isNew: true,
    isExcl: false,
  ),
  GridProductModel(
    title: "Golden Optical Frames",
    subTitle: "Specs Lab",
    price: 110,
    discount: 15,
    image: "https://images.unsplash.com/photo-1591076482161-42ce6da69f67?q=80&w=600&auto=format&fit=crop",
    isNew: false,
    isExcl: true,
  ),
  GridProductModel(
    title: "Tailored Smart Blazer",
    subTitle: "Verve Official",
    price: 210,
    discount: 20,
    image: "https://images.unsplash.com/photo-1591047139829-d91aecb6caea?q=80&w=600&auto=format&fit=crop",
    isNew: true,
    isExcl: false,
  ),
  GridProductModel(
    title: "Sport Chronograph Watch",
    subTitle: "Apex Time",
    price: 175,
    discount: 0,
    image: "https://images.unsplash.com/photo-1524805444758-089113d48a6d?q=80&w=600&auto=format&fit=crop",
    isNew: false,
    isExcl: true,
  ),
  GridProductModel(
    title: "Canvas Travel Duffle",
    subTitle: "Voyage",
    price: 160,
    discount: 12,
    image: "https://images.unsplash.com/photo-1553062407-98eeb64c6a62?q=80&w=600&auto=format&fit=crop",
    isNew: true,
    isExcl: false,
  ),
  GridProductModel(
    title: "Olive Crewneck Fleece",
    subTitle: "Basic Wear",
    price: 80,
    discount: 5,
    image: "https://images.unsplash.com/photo-1618354691373-d851c5c3a990?q=80&w=600&auto=format&fit=crop",
    isNew: false,
    isExcl: false,
  ),
  GridProductModel(
    title: "High-Top Sneakers",
    subTitle: "Street Culture",
    price: 145,
    discount: 0,
    image: "https://images.unsplash.com/photo-1552346154-21d32810aba3?q=80&w=600&auto=format&fit=crop",
    isNew: true,
    isExcl: true,
  ),
];

// 3. كارت المنتج الخاص بالـ Grid (GridProductCard)
class GridProductCard extends StatelessWidget {
  const GridProductCard({super.key, required this.productModel});
  final GridProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
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
                    if (productModel.discount > 0)
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: Text(
                          "-${productModel.discount.toInt()}%",
                          style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )
                    else
                      const SizedBox.shrink(),
                    Container(
                      height: 36,
                      width: 36,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_border, color: Colors.grey, size: 20),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    if (productModel.isNew) ...[
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: const Text(
                          "New",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                    ],
                    if (productModel.isExcl)
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          child: const Text(
                            "Exclusive",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
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
        const SizedBox(height: 6),
        Text(productModel.subTitle, style: const TextStyle(fontSize: 14, color: Colors.grey)),
        Text(
          productModel.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          "\$${productModel.price}",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}