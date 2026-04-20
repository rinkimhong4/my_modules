import 'package:app_demo/eyecareview/core/data/data.dart';
import 'package:app_demo/eyecareview/core/models/app_models.dart';
import 'package:app_demo/eyecareview/core/theme/app_theme.dart';
import 'package:app_demo/eyecareview/widgets/category_filters_widget.dart';
import 'package:app_demo/eyecareview/widgets/store_card_widget.dart';
import 'package:flutter/material.dart';

class StoresPage extends StatefulWidget {
  const StoresPage({super.key});

  @override
  State<StoresPage> createState() => _StoresPageState();
}

class _StoresPageState extends State<StoresPage> {
  int _selectedFilter = 0;
  bool showOurStores = true;
  String searchQuery = '';

  static const _filters = [
    'All',
    'Phnom Penh Capital',
    'Battambang',
    'Siem Reap',
  ];

  List<Store> get _baseList => showOurStores
      ? Data.stores.where((s) => s.isOurStore).toList()
      : Data.stores.where((s) => !s.isOurStore).toList();

  List<Store> get _regionFiltered {
    if (_selectedFilter == 0) return _baseList;
    return _baseList
        .where((s) => s.region == _filters[_selectedFilter])
        .toList();
  }

  List<Store> get _finalList {
    if (searchQuery.isEmpty) return _regionFiltered;

    return _regionFiltered.where((s) {
      final q = searchQuery.toLowerCase();
      return s.name.toLowerCase().contains(q) ||
          s.address.toLowerCase().contains(q) ||
          s.region.toLowerCase().contains(q);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Store Locations')),
      body: Column(
        children: [
          searchBar(),
          const SizedBox(height: 4),

          CategoryFilters(
            filters: _filters,
            selected: _selectedFilter,
            onSelected: (i) => setState(() => _selectedFilter = i),
          ),

          const SizedBox(height: 12),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _finalList.length,
              itemBuilder: (_, i) {
                return StoreCardWidget(store: _finalList[i]);
              },
            ),
          ),

          const SizedBox(height: 70),
        ],
      ),
    );
  }

  Widget searchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 44,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.divider),
              ),
              child: TextField(
                onChanged: (value) {
                  setState(() => searchQuery = value);
                },
                decoration: const InputDecoration(
                  hintText: 'Search store...',
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.search,
                    color: AppColors.textSecondary,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 8),

          GestureDetector(
            onTap: () {
              setState(() {
                showOurStores = !showOurStores;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.swap_horiz, color: Colors.white, size: 18),
                  const SizedBox(width: 4),
                  Text(
                    showOurStores ? 'Our Stores' : 'Partner Stores',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
