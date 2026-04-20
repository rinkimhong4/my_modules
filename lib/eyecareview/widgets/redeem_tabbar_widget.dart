import 'package:app_demo/eyecareview/core/models/app_models.dart';
import 'package:app_demo/eyecareview/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class RedeemTabBarWidget extends StatelessWidget {
  const RedeemTabBarWidget({super.key});

  static const _tabs = [
    (icon: Icons.card_giftcard, label: 'Rewards'),
    (icon: Icons.confirmation_num_outlined, label: 'Voucher'),
    (icon: Icons.history, label: 'History'),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = DefaultTabController.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.divider),
          ),
          padding: const EdgeInsets.all(4),
          child: Row(
            children: [
              for (int i = 0; i < _tabs.length; i++)
                _RedeemTab(
                  icon: _tabs[i].icon,
                  label: _tabs[i].label,
                  isActive: controller.index == i,
                  onTap: () => controller.animateTo(i),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _RedeemTab extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _RedeemTab({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isActive ? AppColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                size: 20,
                color: isActive ? Colors.white : AppColors.textSecondary,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: isActive ? Colors.white : AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Tab Content ─────────────────────────────────────────────────────────

class RedeemTabContent extends StatelessWidget {
  const RedeemTabContent({super.key});

  static const _rewards = [
    RewardItem(
      name: 'Lens Cloth Eyecare',
      points: 25,
      icon: Icons.cleaning_services,
    ),
    RewardItem(name: 'Smarty Bag', points: 400, icon: Icons.shopping_bag),
    RewardItem(name: 'Eye Drops', points: 50, icon: Icons.water_drop),
    RewardItem(name: 'Glasses Case', points: 150, icon: Icons.cases_rounded),
  ];

  static const _vouchers = [
    RewardItem(name: '10% Off Lenses', points: 200, icon: Icons.local_offer),
    RewardItem(name: 'Free Eye Check', points: 300, icon: Icons.visibility),
    RewardItem(name: '20% Off Frames', points: 500, icon: Icons.sell),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = DefaultTabController.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: switch (controller.index) {
            0 => _RewardsGrid(key: const ValueKey(0), rewards: _rewards),
            1 => _RewardsGrid(key: const ValueKey(1), rewards: _vouchers),
            _ => const _HistoryEmpty(key: ValueKey(2)),
          },
        );
      },
    );
  }
}

class _HistoryEmpty extends StatelessWidget {
  const _HistoryEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Center(
        child: Column(
          children: [
            Icon(
              Icons.history,
              size: 48,
              color: AppColors.textSecondary.withValues(alpha: 0.4),
            ),
            const SizedBox(height: 12),
            const Text(
              'No history yet',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Rewards Grid ────────────────────────────────────────────────────────

class _RewardsGrid extends StatelessWidget {
  final List<RewardItem> rewards;
  const _RewardsGrid({super.key, required this.rewards});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.85,
      ),
      itemCount: rewards.length,
      itemBuilder: (_, i) => _RewardCard(reward: rewards[i]),
    );
  }
}

class _RewardCard extends StatelessWidget {
  final RewardItem reward;
  const _RewardCard({required this.reward});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.divider),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: SizedBox(
                  width: 70,
                  height: 70,
                  child: Icon(reward.icon, size: 36, color: AppColors.primary),
                ),
              ),
            ),
          ),
          Text(
            reward.name,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          const Divider(height: 1),
          const SizedBox(height: 8),
          Row(
            children: [
              const Text(
                'Point needs to\nclaim:',
                style: TextStyle(fontSize: 10, color: AppColors.textSecondary),
              ),
              const Spacer(),
              Text(
                '${reward.points} POINT',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
