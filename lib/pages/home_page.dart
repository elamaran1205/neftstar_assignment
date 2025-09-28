import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern_foodapp_assignment/mockData/restaurants_data.dart';
import 'package:intern_foodapp_assignment/utils/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bg1,

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _appBarBlock(),
            _offerCard(),
            _categoriesRow(),
            _fastestNearYou(),
          ],
        ),
      ),
      bottomNavigationBar: _bottomNavBar(),
    );
  }
}

Widget _appBarBlock() {
  return Container(
    decoration: BoxDecoration(
      color: MyColors.black,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(15),
        bottomRight: Radius.circular(15),
      ),
    ),
    child: Column(
      children: [
        SizedBox(height: 20),
        _locationSection(),
        _titleSection(),
        _searchBar(),
      ],
    ),
  );
}

Widget _locationSection() {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Row(
      children: [
        CircleAvatar(
          backgroundColor: MyColors.grey,
          radius: 15,
          child: Icon(
            Icons.location_on_outlined,
            size: 20,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Location", style: TextStyle(color: Colors.white54)),
            Text(
              "Sterling place, Brooklyn",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
        Spacer(),
        CircleAvatar(
          backgroundColor: MyColors.grey,
          radius: 15,
          child: IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () {
              Get.toNamed("/cart");
            },
            icon: Icon(
              Icons.shopping_cart_outlined,
              size: 20,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 8),
        CircleAvatar(
          backgroundColor: MyColors.grey,
          radius: 15,
          child: Icon(Icons.wallet_outlined, size: 20, color: Colors.white),
        ),
      ],
    ),
  );
}

Widget _titleSection() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
    child: Text(
      "What are you going to eat today?",
      style: TextStyle(
        color: MyColors.bg1,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget _searchBar() {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "Search here...",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        CircleAvatar(
          backgroundColor: MyColors.accent,
          child: Icon(Icons.filter_list, color: Colors.black),
        ),
      ],
    ),
  );
}

Widget _offerCard() {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        Row(
          children: [
            Text(
              "Today's Offer!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Spacer(),
            TextButton(onPressed: () {}, child: Text("See All")),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Text(
                      "Free Delivery",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text("Enjoy exclusive discounts\non tasty food today!"),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Text(
                        "Order Now",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Image.asset(
                "images/tileimg1.png",
                height: 160,
                width: 150,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _categoriesRow() {
  final categories = ["Burger", "Pizza", "Sushi", "More"];
  final icons = [
    Icons.fastfood,
    Icons.local_pizza,
    Icons.rice_bowl,
    Icons.more_horiz,
  ];

  return Padding(
    padding: const EdgeInsets.all(13),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(categories.length, (index) {
        return Column(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: MyColors.accent,
              child: Icon(icons[index], color: Colors.black),
            ),
            const SizedBox(height: 6),
            Text(
              categories[index],
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: MyColors.black,
                fontSize: 12,
              ),
            ),
          ],
        );
      }),
    ),
  );
}

Widget _fastestNearYou() {
  final restaurants = RestaurantsData().hotels;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          "Restaurants Near You",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: MyColors.black,
            fontSize: 18,
          ),
        ),
      ),
      const SizedBox(height: 10),
      SizedBox(
        height: 230,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: restaurants.length,
          itemBuilder: (context, index) {
            final item = restaurants[index];
            return InkWell(
              onTap: () {
                final item = restaurants[index];
                Get.toNamed(
                  "/detail",
                  arguments: {
                    "hotelname": item.name,
                    "location": item.location,
                    "hotelimg": item.image,
                  },
                );
              },
              child: Container(
                // height: 250,
                width: 300,
                margin: const EdgeInsets.only(left: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(13),
                          child: Image.asset(
                            item.image,
                            height: 170,
                            width: 300,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 5,
                          left: 5,
                          child: Container(
                            height: 30,
                            width: 65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: MyColors.bg1,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                              ),
                              child: Row(
                                spacing: 3,
                                children: [
                                  Text(
                                    item.rating,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 21,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black,
                                        blurRadius: 2,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        item.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: MyColors.accent,
                            size: 18,
                          ),
                          Text(
                            item.location,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      SizedBox(height: 20),
    ],
  );
}

Widget _bottomNavBar() {
  return BottomNavigationBar(
    backgroundColor: Colors.white,
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.grey,
    type: BottomNavigationBarType.fixed,
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: "Order"),
      BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: "Offer"),
      BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
    ],
  );
}
