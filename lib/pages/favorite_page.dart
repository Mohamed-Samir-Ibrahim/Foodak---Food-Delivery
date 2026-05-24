import 'package:flutter/material.dart';

import '../models/food_item_model.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final favoriteFood = food
        .where((foodItem) => foodItem.isFavorite == true)
        .toList();

    return favoriteFood.isEmpty
        ? Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.016),
            child: ListView.builder(
              itemCount: favoriteFood.length,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(
                      MediaQuery.of(context).size.width * 0.016,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          favoriteFood[index].imageUrl,
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width * 0.1,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.04,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                favoriteFood[index].name,
                                style: TextStyle(
                                  fontSize: MediaQuery.of(
                                    context,
                                  ).textScaler.scale(22),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.008,
                              ),
                              Text(
                                '\$ ${favoriteFood[index].price}',
                                style: TextStyle(
                                  fontSize: MediaQuery.of(
                                    context,
                                  ).textScaler.scale(18),
                                  fontWeight: FontWeight.w600,
                                  color: Colors.deepOrange,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            final targetedItem = favoriteFood[index];
                            int targetedIndex = food.indexOf(targetedItem);
                            setState(() {
                              food[targetedIndex] = food[targetedIndex]
                                  .copyWith(isFavorite: false);
                              favoriteFood.remove(targetedItem);
                            });
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.deepOrange,
                            size: MediaQuery.of(context).size.width * 0.05,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        : Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/empty_state.png',
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * 0.35,
                ),
                Text(
                  'No Items Found!',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).textScaler.scale(22),
                  ),
                ),
              ],
            ),
          );
  }
}
