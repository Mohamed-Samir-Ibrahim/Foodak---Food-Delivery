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
    final size = MediaQuery
        .of(context)
        .size;
    final favoriteFood = food
        .where((foodItem) => foodItem.isFavorite == true)
        .toList();

    return favoriteFood.isNotEmpty
        ? Padding(
      padding: EdgeInsets.all(size.width * 0.016),
            child: ListView.builder(
              itemCount: favoriteFood.length,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(
                      size.width * 0.016,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          favoriteFood[index].imageUrl,
                          height: size.height * 0.07,
                          width: size.width * 0.1,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          width: size.width * 0.04,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                favoriteFood[index].name,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              SizedBox(
                                height:
                                size.height * 0.008,
                              ),
                              Text(
                                '\$ ${favoriteFood[index].price}',
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
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
                            color: Theme.of(context).primaryColor,
                            size: size.width * 0.05,
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
                  height: size.height * 0.35,
                ),
                Text(
                  'No Items Found!',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          );
  }
}
