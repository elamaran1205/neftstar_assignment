class Restaurant {
  final String name;
  final String rating;
  final String image;
  final String location;
  Restaurant({
    required this.name,
    required this.rating,
    required this.image,
    required this.location,
  });
}

class RestaurantsData {
  final List<Restaurant> hotels = [
    Restaurant(
      name: "Burger King",
      rating: "4.8",
      image: "images/burger.png",
      location: 'Saint street,Bengaluru',
    ),
    Restaurant(
      name: "Pizza Hut",
      rating: "4.7",
      image: "images/pizza.png",
      location: 'Electronic city,Bengaluru',
    ),
    Restaurant(
      name: "Sushi arena",
      rating: "4.7",
      image: "images/sushi.png",
      location: 'T-Nagar,chennai',
    ),
    Restaurant(
      name: "Non-veg Daba",
      rating: "4.7",
      image: "images/nonveg.png",
      location: 'Happy Street,Pondi',
    ),
    Restaurant(
      name: "Choccy shop",
      rating: "4.7",
      image: "images/choco.png",
      location: 'Saint street,Bengaluru',
    ),
  ];
}
