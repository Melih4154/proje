import 'dart:async';
import 'package:appbar_textfield/appbar_textfield.dart';
import 'package:flutter/material.dart';
import 'package:proje_app/models/restaurant.dart';

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Restaurant> _allContacts = Restaurant.restaurantList;
  StreamController<List<Restaurant>> _contactStream =
      StreamController<List<Restaurant>>();

  @override
  void initState() {
    _allContacts = List.generate(Restaurant.restaurantList.length, (i) {
      return Restaurant(
          name: Restaurant.restaurantList[i].name,
          rank: Restaurant.restaurantList[i].rank,
          url: Restaurant.restaurantList[i].url);
    });

    _contactStream.add(_allContacts);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarTextField(
          title: Text("Ara"),
          onBackPressed: _onRestoreAllData,
          onClearPressed: _onRestoreAllData,
          onChanged: _onSearchChanged,
          searchContainerColor: Colors.amber,
        ),
        body: _buildBody());
  }

  void _onSearchChanged(String value) {
    List<Restaurant> foundContacts = _allContacts
        .where((Restaurant contact) =>
            contact.name.toLowerCase().indexOf(value.toLowerCase()) > -1)
        .toList();

    this._contactStream.add(foundContacts);
  }

  center() => Center(
        child: Text("deneme"),
      );

  void _onRestoreAllData() {
    this._contactStream.add(this._allContacts);
  }

  Widget _buildBody() {
    return StreamBuilder<List<Restaurant>>(
        stream: _contactStream.stream,
        builder: (context, snapshot) {
          List<Restaurant> contacts = snapshot.hasData ? snapshot.data : [];
          if (contacts.isEmpty) {
            return Center(child: Text("Arama Sonucu Bulunamadı!"));
          }
          return ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              var contact = contacts[index];

              return Card(
                elevation: 5,
                child: ListTile(
                  leading: Card(
                    child: Image(
                      image: NetworkImage(contact.url),
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          contact.name,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text("${contact.name}",
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  subtitle: Text("${contact.rank}"),
                ),
              );
            },
          );
        });
  }

  @override
  void dispose() {
    _contactStream.close();
    super.dispose();
  }
}
