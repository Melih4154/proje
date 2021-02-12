class Product {
  final String productName;
  final String productUrl;
  final double unitPrice;
  final String detail;

  Product({this.productName, this.productUrl, this.unitPrice, this.detail});

   static List<Product> productList = [
    Product(
        productName: "Salata",
        productUrl:
            "https://cdn.pixabay.com/photo/2017/09/16/19/21/salad-2756467_960_720.jpg",
        unitPrice: 15.0,
        detail:
            "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..."),
    Product(
        productName: "Hamburger",
        productUrl:
            "https://cdn.pixabay.com/photo/2016/03/05/19/02/abstract-1238247_960_720.jpg",
        unitPrice: 15.0,
        detail:
            "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..."),
    Product(
        productName: "Kebap",
        productUrl:
            "https://cdn.pixabay.com/photo/2017/07/14/23/25/kebab-2505236_960_720.jpg",
        unitPrice: 15.0,
        detail:
            "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..."),
    Product(
        productName: "Salata",
        productUrl:
            "https://cdn.pixabay.com/photo/2017/09/16/19/21/salad-2756467_960_720.jpg",
        unitPrice: 15.0,
        detail:
            "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..."),
    Product(
        productName: "Hamburger",
        productUrl:
            "https://cdn.pixabay.com/photo/2016/03/05/19/02/abstract-1238247_960_720.jpg",
        unitPrice: 15.0,
        detail:
            "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..."),
    Product(
        productName: "Kebap",
        productUrl:
            "https://cdn.pixabay.com/photo/2017/07/14/23/25/kebab-2505236_960_720.jpg",
        unitPrice: 15.0,
        detail:
            "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..."),
  ];
}
