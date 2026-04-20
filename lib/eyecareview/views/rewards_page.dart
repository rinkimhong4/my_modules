import 'package:app_demo/eyecareview/core/data/data.dart';
import 'package:app_demo/eyecareview/core/theme/app_theme.dart';
import 'package:app_demo/eyecareview/widgets/member_card_widget.dart';
import 'package:app_demo/eyecareview/widgets/redeem_tabbar_widget.dart';
import 'package:flutter/material.dart';

class RewardsPage extends StatelessWidget {
  const RewardsPage({super.key});

  static const _tier = Data.gold;
  static const _points = 20;
  static const _barcode = 'AMT00001122';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(title: const Text('My Dashboard')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MemberCardWidget(
                tier: _tier,
                points: _points,
                barcode: _barcode,
              ),
              const SizedBox(height: 28),
              const Text(
                'Redeem Types:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 12),
              const RedeemTabBarWidget(),
              const SizedBox(height: 20),
              const RedeemTabContent(),
            ],
          ),
        ),
      ),
    );
  }
}
