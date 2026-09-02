import 'package:flutter/material.dart';

final listOfCategoryName = <String>[
  "All",
  "Deals",
  "Clothes",
  "News",
  "Bags",
  "Pants",
  "Chips",
  "Offers",
];

class HomeCategorySection extends StatefulWidget {
  const HomeCategorySection({super.key});

  @override
  State<HomeCategorySection> createState() => _HomeCategorySectionState();
}

class _HomeCategorySectionState extends State<HomeCategorySection> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: listOfCategoryName.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return ChoiseChipCategory(
            chipName: listOfCategoryName[i],
            isSelected: i == selectedIndex,
            onSelected: (value) {
              setState(() {
                selectedIndex = i;
              });
            },
          );
        },
      ),
    );
  }
}

class ChoiseChipCategory extends StatelessWidget {
  const ChoiseChipCategory({
    super.key,
    required this.chipName,
    this.isSelected = false,
    required this.onSelected,
  });

  final String chipName;
  final bool isSelected;
  final ValueChanged<bool> onSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).brightness;
    final isDark = theme == Brightness.dark;

    return ChoiceChip(
      selected: isSelected,
      onSelected: onSelected,
      showCheckmark: false,
      selectedColor: isDark ? Colors.white : Colors.black,
      backgroundColor: isDark ? Colors.black : Colors.white,
      label: Text(chipName),
      labelStyle: TextStyle(
        color: isSelected
            ? (isDark ? Colors.black : Colors.white)
            : (isDark ? Colors.white : Colors.black),
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: isDark ? Colors.white : Colors.black,
          width: 1.5,
        ),
      ),
    );
  }
}