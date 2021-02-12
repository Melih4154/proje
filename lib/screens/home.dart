import 'package:flutter/material.dart';
import 'package:proje_app/models/restaurant.dart';
import 'package:proje_app/screens/restaurants.dart';
import 'package:proje_app/widget/favorite.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool download = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          favorite(),
          ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: download ? Restaurant.restaurantList.length : 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(
                  8.0,
                ),
                child: Container(
                  height: 150,
                  child: Card(
                    elevation: 5,
                    child: InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Restaurants())),
                      child: Image(
                        image: NetworkImage(
                          Restaurant.restaurantList[index].url,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          download
              ? Center()
              : Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 8.0,
                  ),
                  child: FlatButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      setState(() {
                        download = true;
                      });
                    },
                    child: Text(
                      "Daha Fazla Göster",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
