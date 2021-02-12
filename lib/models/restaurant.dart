class Restaurant {
  final String name;
  final String url;
  final int rank;

  Restaurant({this.name, this.url, this.rank});

   static List<Restaurant> restaurantList = [
    Restaurant(
      name: "Restaurant 1",
      url:
          "https://cdn.pixabay.com/photo/2015/05/15/14/55/cafe-768771_960_720.jpg",
      rank: 5,
    ),
    Restaurant(
      name: "Restaurant 2",
      url:
          "https://cdn.pixabay.com/photo/2018/07/14/15/27/cafe-3537801_960_720.jpg",
      rank: 4,
    ),
    Restaurant(
      name: "Restaurant 3",
      url:
          "https://cdn.pixabay.com/photo/2016/11/18/14/05/brick-wall-1834784_960_720.jpg",
      rank: 3,
    ),
    Restaurant(
      name: "Restaurant 4",
      url:
          "https://cdn.pixabay.com/photo/2015/03/26/09/54/restaurant-690569_960_720.jpg",
      rank: 2,
    ),
    Restaurant(
      name: "Restaurant 5",
      url:
          "https://cdn.pixabay.com/photo/2016/11/29/12/54/bar-1869656_960_720.jpg",
      rank: 1,
    ),
    Restaurant(
      name: "Restaurant 6",
      url:
          "https://cdn.pixabay.com/photo/2016/11/18/22/21/architecture-1837150_960_720.jpg",
      rank: 3,
    ),
    Restaurant(
      name: "Restaurant 7",
      url:
          "https://cdn.pixabay.com/photo/2019/09/12/15/21/resort-4471852_960_720.jpg",
      rank: 5,
    ),
  ];
}
