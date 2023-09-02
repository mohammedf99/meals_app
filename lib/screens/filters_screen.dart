import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
      ),
      body: Column(
        children: [
          SwitchListTile.adaptive(
            value: activeFilters[Filter.glutenFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
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
            value: activeFilters[Filter.lactoseFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, isChecked);
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
            value: activeFilters[Filter.vegeterian]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegeterian, isChecked);
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
            value: activeFilters[Filter.vegan]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegan, isChecked);
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
    );
  }
}
