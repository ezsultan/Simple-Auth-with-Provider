import 'package:carousel_slider/carousel_slider.dart';
import 'package:ezcommerce/shared/theme.dart';
import 'package:ezcommerce/widget/custom_widget/category_tile.dart';
import 'package:ezcommerce/widget/custom_widget/countdown_card.dart';
import 'package:ezcommerce/widget/custom_widget/custom_textfield.dart';
import 'package:ezcommerce/widget/custom_widget/flash_sales_tile.dart';
import 'package:ezcommerce/widget/custom_widget/mega_sales_tile.dart';
import 'package:ezcommerce/widget/custom_widget/recomended_product_tile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List image = [
    'assets/image_promotion.png',
    'assets/image_promotion1.jpg',
    'assets/image_promotion2.jpg',
  ];

  List flashSaleImage = [
    'assets/image_shoes.png',
    'assets/image_bag.png',
    'assets/image_wallet.png',
    'assets/image_bag1.png'
  ];

  List megaSaleImage = [
    'assets/image_shoes1.png',
    'assets/image_bag1.png',
    'assets/image_shoes2.png',
    'assets/image_bag2.png'
  ];

  List recomendedProductTile = [
    'assets/image_shoes.png',
    'assets/image_bag.png',
    'assets/image_wallet.png',
    'assets/image_bag1.png',
    'assets/image_shoes1.png',
    'assets/image_bag1.png',
    'assets/image_shoes2.png',
    'assets/image_bag2.png',
  ];

  List text = [
    'Super Flash Sale\n50% Off',
    'Special Offers!\nOnly For U',
    'Buy 3 Get 1\nFree',
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    const double itemHeight = 222;
    const double itemWidth = 140;

    Widget header() {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: CustomTextField(
              hintText: 'Search Product',
              imageUrl: 'assets/icon_search.png',
              color: primaryColor,
            ),
          ),
          const SizedBox(width: 16),
          Image.asset(
            'assets/icon_love.png',
            width: 24,
          ),
          const SizedBox(width: 16),
          Image.asset(
            'assets/icon_notification.png',
            width: 24,
          ),
        ],
      );
    }

    Widget promotionCard() {
      return Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                setState(
                  () {
                    currentIndex = index;
                  },
                );
              },
            ),
            items: image
                .map(
                  (item) => Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(defaultRadius),
                          image: DecorationImage(
                            image: AssetImage(
                              item,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        width: double.infinity,
                        height: 210,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 32,
                        ),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${text[currentIndex]}',
                                style: whiteTextstyle.copyWith(
                                  fontSize: 24,
                                  fontWeight: bold,
                                ),
                              ),
                              const SizedBox(height: 25),
                              Row(
                                children: [
                                  const CountDownCard(
                                    text: '15',
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    ':',
                                    style: whiteTextstyle.copyWith(
                                      fontSize: 24,
                                      fontWeight: extraBold,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  const CountDownCard(
                                    text: '09',
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    ':',
                                    style: whiteTextstyle.copyWith(
                                      fontSize: 24,
                                      fontWeight: extraBold,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  const CountDownCard(
                                    text: '20',
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: image.map((urlOfItem) {
              int index = image.indexOf(urlOfItem);
              return Container(
                width: 8,
                height: 8,
                margin:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == index ? primaryColor : greyColor,
                ),
              );
            }).toList(),
          )
        ],
      );
    }

    Widget categoryTile() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CategoryTiles(
              imageUrl: 'assets/icon_shirt.png',
              text: 'Man shirt',
            ),
            CategoryTiles(
              imageUrl: 'assets/icon_dress.png',
              text: 'Dress',
            ),
            CategoryTiles(
              imageUrl: 'assets/icon_man_bag.png',
              text: 'Man Work\nEquipment',
            ),
            CategoryTiles(
              imageUrl: 'assets/icon_women_bag.png',
              text: 'Woman Bag',
            ),
            CategoryTiles(
              imageUrl: 'assets/icon_man_shoes.png',
              text: 'Man Shoes',
            ),
          ],
        ),
      );
    }

    Widget flashSaleTile() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Flash Sale',
                style: blackTextstyle.copyWith(
                  fontWeight: bold,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('See More'),
              )
            ],
          ),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: flashSaleImage
                  .map((item) => Flashsalestile(imageUrl: item))
                  .toList(),
            ),
          )
        ],
      );
    }

    Widget megaSaleTile() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Mega Sale',
                style: blackTextstyle.copyWith(
                  fontWeight: bold,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('See More'),
              )
            ],
          ),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: megaSaleImage
                  .map(
                    (item) => MegaSaleTile(imageUrl: item),
                  )
                  .toList(),
            ),
          )
        ],
      );
    }

    Widget recomendedProduct() {
      return Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 205,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/image_recomended.png',
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(24, 48, 24, 48),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recomended\nProduct',
                      style: whiteTextstyle.copyWith(
                        fontSize: 24,
                        fontWeight: bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'We recommend the best for you',
                      style: whiteTextstyle.copyWith(
                        fontWeight: light,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          GridView.count(
            physics: const ScrollPhysics(),
            childAspectRatio: (itemWidth / itemHeight),
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            shrinkWrap: true,
            children: recomendedProductTile
                .map(
                  (item) => RecomendedProductTile(
                    imageUrl: item,
                  ),
                )
                .toList(),
          )
        ],
      );
    }

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(height: 15),
              header(),
              const SizedBox(height: 15),
              promotionCard(),
              categoryTile(),
              flashSaleTile(),
              megaSaleTile(),
              const SizedBox(height: 10),
              recomendedProduct(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
