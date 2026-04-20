import 'package:app_demo/eyecareview/core/theme/app_theme.dart';
import 'package:app_demo/eyecareview/widgets/circle_iconbox_widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Profile'),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleIconBox(
            icon: Icons.arrow_back_ios_new_rounded,
            onTap: () => Navigator.pop(context),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Card
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: AppColors.divider,
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 32,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Lychou',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Row(
                        children: [
                          const Text(
                            'Gold ',
                            style: TextStyle(
                              fontSize: 13,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const Icon(
                            Icons.emoji_events,
                            size: 16,
                            color: AppColors.gold,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Customer Information
            _SectionHeader('Customer Information'),
            _SettingsGroup(
              items: [
                _SettingsItem(
                  icon: Icons.person_outline,
                  label: 'Manage Profile',
                  onTap: () {},
                ),
                _SettingsItem(
                  icon: Icons.notifications_none,
                  label: 'Notifications',
                  trailing: Switch(
                    value: true,
                    onChanged: (_) {},
                    activeThumbColor: AppColors.primary,
                  ),
                ),
                _SettingsItem(
                  icon: Icons.language,
                  label: 'Language',
                  onTap: () {},
                ),
              ],
            ),

            // Preferences
            _SectionHeader('Preferences'),
            _SettingsGroup(
              items: [
                _SettingsItem(
                  icon: Icons.info_outline,
                  label: 'About Us',
                  onTap: () {},
                ),
                _SettingsItem(
                  icon: Icons.remove_red_eye_outlined,
                  label: 'Last Purchase',
                  onTap: () {},
                ),
              ],
            ),

            // Support
            _SectionHeader('Support'),
            _SettingsGroup(
              items: [
                _SettingsItem(
                  icon: Icons.help_outline,
                  label: 'Help Center',
                  onTap: () {},
                ),
                _SettingsItem(
                  icon: Icons.description_outlined,
                  label: 'Terms of Use',
                  onTap: () {},
                ),
                _SettingsItem(
                  icon: Icons.privacy_tip_outlined,
                  label: 'Privacy Policy',
                  onTap: () {},
                ),
              ],
            ),

            // Sign Out
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Center(
                child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.logout,
                    color: AppColors.red,
                    size: 20,
                  ),
                  label: const Text(
                    'Sign Out',
                    style: TextStyle(
                      color: AppColors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 16, 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}

class _SettingsGroup extends StatelessWidget {
  final List<_SettingsItem> items;
  const _SettingsGroup({required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: items.asMap().entries.map((entry) {
          final i = entry.key;
          final item = entry.value;
          return Column(
            children: [
              item,
              if (i < items.length - 1)
                Padding(
                  padding: const EdgeInsets.only(left: 52),
                  child: Divider(height: 1, color: AppColors.divider),
                ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class _SettingsItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final Widget? trailing;

  const _SettingsItem({
    required this.icon,
    required this.label,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Icon(icon, size: 22, color: AppColors.textSecondary),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 15,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            trailing ??
                const Icon(
                  Icons.chevron_right,
                  color: AppColors.textSecondary,
                  size: 22,
                ),
          ],
        ),
      ),
    );
  }
}
