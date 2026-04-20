import 'package:app_demo/eyecareview/core/data/data.dart';
import 'package:app_demo/eyecareview/views/notification_page.dart';
import 'package:app_demo/eyecareview/views/profile_page.dart';
import 'package:app_demo/eyecareview/widgets/banner_carousel_widget.dart';
import 'package:app_demo/eyecareview/widgets/brand_list_widget.dart';
import 'package:app_demo/eyecareview/widgets/circle_iconbox_widget.dart';
import 'package:app_demo/eyecareview/widgets/last_all_brand_widget.dart';
import 'package:app_demo/eyecareview/widgets/optical_lens_widget.dart';
import 'package:app_demo/eyecareview/widgets/promo_list_widget.dart';
import 'package:app_demo/eyecareview/widgets/section_title.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:app_demo/eyecareview/core/theme/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _bannerController = PageController();
  int _currentBanner = 0;

  @override
  void dispose() {
    _bannerController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      // reload your data here

      // Data.banners = ...
      // Data.promos = ...
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.remove_red_eye, color: AppColors.red, size: 20),
                SizedBox(width: 6),
                Text(
                  'eye care',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primary,
                    letterSpacing: -0.5,
                  ),
                ),
              ],
            ),
            Text(
              'BetterSightBetterLife',
              style: TextStyle(
                fontSize: 10,
                color: AppColors.primaryLight,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: CircleIconBox(
            icon: Icons.menu,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProfilePage()),
              );
            },
          ),
        ),

        actions: [
          CircleIconBox(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const NotificationPage()),
            ),
            icon: Icons.notifications_none_rounded,
          ),
          SizedBox(width: 16),
        ],
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _onRefresh,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                BannerCarouselWidget(
                  banners: Data.banners,
                  controller: _bannerController,
                  currentIndex: _currentBanner,
                  onPageChanged: (i) => setState(() => _currentBanner = i),
                ),
                SizedBox(height: 30),

                SectionTitle(title: 'POPULAR BRAND'),
                SizedBox(height: 8),
                BrandList(
                  brands: Data.brands,
                  productsByBrand: Data.productsByBrand,
                ),
                SizedBox(height: 24),
                SectionTitle(title: 'HIGHLIGHT PROMOTION'),
                SizedBox(height: 12),
                PromoList(promos: Data.promos),
                SizedBox(height: 24),
                SectionTitle(title: 'BIRTHDAY PROMOTION'),
                SizedBox(height: 8),
                _birthDayWidget(),
                SizedBox(height: 24),
                SectionTitle(title: 'OPTICAL LENSES'),
                SizedBox(height: 8),
                OpticalLensWidget(opticalLens: Data.opticalLenses),
                SizedBox(height: 24),
                SectionTitle(title: 'LAST ALL BRAND'),
                SizedBox(height: 8),
                LastAllBrandWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _birthDayWidget() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: 180,
          child: ListView.builder(
            itemCount: 1,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemBuilder: (context, index) {
              return Container(
                width: constraints.maxWidth - 24,
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://img.freepik.com/free-vector/gradient-colorful-birthday-sale-background_23-2149101747.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
