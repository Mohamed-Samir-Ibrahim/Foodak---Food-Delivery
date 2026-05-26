import 'package:flutter/material.dart';
import 'package:foodak_food_delivery/models/food_item_model.dart';

class FoodGridItem extends StatefulWidget {
  final int foodIndex;

  const FoodGridItem({super.key, required this.foodIndex});

  @override
  State<FoodGridItem> createState() => _FoodGridItemState();
}

class _FoodGridItemState extends State<FoodGridItem> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.016),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: MediaQuery.of(context).size.width * 0.09),
                Row(
                  children: [
                    Image.asset(
                      food[widget.foodIndex].imageUrl,
                      height: MediaQuery.of(context).size.height * 0.08,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.07),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.03,
                      width: MediaQuery.of(context).size.width * 0.03,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        color: Colors.white,
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            food[widget.foodIndex] = food[widget.foodIndex]
                                .copyWith(
                                  isFavorite:
                                      !food[widget.foodIndex].isFavorite,
                                );
                            isFavorite = !isFavorite;
                          });
                        },
                        child: Icon(
                          food[widget.foodIndex].isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.deepOrange,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Text(
              food[widget.foodIndex].name,
              style: TextStyle(
                fontSize: MediaQuery.of(context).textScaler.scale(20),
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '\$ ${food[widget.foodIndex].price}',
              style: TextStyle(
                fontSize: MediaQuery.of(context).textScaler.scale(18),
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
