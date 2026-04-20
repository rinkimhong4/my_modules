import 'package:app_demo/eyecareview/core/models/app_models.dart';
import 'package:app_demo/eyecareview/core/theme/app_theme.dart';
import 'package:app_demo/eyecareview/widgets/category_filter_notification.dart';
import 'package:app_demo/eyecareview/widgets/circle_iconbox_widget.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  int _selectedIndex = 0;

  static final _filters = [
    FilterItem(label: 'All', count: 12),
    FilterItem(label: 'NEW ARRIVALS', count: 5),
    FilterItem(label: 'Promotions', count: 4),
    FilterItem(label: 'Birthdays', count: 3),
  ];

  // TODO: replace with real data
  static const _notifications = [
    _NotificationData(
      title: 'New Collection Arrived!',
      body: 'Check out the latest eyewear from Ray-Ban.',
      time: '2 min ago',
      icon: Icons.new_releases_outlined,
      category: 'NEW ARRIVALS',
    ),
    _NotificationData(
      title: '50% Off This Weekend',
      body: 'Use code EYE50 for half off all frames.',
      time: '1 hour ago',
      icon: Icons.local_offer_outlined,
      category: 'Promotions',
    ),
    _NotificationData(
      title: 'Happy Birthday, Lychou!',
      body: 'Enjoy a special 30% birthday discount.',
      time: '3 hours ago',
      icon: Icons.cake_outlined,
      category: 'Birthdays',
    ),
    _NotificationData(
      title: 'Oakley Sport Series',
      body: 'New Oakley sport frames now in stock.',
      time: '1 day ago',
      icon: Icons.new_releases_outlined,
      category: 'NEW ARRIVALS',
    ),
  ];

  List<_NotificationData> get _filtered {
    if (_selectedIndex == 0) return _notifications;
    final category = _filters[_selectedIndex].label;
    return _notifications.where((n) => n.category == category).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: const Text('Notifications'),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleIconBox(
            icon: Icons.arrow_back_ios_new_rounded,
            onTap: () => Navigator.pop(context),
          ),
        ),
      ),
      body: Column(
        children: [
          CategoryFilterNotifications(
            filters: _filters,
            selected: _selectedIndex,
            onSelected: (i) => setState(() => _selectedIndex = i),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: _filtered.isEmpty
                ? const _EmptyState()
                : ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _filtered.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (_, i) =>
                        _NotificationCard(data: _filtered[i]),
                  ),
          ),
        ],
      ),
    );
  }
}

// ── Data ────────────────────────────────────────────────────────────────

class _NotificationData {
  final String title;
  final String body;
  final String time;
  final IconData icon;
  final String category;

  const _NotificationData({
    required this.title,
    required this.body,
    required this.time,
    required this.icon,
    required this.category,
  });
}

// ── Notification Card ───────────────────────────────────────────────────

class _NotificationCard extends StatelessWidget {
  final _NotificationData data;
  const _NotificationCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      elevation: 1,
      shadowColor: Colors.black.withValues(alpha: 0.05),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(12),
              ),
              child: SizedBox(
                width: 44,
                height: 44,
                child: Icon(data.icon, color: AppColors.primary, size: 22),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    data.body,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    data.time,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Empty State ─────────────────────────────────────────────────────────

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.notifications_off_outlined,
            size: 48,
            color: AppColors.textSecondary.withValues(alpha: 0.4),
          ),
          const SizedBox(height: 12),
          const Text(
            'No notifications',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
