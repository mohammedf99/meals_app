import 'package:flutter/material.dart';


enum Filter {
  glutenFree,
  lactoseFree,
  vegeterian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.selectedFilters});

  final Map<Filter, bool> selectedFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegeterialFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.selectedFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = widget.selectedFilters[Filter.lactoseFree]!;
    _vegeterialFilterSet = widget.selectedFilters[Filter.vegeterian]!;
    _veganFilterSet = widget.selectedFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegeterian: _vegeterialFilterSet,
            Filter.vegan: _veganFilterSet,
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile.adaptive(
              value: _glutenFreeFilterSet,
              onChanged: (v) {
                setState(() {
                  _glutenFreeFilterSet = v;
                });
              },
              title: Text(
                "Gluten-free",
                style: theme.textTheme.titleLarge!.copyWith(
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ),
              subtitle: Text(
                "Only include gluten-free meals.",
                style: theme.textTheme.labelMedium!.copyWith(
                  color: theme.colorScheme.onBackground,
                ),
              ),
              activeColor: theme.colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile.adaptive(
              value: _lactoseFreeFilterSet,
              onChanged: (v) {
                setState(() {
                  _lactoseFreeFilterSet = v;
                });
              },
              title: Text(
                "Lactose-free",
                style: theme.textTheme.titleLarge!.copyWith(
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ),
              subtitle: Text(
                "Only include lactos-free meals.",
                style: theme.textTheme.labelMedium!.copyWith(
                  color: theme.colorScheme.onBackground,
                ),
              ),
              activeColor: theme.colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile.adaptive(
              value: _vegeterialFilterSet,
              onChanged: (v) {
                setState(() {
                  _vegeterialFilterSet = v;
                });
              },
              title: Text(
                "Vegeterian",
                style: theme.textTheme.titleLarge!.copyWith(
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ),
              subtitle: Text(
                "Only include vegeterian meals.",
                style: theme.textTheme.labelMedium!.copyWith(
                  color: theme.colorScheme.onBackground,
                ),
              ),
              activeColor: theme.colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile.adaptive(
              value: _veganFilterSet,
              onChanged: (v) {
                setState(() {
                  _veganFilterSet = v;
                });
              },
              title: Text(
                "Vegan",
                style: theme.textTheme.titleLarge!.copyWith(
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ),
              subtitle: Text(
                "Only include vegan meals.",
                style: theme.textTheme.labelMedium!.copyWith(
                  color: theme.colorScheme.onBackground,
                ),
              ),
              activeColor: theme.colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
