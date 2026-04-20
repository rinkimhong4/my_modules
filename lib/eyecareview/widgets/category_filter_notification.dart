import 'package:app_demo/eyecareview/core/models/app_models.dart';
import 'package:app_demo/eyecareview/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CategoryFilterNotifications extends StatelessWidget {
  final List<FilterItem> filters;
  final int selected;
  final ValueChanged<int> onSelected;

  const CategoryFilterNotifications({
    super.key,
    required this.filters,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: filters.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (_, i) {
          final isActive = selected == i;
          final filter = filters[i];
          return GestureDetector(
            onTap: () => onSelected(i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: isActive ? AppColors.primary : Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isActive ? AppColors.primary : AppColors.divider,
                ),
              ),
              child: Center(
                child: Row(
                  children: [
                    if (isActive)
                      const Padding(
                        padding: EdgeInsets.only(right: 4),
                        child: Icon(Icons.check, color: Colors.white, size: 16),
                      ),
                    Text(
                      filter.count > 0
                          ? '${filter.label} (${filter.count})'
                          : filter.label,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: isActive
                            ? Colors.white
                            : AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
