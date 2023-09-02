import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/filters_provider.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  @override
  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegeterialFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    super.initState();
    final activeFilters = ref.read(filtersProvider);
    _glutenFreeFilterSet = activeFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = activeFilters[Filter.lactoseFree]!;
    _vegeterialFilterSet = activeFilters[Filter.vegeterian]!;
    _veganFilterSet = activeFilters[Filter.vegan]!;
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
          ref.read(filtersProvider.notifier).setFilters({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegeterian: _vegeterialFilterSet,
            Filter.vegan: _veganFilterSet,
          });
          return true;
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
