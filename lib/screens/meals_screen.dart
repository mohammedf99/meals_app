import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;



  @override
  Widget build(BuildContext context) {

    Widget mainContent = ListView.builder(itemBuilder: (context, index) {
      return MealItem(meal: meals[index]);
    }, itemCount: meals.length,);

    if (meals.isEmpty) {
      mainContent = const Center(
        child: Text('No meals found, please check your filters!', style: TextStyle(color: Colors.white),),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: mainContent,
    );
  }
}