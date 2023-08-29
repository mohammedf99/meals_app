import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen(
      {super.key, required this.meal, required this.onToggleFavorite});

  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () => onToggleFavorite(meal),
            icon: const Icon(Icons.star),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Text(
              "Ingredients",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            const SizedBox(height: 10),
            for (final ingredient in meal.ingredients)
              Row(
                children: [
                  Icon(
                    Icons.food_bank_outlined,
                    color: Theme.of(context).colorScheme.onBackground,
                    size: 24,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    ingredient,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                ],
              ),
            const SizedBox(height: 16),
            Text(
              "Steps",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            const SizedBox(height: 10),
            for (final step in meal.steps)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.circle,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      step,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}