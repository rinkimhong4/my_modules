import 'package:flutter/material.dart';

class BannerItem {
  final String brand;
  final Color color;
  final String imageUrl;
  final String description;
  const BannerItem({
    required this.brand,
    required this.color,
    required this.imageUrl,
    required this.description,
  });
}

class BrandItem {
  final String name;
  final String? subtitle;

  const BrandItem({required this.name, this.subtitle});
}

class PromoItem {
  final String? title;
  final String? subtitle;
  final String imageUrl;
  final String? description;
  final List<Color> gradient;
  const PromoItem({
    this.title,
    this.subtitle,
    required this.gradient,
    required this.imageUrl,
    this.description,
  });
}

// ==============================================================
// ── Models (add to app_models.dart) ─────────────────────────────────────

class OpticalLensesItem {
  final String title;
  final String imageUrl;
  final String? description;
  final List<OpticalLensProduct> products;

  const OpticalLensesItem({
    required this.title,
    required this.imageUrl,
    this.description,
    this.products = const [],
  });
}

class OpticalLensProduct {
  final String name;
  final String imageUrl;
  final String description;
  final List<OpticalBenefit> benefits;
  final String? videoUrl;
  final String? technologyDescription;

  const OpticalLensProduct({
    required this.name,
    required this.imageUrl,
    required this.description,
    this.benefits = const [],
    this.videoUrl,
    this.technologyDescription,
  });
}

class OpticalBenefit {
  final IconData icon;
  final String title;
  final String description;

  const OpticalBenefit({
    required this.icon,
    required this.title,
    required this.description,
  });
}
// ==============================================================

class MemberTier {
  final String name;
  final String nextTier;
  final String? description;
  final int pointsToNext;
  final List<Color> gradient;
  final Color? color;
  final Color shadowColor;

  final IconData badge;

  const MemberTier({
    required this.name,
    required this.nextTier,
    required this.pointsToNext,
    required this.gradient,
    required this.shadowColor,
    required this.badge,
    this.description,
    this.color,
  });
}

class RewardItem {
  final String name;
  final int points;
  final IconData icon;

  const RewardItem({
    required this.name,
    required this.points,
    required this.icon,
  });
}

class Store {
  final String id;
  final String name;
  final String distance;
  final List<String> images;
  final String address;
  final String phone;
  final String hours;
  final String region;
  final bool isOurStore;

  const Store({
    required this.id,
    required this.name,
    required this.distance,
    required this.images,
    required this.address,
    required this.phone,
    required this.hours,
    required this.region,
    required this.isOurStore,
  });
}

//  History

class PrescriptionData {
  final String optician;
  final List<String> rightValues;
  final List<String> leftValues;

  const PrescriptionData({
    required this.optician,
    required this.rightValues,
    required this.leftValues,
  });
}

class InvoiceData {
  final String number;
  final String date;
  final String amount;
  final List<InvoiceItem> items;

  const InvoiceData({
    required this.number,
    required this.date,
    required this.amount,
    required this.items,
  });
}

class InvoiceItem {
  final String no;
  final String description;
  final String qty;

  const InvoiceItem({
    required this.no,
    required this.description,
    required this.qty,
  });
}

class FilterItem {
  final String label;
  final int count;

  FilterItem({required this.label, required this.count});
}

//
class AvailableStore {
  final String name;
  final String mapUrl;

  const AvailableStore({required this.name, required this.mapUrl});
}

//
class ProductItem {
  final String name;
  final List<String> urlImage;
  final double price;
  final Color color;
  final String brand;
  final Map<String, String> specs;
  final List<AvailableStore> availableAt;

  const ProductItem({
    required this.name,
    required this.urlImage,
    required this.price,
    required this.color,
    required this.brand,
    this.specs = const {},
    this.availableAt = const [],
  });
}
// ── Model (add to app_models.dart) ──────────────────────────────────────

class BirthdayPromo {
  final String title;
  final String subtitle;
  final String imageUrl;
  final String validPeriod;
  final List<MembershipBenefit> benefits;
  final List<String> terms;

  const BirthdayPromo({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.validPeriod,
    required this.benefits,
    required this.terms,
  });
}

class MembershipBenefit {
  final String tier;
  final String description;
  final Color color;

  const MembershipBenefit({
    required this.tier,
    required this.description,
    required this.color,
  });
}
