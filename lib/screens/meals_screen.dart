import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';
import './meal_details_screen.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
  });

  final String? title;
  final List<Meal> meals;

  void _onSelectMealDetail(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = ListView.builder(
      itemBuilder: (context, index) {
        return MealItem(meal: meals[index], onSelectedTab: _onSelectMealDetail);
      },
      itemCount: meals.length,
    );

    if (meals.isEmpty) {
      mainContent = const Center(
        child: Text(
          'No meals found, please check your filters!',
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    if (title == null) {
      return mainContent;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: mainContent,
    );
  }
}
