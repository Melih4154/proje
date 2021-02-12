import 'package:flutter/material.dart';
import 'package:proje_app/widget/app_bar.dart';

class PasswordUpdate extends StatefulWidget {
  @override
  _PasswordUpdateState createState() => _PasswordUpdateState();
}

class _PasswordUpdateState extends State<PasswordUpdate> {
  String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: "Şifre Yenile"),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 50.0, 8.0, 20.0),
            child: Text(
              "Şifrenizi Yenileyebilmek İçin Kayıtlı Mail Adresinizi Giriniz!",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Mail Adresi",
                  labelText: "Mail Adresi",
                  contentPadding: EdgeInsets.all(8.0),
                  prefixIcon: Icon(Icons.email_rounded)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Lütfen Mail Adresi giriniz";
                } else if (value.trim().length < 10 || !value.contains("@")) {
                  return "Lütfen doğru bir mail adresi giriniz!";
                }
                return null;
              },
              onSaved: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              color: Theme.of(context).primaryColor,
              onPressed: () => null, // TODO:Kayıt Ol Fonksiyonu eklenecek
              child: Text(
                "Şifre Gönder",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
