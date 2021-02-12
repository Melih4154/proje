import 'package:flutter/material.dart';
import 'package:proje_app/models/adress.dart';
import 'package:proje_app/widget/text_form_field.dart';

class Adresses extends StatefulWidget {
  final Adress adress;

  const Adresses({Key key, this.adress}) : super(key: key);
  @override
  _AdressesState createState() => _AdressesState();
}

class _AdressesState extends State<Adresses> {
  String _adressTitle;
  String _adressDes;
  String _city;

  @override
  Widget build(BuildContext context) {
    return widget.adress.adressTitle != null ? _adressUpdate() : _adressSave();
  }

  _adressUpdate() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adres Güncelle"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.send_rounded,
              size: 30,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: textFormField(
              text: "Adres Başlığı",
              initialValue: widget.adress.adressTitle,
              txt: _adressTitle,
              heigth: 60,
              icon: Icons.title_sharp,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: textFormField(
              text: "Adres ",
              initialValue: widget.adress.adressDescription,
              txt: _adressDes,
              heigth: 100,
              icon: Icons.location_on,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: textFormField(
              text: "Şehir",
              initialValue: widget.adress.adressCity,
              txt: _city,
              heigth: 60,
              icon: Icons.location_city_rounded,
            ),
          ),
        ],
      ),
    );
  }

  _adressSave() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adres Oluştur"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.send_rounded,
              size: 30,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: textFormField(
                text: "Adres Başlığı", txt: _adressTitle, heigth: 60),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: textFormField(text: "Adres ", txt: _adressDes, heigth: 100),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: textFormField(text: "Şehir", txt: _city, heigth: 60),
          ),
        ],
      ),
    );
  }
}
