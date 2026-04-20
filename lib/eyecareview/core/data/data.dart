import 'package:app_demo/eyecareview/core/models/app_models.dart';
import 'package:flutter/material.dart';

class Data {
  Data._();
  static const banners = [
    BannerItem(
      brand: 'SKECHERS',
      color: Color(0xFFE8E0D4),
      description: 'Comfortable everyday shoes with soft cushioning.{1}',
      imageUrl:
          'https://cdn.mos.cms.futurecdn.net/qUpR68kHS76nxJgFpxZ6k8-1200-80.jpg',
    ),
    BannerItem(
      brand: 'RAY-BAN',
      color: Color(0xFFD4E0E8),
      description: 'Comfortable everyday shoes with soft cushioning.{2}',
      imageUrl:
          'https://cdn.mos.cms.futurecdn.net/qUpR68kHS76nxJgFpxZ6k8-1200-80.jpg',
    ),
    BannerItem(
      brand: 'OAKLEY',
      color: Color(0xFFD4E8D8),
      description: 'Comfortable everyday shoes with soft cushioning.{3}',
      imageUrl:
          'https://cdn.mos.cms.futurecdn.net/qUpR68kHS76nxJgFpxZ6k8-1200-80.jpg',
    ),
    BannerItem(
      brand: 'GUCCI',
      color: Color(0xFFE8D4D8),
      description: 'Comfortable everyday shoes with soft cushioning.{4}',
      imageUrl:
          'https://cdn.mos.cms.futurecdn.net/qUpR68kHS76nxJgFpxZ6k8-1200-80.jpg',
    ),
  ];

  // static const brands = [
  //   BrandItem(name: 'GUESS'),
  //   BrandItem(name: 'BOLON', subtitle: 'EYEWEAR'),
  //   BrandItem(name: 'MOLSION'),
  //   BrandItem(name: 'Cartier'),
  //   BrandItem(name: 'POLICE'),
  // ];

  static const brands = [
    BrandItem(name: 'Ray-Ban', subtitle: 'SINCE 1937'),
    BrandItem(name: 'Oakley', subtitle: 'BEYOND REASON'),
    BrandItem(name: 'Gucci'),
    BrandItem(name: 'Prada', subtitle: 'MILANO'),
    BrandItem(name: 'Dior', subtitle: 'PARIS'),
  ];
  static final productsByBrand = <String, List<ProductItem>>{
    'Ray-Ban': [
      ProductItem(
        name: 'Aviator Classic',
        urlImage: [
          'https://images.unsplash.com/photo-1572635196237-14b3f281503f?w=400',
          'https://images.unsplash.com/photo-1511499767150-a48a237f0083?w=400',
          'https://images.unsplash.com/photo-1574258495973-f010dfbb5371?w=400',
        ],
        price: 154.00,
        color: Colors.amber,
        brand: 'Ray-Ban',
        specs: {
          'Frame Material': 'METAL',
          'Shape': 'Pilot',
          'Gender': 'Unisex',
          'Size': '58-14 mm',
          'Model': 'RB3025',
          'Category': 'Sunglasses',
        },
        availableAt: [
          AvailableStore(
            name: 'Eye Care Optic AEON Mall Phnom Penh',
            mapUrl: 'https://maps.google.com/?q=Eye+Care+AEON+PP',
          ),
          AvailableStore(
            name: 'Eye Care Optic AEON Mall Sen Sok',
            mapUrl: 'https://maps.google.com/?q=Eye+Care+AEON+Sen+Sok',
          ),
          AvailableStore(
            name: 'Eye Care Optic AEON Mall Sen Sok',
            mapUrl: 'https://maps.google.com/?q=Eye+Care+AEON+Sen+Sok',
          ),
          AvailableStore(
            name: 'Eye Care Optic AEON Mall Sen Sok',
            mapUrl: 'https://maps.google.com/?q=Eye+Care+AEON+Sen+Sok',
          ),
          AvailableStore(
            name: 'Eye Care Optic AEON Mall Sen Sok',
            mapUrl: 'https://maps.google.com/?q=Eye+Care+AEON+Sen+Sok',
          ),
        ],
      ),
      ProductItem(
        name: 'Wayfarer',
        urlImage: [
          'https://images.unsplash.com/photo-1511499767150-a48a237f0083?w=400',
          'https://images.unsplash.com/photo-1572635196237-14b3f281503f?w=400',
        ],
        price: 129.00,
        color: Colors.black,
        brand: 'Ray-Ban',
        specs: {
          'Frame Material': 'ACETATE',
          'Shape': 'Square',
          'Gender': 'Unisex',
          'Size': '52-18 mm',
          'Model': 'RB2140',
          'Category': 'Sunglasses',
        },
        availableAt: [
          AvailableStore(
            name: 'Eye Care Optic AEON Mall Phnom Penh',
            mapUrl: 'https://maps.google.com/?q=Eye+Care+AEON+PP',
          ),
          AvailableStore(
            name: 'Eye Care Optic AEON Mall Phnom Penh',
            mapUrl: 'https://maps.google.com/?q=Eye+Care+AEON+PP',
          ),
          AvailableStore(
            name: 'Eye Care Optic AEON Mall Phnom Penh',
            mapUrl: 'https://maps.google.com/?q=Eye+Care+AEON+PP',
          ),
        ],
      ),
      ProductItem(
        name: 'Clubmaster',
        urlImage: [
          'https://images.unsplash.com/photo-1574258495973-f010dfbb5371?w=400',
          'https://images.unsplash.com/photo-1511499767150-a48a237f0083?w=400',
        ],
        price: 163.00,
        color: Colors.brown,
        brand: 'Ray-Ban',
        specs: {
          'Frame Material': 'ACETATE/METAL',
          'Shape': 'Browline',
          'Gender': 'Unisex',
          'Size': '51-21 mm',
          'Model': 'RB3016',
          'Category': 'Sunglasses',
        },
      ),
    ],
    'Oakley': [
      ProductItem(
        name: 'Holbrook',
        urlImage: [
          'https://images.unsplash.com/photo-1577803645773-f96470509666?w=400',
          'https://images.unsplash.com/photo-1509695507497-903c140c43b0?w=400',
        ],
        price: 178.00,
        color: Colors.blue,
        brand: 'Oakley',
        specs: {
          'Frame Material': 'O-MATTER',
          'Shape': 'Square',
          'Gender': 'Men',
          'Size': '55-18 mm',
          'Model': 'OO9102',
          'Category': 'Sunglasses',
        },
        availableAt: [
          AvailableStore(
            name: 'Eye Care Optic AEON Mall Phnom Penh',
            mapUrl: 'https://maps.google.com/?q=Eye+Care+AEON+PP',
          ),
          AvailableStore(
            name: 'Eye Care Optic Siem Reap 1 (Sivutha)',
            mapUrl: 'https://maps.google.com/?q=Eye+Care+Siem+Reap',
          ),
        ],
      ),
      ProductItem(
        name: 'Frogskins',
        urlImage: [
          'https://images.unsplash.com/photo-1509695507497-903c140c43b0?w=400',
        ],
        price: 142.00,
        color: Colors.green,
        brand: 'Oakley',
        specs: {
          'Frame Material': 'O-MATTER',
          'Shape': 'Square',
          'Gender': 'Unisex',
          'Size': '55-17 mm',
          'Model': 'OO9013',
          'Category': 'Sunglasses',
        },
      ),
    ],
    'Gucci': [
      ProductItem(
        name: 'GG0061S',
        urlImage: [
          'https://images.unsplash.com/photo-1508296695146-257a814070b4?w=400',
        ],
        price: 385.00,
        color: Colors.red,
        brand: 'Gucci',
        specs: {
          'Frame Material': 'ACETATE',
          'Shape': 'Cat Eye',
          'Gender': 'Women',
          'Size': '56-17 mm',
          'Model': 'GG0061S',
          'Category': 'Sunglasses',
        },
        availableAt: [
          AvailableStore(
            name: 'Eye Care Optic AEON Mall Phnom Penh',
            mapUrl: 'https://maps.google.com/?q=Eye+Care+AEON+PP',
          ),
        ],
      ),
    ],
    'Prada': [
      ProductItem(
        name: 'PR 17WS',
        urlImage: [
          'https://images.unsplash.com/photo-1473496169904-658ba7c44d8a?w=400',
        ],
        price: 420.00,
        color: Colors.grey,
        brand: 'Prada',
        specs: {
          'Frame Material': 'ACETATE',
          'Shape': 'Rectangular',
          'Gender': 'Women',
          'Size': '49-20 mm',
          'Model': 'PR17WS',
          'Category': 'Optical Glasses',
        },
        availableAt: [
          AvailableStore(
            name: 'Eye Care Optic AEON Mall Sen Sok',
            mapUrl: 'https://maps.google.com/?q=Eye+Care+AEON+Sen+Sok',
          ),
        ],
      ),
    ],
    'Dior': [
      ProductItem(
        name: 'DiorBlackSuit',
        urlImage: [
          'https://images.unsplash.com/photo-1516642499878-7c12cce2b3d8?w=400',
        ],
        price: 490.00,
        color: Colors.black,
        brand: 'Dior',
        specs: {
          'Frame Material': 'ACETATE',
          'Shape': 'Navigator',
          'Gender': 'Men',
          'Size': '56-18 mm',
          'Model': 'BLACKSUIT S12I',
          'Category': 'Sunglasses',
        },
        availableAt: [
          AvailableStore(
            name: 'Eye Care Optic AEON Mall Phnom Penh',
            mapUrl: 'https://maps.google.com/?q=Eye+Care+AEON+PP',
          ),
        ],
      ),
    ],
    'POLICE': [
      ProductItem(
        name: 'POLICE SPL493',
        urlImage: [
          'https://images.unsplash.com/photo-1577803645773-f96470509666?w=400',
          'https://images.unsplash.com/photo-1509695507497-903c140c43b0?w=400',
          'https://images.unsplash.com/photo-1511499767150-a48a237f0083?w=400',
        ],
        price: 185.00,
        color: Color(0xFF1A1A3E),
        brand: 'POLICE',
        specs: {
          'Frame Material': 'PLASTIC',
          'Shape': 'PLS',
          'Gender': 'Unisex',
          'Size': '54-19 mm',
          'Model': 'SPL493',
          'Item code': 'PLC-PLS-3',
          'Category': 'Sunglasses',
        },
        availableAt: [
          AvailableStore(
            name: 'Eye Care Optic AEON Mall Phnom Penh',
            mapUrl: 'https://maps.google.com/?q=Eye+Care+AEON+PP',
          ),
          AvailableStore(
            name: 'Eye Care Optic Siem Reap 1 (Sivutha)',
            mapUrl: 'https://maps.google.com/?q=Eye+Care+Siem+Reap',
          ),
        ],
      ),
      ProductItem(
        name: 'POLICE SPLF15',
        urlImage: [
          'https://images.unsplash.com/photo-1572635196237-14b3f281503f?w=400',
          'https://images.unsplash.com/photo-1574258495973-f010dfbb5371?w=400',
        ],
        price: 124.00,
        color: Colors.white,
        brand: 'POLICE',
        specs: {
          'Frame Material': 'METAL',
          'Shape': 'PLS',
          'Gender': 'Unisex',
          'Size': '56-17 mm',
          'Model': 'SPLF15',
          'Item code': 'PLC-MTL-1',
          'Category': 'Sunglasses',
        },
        availableAt: [
          AvailableStore(
            name: 'Eye Care Optic AEON Mall Phnom Penh',
            mapUrl: 'https://maps.google.com/?q=Eye+Care+AEON+PP',
          ),
        ],
      ),
      ProductItem(
        name: 'POLICE SPL872K',
        urlImage: [
          'https://images.unsplash.com/photo-1508296695146-257a814070b4?w=400',
        ],
        price: 167.00,
        color: Colors.black,
        brand: 'POLICE',
        specs: {
          'Frame Material': 'PLASTIC',
          'Shape': 'Square',
          'Gender': 'Men',
          'Size': '55-18 mm',
          'Model': 'SPL872K',
          'Item code': 'PLC-SQR-2',
          'Category': 'Sunglasses',
        },
        availableAt: [
          AvailableStore(
            name: 'Eye Care Optic Siem Reap 1 (Sivutha)',
            mapUrl: 'https://maps.google.com/?q=Eye+Care+Siem+Reap',
          ),
        ],
      ),
    ],
  };

  // ── Flat list (all brands combined) ─────────────────────────────────

  static final allProducts = productsByBrand.values
      .expand((list) => list)
      .toList();

  static const promos = [
    PromoItem(
      title: 'Sangkran EYE CARE, BUY 01 GET 01 FREE',
      subtitle: 'Promotion Period: Apr 2, 2026 – Apr 29, 2026',
      imageUrl:
          'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/sunglasses-sun-glass-ad-social-media-template-design-59070c09c1b38fdfba35c775e7eeca74.jpg?ts=1589633675',
      gradient: [Color(0xFF1A237E), Color(0xFF283593)],
      description:
          '✨HAPPY KHMER NEW YEAR✨\n'
          'Sangkran EYE CARE, BUY 01 GET 01 FREE 🎉\n'
          '👉 Buy Frame + Lens get Frame + Lens for free\n'
          '👉 Buy Frame get a frame for free\n'
          '👉 Buy Frame get Sunglasses for free\n'
          '👉 Buy Sunglasses get Sunglasses for free\n\n'
          'To celebrate KHMER NEW YEAR, EYE CARE bring customers with the special offer 🎉\n'
          '⏰ Date: 03/04/2026 to 30/04/2026\n'
          '👉 Terms and conditions apply!',
    ),
    PromoItem(
      title: 'Summer Sale 2026',
      subtitle: 'Promotion Period: May 1, 2026 – May 31, 2026',
      imageUrl:
          'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/sunglasses-sun-glass-ad-social-media-template-design-59070c09c1b38fdfba35c775e7eeca74.jpg?ts=1589633675',
      gradient: [Color(0xFF00838F), Color(0xFF00ACC1)],
      description:
          'Get up to 40% off on all sunglasses this summer!\n'
          'Visit any Eye Care branch to enjoy exclusive deals.',
    ),
  ];
  // ===========================
  // ── Data (add to Data class) ────────────────────────────────────────────

  // ── Data (add to Data class) ────────────────────────────────────────────

  static const opticalLenses = [
    OpticalLensesItem(
      title: 'SINGLE VISION LENS',
      imageUrl:
          'https://images.unsplash.com/photo-1574258495973-f010dfbb5371?w=600',
      description:
          'Single vision lenses are designed to correct vision at one distance, '
          'making them ideal for individuals who need glasses for either near or far sight.',
      products: [
        OpticalLensProduct(
          name: 'Eyezen Start',
          imageUrl:
              'https://images.unsplash.com/photo-1574258495973-f010dfbb5371?w=400',
          description:
              'Eyezen Start is a new generation of single-vision glasses lenses',
          benefits: [
            OpticalBenefit(
              icon: Icons.visibility,
              title: 'Better visual acuity',
              description: 'Optimal vision in all directions of glaze',
            ),
            OpticalBenefit(
              icon: Icons.shield_outlined,
              title: 'Eye protection',
              description: 'Filters harmful blue-violet light from screens',
            ),
            OpticalBenefit(
              icon: Icons.remove_red_eye_outlined,
              title: 'Reduced eye strain',
              description: 'Less fatigue during prolonged screen use',
            ),
          ],
          videoUrl: 'https://example.com/eyezen_start_video.mp4',
          technologyDescription:
              'Unique lenses technology that considers 2 reference points, '
              'for far and near vision. The whole lens surface is optimized according to '
              'object distance and gaze direction, bringing correction throughout the lens '
              'and reducing distortions and aberrations.',
        ),
        OpticalLensProduct(
          name: 'Transition Gen S',
          imageUrl:
              'https://images.unsplash.com/photo-1508296695146-257a814070b4?w=400',
          description:
              'ZEISS / Transitions Gen S adapts seamlessly from indoors to outdoors',
          benefits: [
            OpticalBenefit(
              icon: Icons.wb_sunny_outlined,
              title: 'Fast activation',
              description: 'Darkens in under 30 seconds outdoors',
            ),
            OpticalBenefit(
              icon: Icons.dark_mode_outlined,
              title: 'Quick fade back',
              description: 'Returns to clear in 2 minutes indoors',
            ),
          ],
          technologyDescription:
              'Advanced photochromic molecules react to UV light intensity, '
              'providing seamless transitions between indoor and outdoor environments.',
        ),
      ],
    ),
    OpticalLensesItem(
      title: 'PROGRESSIVE LENS',
      imageUrl:
          'https://images.unsplash.com/photo-1577803645773-f96470509666?w=600',
      description:
          'Progressive lenses provide seamless vision at all distances '
          'without visible lines, ideal for presbyopia correction.',
      products: [
        OpticalLensProduct(
          name: 'Varilux Comfort',
          imageUrl:
              'https://images.unsplash.com/photo-1509695507497-903c140c43b0?w=400',
          description:
              'Smooth transitions from near to far with wide viewing zones',
          benefits: [
            OpticalBenefit(
              icon: Icons.swap_vert,
              title: 'Smooth transition',
              description: 'Seamless shift between near, mid, and far zones',
            ),
            OpticalBenefit(
              icon: Icons.straighten,
              title: 'Wide corridor',
              description: 'Extra-wide intermediate zone for comfortable use',
            ),
          ],
        ),
      ],
    ),
  ];

  static const silver = MemberTier(
    name: 'SILVER',
    nextTier: 'GOLD',
    pointsToNext: 800,
    gradient: [Color(0xFFB0B0B0), Color(0xFF8A8A8A), Color(0xFFB0B0B0)],
    shadowColor: Color(0xFF9E9E9E),
    badge: Icons.workspace_premium,
  );

  static const gold = MemberTier(
    name: 'GOLD',
    nextTier: 'DIAMOND',
    pointsToNext: 1500,
    gradient: [Color(0xFFD4A843), Color(0xFFB8942E), Color(0xFFD4A843)],
    shadowColor: Color(0xFFD4A843),
    badge: Icons.emoji_events,
  );

  static const diamond = MemberTier(
    name: 'DIAMOND',
    nextTier: 'PLATINUM',
    pointsToNext: 3000,
    gradient: [Color(0xFF7EC8E3), Color(0xFF4A9CC7), Color(0xFF7EC8E3)],
    shadowColor: Color(0xFF7EC8E3),
    badge: Icons.diamond,
  );

  static const platinum = MemberTier(
    name: 'PLATINUM',
    nextTier: '',
    pointsToNext: 0,
    gradient: [Color(0xFF2C2C2C), Color(0xFF1A1A1A), Color(0xFF3A3A3A)],
    shadowColor: Color(0xFF424242),
    badge: Icons.stars,
  );

  // store
  static const stores = [
    Store(
      name: 'EYE CARE AEON MALL MEAN CHEY',
      distance: '4.9 km away',
      address: 'Store 147, 1st Floor, AEON Mall Mean Chey',
      phone: '+855 76 444 5506',
      hours: '08:30 - 22:00',
      region: 'Phnom Penh Capital',
      images: [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPlBcrWaiuroT9iwSf4z1M8WkvFG8dUB_tng&s",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPlBcrWaiuroT9iwSf4z1M8WkvFG8dUB_tng&s",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPlBcrWaiuroT9iwSf4z1M8WkvFG8dUB_tng&s",
      ],
      id: '1',
      isOurStore: true,
    ),
    Store(
      name: 'EYE CARE AEON MALL SEN SOK',
      distance: '7.2 km away',
      address: 'Store 215, 2nd Floor, AEON Mall Sen Sok',
      phone: '+855 76 444 5507',
      hours: '08:30 - 22:00',
      region: 'Phnom Penh Capital',
      images: [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPlBcrWaiuroT9iwSf4z1M8WkvFG8dUB_tng&s",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIIPNP9cwIA2i2L01b13ZYyuraf47T0Ytqhg&s",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxq7nmG9MeBjjTsx9HBi0_cneAQDiM0bwDYA&s",
      ],
      id: '2',
      isOurStore: false,
    ),
    Store(
      name: 'EYE CARE TK AVENUE',
      distance: '3.1 km away',
      address: 'Ground Floor, TK Avenue, St. 63',
      phone: '+855 76 444 5508',
      hours: '09:00 - 21:00',
      region: 'Phnom Penh Capital',
      images: [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPlBcrWaiuroT9iwSf4z1M8WkvFG8dUB_tng&s",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIIPNP9cwIA2i2L01b13ZYyuraf47T0Ytqhg&s",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxq7nmG9MeBjjTsx9HBi0_cneAQDiM0bwDYA&s",
      ],
      id: '',
      isOurStore: true,
    ),
  ];
  //

  static const prescription = PrescriptionData(
    optician: 'IM Vitou',
    rightValues: ['000', '000', '0', '000', '', '0', '0'],
    leftValues: ['000', '000', '0', '000', '', '0', '0'],
  );

  static const invoice = InvoiceData(
    number: 'AM25000867',
    date: '08-Aug-2025',
    amount: '140.6',
    items: [
      InvoiceItem(no: '001', description: 'Frame', qty: '1'),
      InvoiceItem(no: '002', description: 'Lens', qty: '2'),
      InvoiceItem(no: '003', description: 'Other', qty: '1'),
      InvoiceItem(no: '004', description: 'Other', qty: '1'),
    ],
  );

  // ── Data (add to Data class) ────────────────────────────────────────────

  static const birthdayPromo = BirthdayPromo(
    title: 'Happy Birthday! 🎂',
    subtitle: 'A special gift just for you',
    imageUrl:
        'https://img.freepik.com/free-vector/gradient-colorful-birthday-sale-background_23-2149101747.jpg',
    validPeriod: 'Valid during your birthday month',
    benefits: [
      MembershipBenefit(
        tier: 'Silver Membership',
        description:
            'receive 15% off on all purchases during your birthday vouchers',
        color: Color(0xFF9E9E9E),
      ),
      MembershipBenefit(
        tier: 'Gold Membership',
        description:
            'receive 20% off on all purchases during your birthday vouchers',
        color: Color(0xFFD4A843),
      ),
      MembershipBenefit(
        tier: 'Diamond Membership',
        description:
            'receive 25% off on all purchases during your birthday vouchers',
        color: Color(0xFF4A9CC7),
      ),
      MembershipBenefit(
        tier: 'Platinum Membership',
        description:
            'receive 30% off on all purchases during your birthday vouchers',
        color: Color(0xFF424242),
      ),
    ],
    terms: [
      'Voucher can be used for both in-store and online purchases.',
      'Voucher cannot be combined with other promotions or discounts.',
      'Voucher is non-transferable and cannot be exchanged for cash.',
      'Valid for one-time use only during the birthday month.',
      'Terms and conditions apply. See website for details.',
    ],
  );
}
