import 'package:flutter/material.dart';
import 'package:proje_app/models/product.dart';
import 'package:proje_app/screens/check_order.dart';
import 'package:proje_app/widget/app_bar.dart';

class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: appBar(title: "Siparişler"),
      body: Column(
        children: [
          Card(
            elevation: 5,
            child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: 80,
                child: _buildTopMenu(context)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3, //ProductList.productList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    height: 120,
                    child: Column(
                      children: [
                        Expanded(
                            child: Card(
                          elevation: 5,
                          child: ListTile(
                            leading: Container(
                              width: 35,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.teal),
                                  ),
                                  hintText: "1",
                                ),
                              ),
                            ),
                            title: Text(Product.productList[index].productName),
                            subtitle: Text(Product.productList[index].detail),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(Product.productList[index].unitPrice
                                    .toString()),
                                IconButton(
                                  icon: Icon(Icons.delete_rounded),
                                  onPressed:
                                      null, //TODO: Ürün Silme Fonk. yazılacak
                                ),
                              ],
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CheckOrder())),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 45.0,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                      ),
                      child: Center(
                        child: Text(
                          "Sepeti Onayla",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 45.0,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                    ),
                    child: Center(
                      child: Text(
                        "Toplam : 45.0 TL",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                  child: Text(
                    "ADRES : Street:  TABAKLAR M HATTAT 10/30 BOLU 14100 Merkez Bolu 374 2176771 Turkey",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  _buildTopMenu(BuildContext context) {
    return InkWell(
      onTap: null, // TODO:Restaurant Sayfasına Yönlendirilecek
      child: ListTile(
        contentPadding: EdgeInsets.all(0.0),
        leading: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: FlutterLogo(
            size: 50,
          ),
        ),
        title: Text(
          "Restaurant 1",
          style: TextStyle(fontSize: 25),
        ),
        trailing: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Icon(
            Icons.keyboard_arrow_right_outlined,
            size: 35,
          ),
        ),
      ),
    );
  }
}
