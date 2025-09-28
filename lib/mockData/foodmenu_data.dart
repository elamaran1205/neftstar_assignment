import 'package:equatable/equatable.dart';

class Foodmenu extends Equatable {
  final String name;
  final String originalprice;
  final String strikeprice;
  final String rating;
  final String distance;
  final String deliverytime;
  final String image;
  Foodmenu({
    required this.name,
    required this.originalprice,
    required this.strikeprice,
    required this.rating,
    required this.distance,
    required this.deliverytime,
    required this.image,
  });
  @override
  List<Object?> get props => [
    name,
    originalprice,
    strikeprice,
    rating,
    distance,
    deliverytime,
    image,
  ];
}

class FoodMenuData {
  final List<Foodmenu> foods = [
    Foodmenu(
      name: "Sauce Pizza full pack",
      originalprice: "400",
      strikeprice: "599",
      rating: "4.1",
      distance: "3km",
      deliverytime: "30min",
      image: "images/pizzaf.png",
    ),
    Foodmenu(
      name: "Classic Burger Combo",
      originalprice: "250",
      strikeprice: "320",
      rating: "4.3",
      distance: "2km",
      deliverytime: "25min",
      image: "images/burger.png",
    ),
    Foodmenu(
      name: "Chicken Biryani Bucket",
      originalprice: "520",
      strikeprice: "650",
      rating: "4.5",
      distance: "4km",
      deliverytime: "40min",
      image: "images/food/briyani.png",
    ),
    Foodmenu(
      name: "Paneer Butter Masala",
      originalprice: "300",
      strikeprice: "420",
      rating: "4.2",
      distance: "3.5km",
      deliverytime: "35min",
      image: "images/food/paneer.png",
    ),
    Foodmenu(
      name: "Grilled Sandwich Pack",
      originalprice: "180",
      strikeprice: "250",
      rating: "4.0",
      distance: "1.5km",
      deliverytime: "20min",
      image: "images/food/sandwich.png",
    ),
    Foodmenu(
      name: "Veggie Sushi Platter",
      originalprice: "600",
      strikeprice: "750",
      rating: "4.6",
      distance: "5km",
      deliverytime: "45min",
      image: "images/sushi.png",
    ),
    Foodmenu(
      name: "Fried Chicken Bucket",
      originalprice: "450",
      strikeprice: "560",
      rating: "4.4",
      distance: "2.8km",
      deliverytime: "28min",
      image: "images/food/chicken.png",
    ),
    Foodmenu(
      name: "Pasta Alfredo Bowl",
      originalprice: "350",
      strikeprice: "480",
      rating: "4.2",
      distance: "2.3km",
      deliverytime: "30min",
      image: "images/food/pasta.png",
    ),
    Foodmenu(
      name: "Chocolate Lava Cake",
      originalprice: "150",
      strikeprice: "220",
      rating: "4.8",
      distance: "1km",
      deliverytime: "15min",
      image: "images/food/cake.png",
    ),
    Foodmenu(
      name: "Chole Bhature Plate",
      originalprice: "220",
      strikeprice: "300",
      rating: "4.1",
      distance: "2.7km",
      deliverytime: "25min",
      image: "images/food/chole.png",
    ),
  ];
}
