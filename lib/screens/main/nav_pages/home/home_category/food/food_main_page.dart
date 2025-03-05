import 'package:flutter/material.dart';
import 'package:flutter_food_app/data/food_prime_data.dart';
import 'package:flutter_food_app/screens/main/nav_pages/home/home_category/food/food_detail_page.dart';
import 'package:flutter_food_app/screens/search/search_page.dart';
import 'package:flutter_food_app/theme/style.dart';
import 'package:flutter_food_app/widgets/search_widget.dart';

class FoodMainPage extends StatefulWidget {
  const FoodMainPage({super.key});

  @override
  State<FoodMainPage> createState() => _FoodMainPageState();
}

class _FoodMainPageState extends State<FoodMainPage> {
  int _currentSelectedCategory = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: SearchWidget(onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SearchPage()));
                    }),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                        color: primaryColorED6E1B, shape: BoxShape.circle),
                    child: const Center(
                      child: Icon(
                        Icons.settings_voice,
                        color: whiteColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                "Categories",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _singleCategoryItemWidget(
                      title: "Burger",
                      color: _currentSelectedCategory == 0
                          ? primaryColorED6E1B
                          : Colors.grey[400],
                      onTap: () {
                        setState(() {
                          _currentSelectedCategory = 0;
                        });
                      }),
                  _singleCategoryItemWidget(
                      title: "Pizza",
                      color: _currentSelectedCategory == 1
                          ? primaryColorED6E1B
                          : Colors.grey[400],
                      onTap: () {
                        setState(() {
                          _currentSelectedCategory = 1;
                        });
                      }),
                  _singleCategoryItemWidget(
                      title: "Sandwich",
                      color: _currentSelectedCategory == 2
                          ? primaryColorED6E1B
                          : Colors.grey[400],
                      onTap: () {
                        setState(() {
                          _currentSelectedCategory = 2;
                        });
                      }),
                ],
              ),
              const SizedBox(height: 15),
              const Text(
                "Today Special Offer",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _switchSpecialCategoryOnSelectedIndex(_currentSelectedCategory),
              const SizedBox(height: 20),
              const Text(
                "Popular Now",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              _switchPopularCategoryOnSelectedIndex(_currentSelectedCategory),
            ],
          ),
        ),
      ),
    );
  }

  // SWITCH SPECIAL LIST
  _singleCategoryItemWidget(
      {String? title, Color? color, VoidCallback? onTap}) {
    return Expanded(
        child: GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        width: 110,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        child: Center(
          child: Text(
            "$title",
            style: const TextStyle(color: whiteColor),
          ),
        ),
      ),
    ));
  }

  _buildSpecialBurgerList() {
    return SizedBox(
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: BURGER_SPECIAL_CATEGORY_LIST.map((specialBurger) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => FoodDetailPage(data: specialBurger)));
            },
            child: SizedBox(
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Image.asset(
                      "assets/${specialBurger['image']}",
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${specialBurger['title']}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            "\$5 Delivery Fee 20 - 40 min",
                            style: TextStyle(color: Colors.grey[700]),
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.grey[350], shape: BoxShape.circle),
                        child: Center(
                          child: Text("${specialBurger['rating']}"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  _buildSpecialPizzaList() {
    return SizedBox(
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: PIZZA_SPECIAL_CATEGORY_LIST.map((specialPizza) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => FoodDetailPage(data: specialPizza)));
            },
            child: SizedBox(
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Image.asset(
                      "assets/${specialPizza['image']}",
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${specialPizza['title']}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            "\$5 Delivery Fee 20 - 40 min",
                            style: TextStyle(color: Colors.grey[700]),
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.grey[350], shape: BoxShape.circle),
                        child: Center(
                          child: Text("${specialPizza['rating']}"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  _buildSpecialSandwichList() {
    return SizedBox(
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: SANDWICH_SPECIAL_CATEGORY_LIST.map((specialSandwich) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => FoodDetailPage(data: specialSandwich)));
            },
            child: SizedBox(
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Image.asset(
                      "assets/${specialSandwich['image']}",
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${specialSandwich['title']}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            "\$5 Delivery Fee 20 - 40 min",
                            style: TextStyle(color: Colors.grey[700]),
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.grey[350], shape: BoxShape.circle),
                        child: Center(
                          child: Text("${specialSandwich['rating']}"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  // SWITCH SPECIAL LIST
  _switchSpecialCategoryOnSelectedIndex(int index) {
    switch (index) {
      case 0:
        {
          return _buildSpecialBurgerList();
        }

      case 1:
        {
          return _buildSpecialPizzaList();
        }

      case 2:
        {
          return _buildSpecialSandwichList();
        }
    }
  }

  // SWITCH POPULAR LIST
  _switchPopularCategoryOnSelectedIndex(int index) {
    switch (index) {
      case 0:
        {
          return _buildPopularBurgerList();
        }

      case 1:
        {
          return _buildPopularPizzaList();
        }

      case 2:
        {
          return _buildPopularSandwichList();
        }
    }
  }

  _buildPopularBurgerList() {
    return SizedBox(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: BURGER_POPULAR_CATEGORY_LIST.map(
          (popularBurger) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => FoodDetailPage(data: popularBurger)));
              },
              child: SizedBox(
                width: 180,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Image.asset("assets/${popularBurger['image']}"),
                        ),
                        Positioned(
                            bottom: 20,
                            right: 20,
                            child: Container(
                              width: 50,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: redColor,
                              ),
                              child: const Center(
                                child: Text(
                                  "\$5",
                                  style: TextStyle(color: whiteColor),
                                ),
                              ),
                            ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "${popularBurger['title']}",
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Text("${popularBurger['rating']}"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }

  _buildPopularPizzaList() {
    return SizedBox(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: PIZZA_POPULAR_CATEGORY_LIST.map(
          (popularPizza) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => FoodDetailPage(data: popularPizza)));
              },
              child: SizedBox(
                width: 180,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Image.asset("assets/${popularPizza['image']}"),
                        ),
                        Positioned(
                            bottom: 20,
                            right: 20,
                            child: Container(
                              width: 50,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: redColor,
                              ),
                              child: const Center(
                                child: Text(
                                  "\$5",
                                  style: TextStyle(color: whiteColor),
                                ),
                              ),
                            ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "${popularPizza['title']}",
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Text("${popularPizza['rating']}"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }

  _buildPopularSandwichList() {
    return SizedBox(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: SANDWICH_POPULAR_CATEGORY_LIST.map(
          (popularSandwich) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => FoodDetailPage(data: popularSandwich)));
              },
              child: SizedBox(
                width: 180,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child:
                              Image.asset("assets/${popularSandwich['image']}"),
                        ),
                        Positioned(
                            bottom: 20,
                            right: 20,
                            child: Container(
                              width: 50,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: redColor,
                              ),
                              child: const Center(
                                child: Text(
                                  "\$5",
                                  style: TextStyle(color: whiteColor),
                                ),
                              ),
                            ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "${popularSandwich['title']}",
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Text("${popularSandwich['rating']}"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
