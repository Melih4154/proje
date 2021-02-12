import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:proje_app/models/adress.dart';
import 'package:proje_app/models/cities.dart';
import 'package:proje_app/models/language.dart';
import 'package:proje_app/models/restaurant.dart';
import 'package:proje_app/screens/adresses.dart';
import 'package:proje_app/widget/favorite.dart';
import 'package:proje_app/widget/text_form_field.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var cityKey = GlobalKey<FindDropdownState>();
  var languageKey = GlobalKey<FindDropdownState>();
  String value = "";
  String _email, _phone, _date, _name, _surname;
  bool _pasword = false;
  String _oldPassword, _newPassword, _newPasswordRepeat;
  String cities, language;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: value == "" ? _buildListView() : _settings(value),
    );
  }

  ListView _buildListView() {
    return ListView(
      children: [
        _buildBar("Bilgileri Güncelle"),
        _buildProfile(
          "Bilgilerim",
          () {
            setState(() {
              value = "Bilgilerim";
            });
          },
          Icon(Icons.person),
        ),
        _buildProfile(
          "Önceki Siparişler",
          () {
            setState(() {
              value = "Önceki Siparişler";
            });
          },
          Icon(Icons.card_giftcard_outlined),
        ),
        _buildProfile(
          "Favoriler",
          () {
            setState(() {
              value = "Favoriler";
            });
          },
          Icon(Icons.favorite_rounded),
        ),
        _buildProfile(
          "Adreslerim",
          () {
            setState(() {
              value = "Adreslerim";
            });
          },
          Icon(Icons.location_on),
        ),
        _buildProfile(
          "Şehir Değiştir",
          () {
            setState(() {
              value = "Şehir Değiştir";
            });
          },
          Icon(Icons.location_city_sharp),
        ),
        _buildProfile(
          "Uygulama Hakkında",
          () => null, // TODO: uygulamanın bilgileri yazılacak
          Icon(Icons.touch_app),
        ),
        _buildProfile(
          "Uygulamayı Değerlendir",
          () => null, // uygulamanın linkine yönlendir
          Icon(Icons.app_registration),
        ),
        _buildProfile(
          "Dil Değiştir",
          () {
            setState(() {
              value = "Dil Değiştir";
            });
          },
          Icon(Icons.language_rounded),
        ),
        _buildProfile(
          "Güveli Çıkış",
          () => null, // TODO: Uygulamadan çıkış Fonk. yaz,
          Icon(Icons.exit_to_app_rounded),
        ),
      ],
    );
  }

  _buildBar(String title) {
    Adress adress =
        Adress(adressTitle: "", adressDescription: "", adressCity: "");
    return Container(
      color: Theme.of(context).primaryColor,
      child: ListTile(
        contentPadding: EdgeInsets.all(0.0),
        leading: value == ""
            ? Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  "Profil Bilgileri",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              )
            : IconButton(
                icon: Icon(
                  Icons.keyboard_backspace_rounded,
                  color: value != ""
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  setState(() {
                    value = "";
                  });
                }),
        title: value != ""
            ? Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )
            : Center(),
        trailing: IconButton(
          icon: Icon(
            value == "Adreslerim"
                ? Icons.add
                : (value == "Bilgilerim" ? Icons.send_rounded : IconData(1)),
            size: 30,
            color: Colors.white,
          ),
          onPressed: () => value == "Bilgilerim"
              ? null // TODO: Bilgileri kaydet Fonk.
              : (value == "Adreslerim"
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Adresses(
                                adress: adress,
                              )))
                  : null),
        ),
      ),
    );
  }

  _buildProfile(String title, func(), Icon icon) {
    return Card(
      elevation: 5,
      child: ListTile(
        onTap: () => func(),
        leading: icon,
        title: Text(title),
        trailing: Icon(Icons.keyboard_arrow_right_rounded),
      ),
    );
  }

  _settings(String value) {
    if (value == "Bilgilerim") {
      return _profileSettings();
    } else if (value == "Önceki Siparişler") {
      return _buildOrders();
    } else if (value == "Favoriler") {
      return _buildFavorite();
    } else if (value == "Adreslerim") {
      return _myAdresses(value);
    } else if (value == "Dil Değiştir") {
      return ListView(children: [
        _buildBar("Dil Değiştir"),
        Padding(
            padding: EdgeInsets.all(15),
            child: FindDropdown<String>(
              key: languageKey,
              items: Language.language,
              label: "Dil Seçiniz",
              selectedItem: Language.language[0],
              showSearchBox: false,
              onChanged: (selectedItem) => language = selectedItem,
            )),
      ]);
    } else if (value == "Şehir Değiştir") {
      return ListView(
        children: [
          _buildBar("Şehir Değiştir"),
          Padding(
              padding: EdgeInsets.all(15),
              child: FindDropdown<String>(
                key: cityKey,
                items: Cities.cities,
                label: "Dil Seçiniz",
                selectedItem: Cities.cities[0],
                showSearchBox: true,
                searchBoxDecoration: InputDecoration(hintText: "Şehir Ara"),
                onChanged: (selectedItem) => cities = selectedItem,
              )),
        ],
      );
    }
  }

  ListView _myAdresses(String value) {
    return ListView(
      children: [
        _buildBar("Adreslerim"),
        ListView.builder(
          shrinkWrap: true,
          itemCount: Adress.adressList.length,
          itemBuilder: (context, index) {
            final adress = Adress(
                adressTitle: Adress.adressList[index].adressTitle,
                adressDescription: Adress.adressList[index].adressDescription,
                adressCity: Adress.adressList[index].adressCity);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Dismissible(
                direction: DismissDirection.endToStart,
                key: UniqueKey(),
                onDismissed: (direction) async {
                  // TODO : Silme Fonksiyonu Yaz

                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          "${Adress.adressList[index].adressTitle} silindi..."),
                      action: SnackBarAction(
                        label: "Geri Al",
                        onPressed: () {
                          setState(() {
                            // TODO : Adres Ekleme Fonksiyonu Yaz
                          });
                        },
                      ),
                    ),
                  );
                },
                background: Container(
                  color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Icon(
                      Icons.delete_sharp,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
                child: Card(
                  elevation: 5,
                  child: ListTile(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Adresses(
                          adress: adress,
                        ),
                      ),
                    ),
                    leading: Text("${adress.adressTitle}",
                        style: TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.bold)),
                    title: Text(
                        "${adress.adressDescription} ${adress.adressCity}"),
                    trailing: Icon(
                      Icons.keyboard_arrow_right_rounded,
                      size: 50.0,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  ListView _buildFavorite() {
    return ListView(
      children: [
        _buildBar("Favoriler Ürünler"),
        favorite(),
        Container(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  child: ListTile(
                    leading: Card(
                      child: Image(
                        image: NetworkImage(
                          Restaurant.restaurantList[index].url,
                        ),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      elevation: 5,
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                    ),
                    title: Text(Restaurant.restaurantList[index].name),
                    subtitle: Text("Hamburger 3 Adet 15.0 TL"),
                  ),
                );
              }),
        ),
      ],
    );
  }

  ListView _buildOrders() {
    return ListView(
      children: [
        _buildBar("Önceki Siparişler"),
        Container(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  child: ListTile(
                    leading: Card(
                      child: Image(
                        image: NetworkImage(
                          Restaurant.restaurantList[index].url,
                        ),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      elevation: 5,
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                    ),
                    title: Text(Restaurant.restaurantList[index].name),
                    subtitle: Text("Hamburger 3 Adet 15.0 TL"),
                  ),
                );
              }),
        ),
      ],
    );
  }

  ListView _profileSettings() {
    return ListView(
      primary: true,
      shrinkWrap: true,
      children: [
        _buildBar("Bilgileri Güncelle"),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: textFormField(
                    text: "Ad",
                    initialValue: "Melih",
                    txt: _name,
                    heigth: 60,
                    icon: Icons.person),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: textFormField(
                    text: "Soyad",
                    initialValue: "Gökdeniz",
                    txt: _surname,
                    heigth: 60,
                    icon: Icons.person),
              ),
            ],
          ),
        ),
        textFormField(
            text: "Doğum Tarihi",
            initialValue: "13/11/1989",
            txt: _date,
            heigth: 60,
            icon: Icons.date_range_rounded),
        textFormField(
            text: "E-Posta",
            initialValue: "12345@gmail.com",
            txt: _email,
            heigth: 60,
            icon: Icons.mail_rounded),
        textFormField(
            text: "Telefon",
            initialValue: "555 555 55 55",
            txt: _phone,
            heigth: 60,
            icon: Icons.phone_android_rounded),
        Container(
          height: !_pasword ? 0 : 175,
          child: ListView(
            shrinkWrap: true,
            children: [
              textFormField(
                  text: "Eski Şifre",
                  txt: _oldPassword,
                  heigth: 60,
                  icon: Icons.lock_open_rounded),
              textFormField(
                  text: "Yeni Şifre",
                  txt: _newPassword,
                  heigth: 60,
                  icon: Icons.lock_outline_rounded),
              textFormField(
                  text: "Yeni Şifre Tekrar",
                  txt: _newPasswordRepeat,
                  heigth: 60,
                  icon: Icons.lock_outline_rounded),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FlatButton(
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
            onPressed: () {
              setState(() {
                _pasword = !_pasword;
              });
            },
            child: Text(_pasword ? "Sekmeyi Kapat" : "Şifreyi Değiştir"),
          ),
        ),
      ],
    );
  }
}
