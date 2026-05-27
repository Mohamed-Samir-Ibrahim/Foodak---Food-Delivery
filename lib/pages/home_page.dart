import 'package:flutter/material.dart';
import 'package:foodak_food_delivery/models/food_item_model.dart';
import 'package:foodak_food_delivery/widgets/food_grid_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(size.width * 0.016),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(24.0)),
              child: Image.asset(
                'assets/images/classic_burger.jpg',
                fit: BoxFit.cover,
                height: size.height * 0.2,
              ),
            ),
            SizedBox(height: size.height * 0.08),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: size.height * 0.012,
                crossAxisSpacing: size.width * 0.012,
              ),
              itemCount: food.length,
              itemBuilder: (context, index) {
                return FoodGridItem(foodIndex: index);
              },
            ),
          ],
        ),
      ),
    );
  }
}
