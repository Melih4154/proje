import 'package:flutter/material.dart';
import 'package:proje_app/screens/home_page.dart';
import 'package:proje_app/screens/password_update.dart';
import 'package:proje_app/screens/sign_on_page.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool download = false;
  String eMail, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          pageElement(context),
          _downloadAnimation(),
        ],
      ),
    );
  }

  Widget _downloadAnimation() {
    if (download) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Center();
    }
  }

  Form pageElement(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
        children: [
          FlutterLogo(size: 90.0),
          SizedBox(height: 80.0),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Lütfen Email Adresinizi giriniz.";
              } else if (!value.contains("@")) {
                return "Girilen Değer Mail formatında olmalı.";
              }
              return null;
            },
            onSaved: (value) => eMail = value,
            autocorrect: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              errorStyle: TextStyle(fontSize: 13.0),
              hintText: "Email Adresi",
              prefixIcon: Icon(
                Icons.mail,
              ),
            ),
          ),
          SizedBox(height: 40.0),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Lütfen Şifrenizi giriniz.";
              } else if (value.trim().length < 4) {
                return "Şİfre 4 karakterden az olamaz.";
              }
              return null;
            },
            onSaved: (value) => password = value,
            autocorrect: true,
            keyboardType: TextInputType.text,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Şifre",
              errorStyle: TextStyle(fontSize: 13.0),
              prefixIcon: Icon(
                Icons.lock,
              ),
            ),
          ),
          SizedBox(height: 40.0),
          Row(
            children: [
              Expanded(
                child: FlatButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SignOnPage()));
                  },
                  child: Text(
                    "Hesap Oluştur",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: FlatButton(
                  color: Theme.of(context).primaryColorDark,
                  onPressed: () => _signInValidate(),
                  child: Text(
                    "Giriş Yap",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Center(child: Text("veya")),
          SizedBox(
            height: 20.0,
          ),
          InkWell(
            onTap: () => null, //TODO: Google ile Giriş yap,
            child: Center(
                child: Text(
              "Gmail ile Giriş Yap",
              style: TextStyle(
                  fontSize: 19.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600]),
            )),
          ),
          SizedBox(
            height: 20.0,
          ),
          Center(
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PasswordUpdate(),
                ),
              ),
              child: Text("Şifremi Unuttum"),
            ),
          ),
        ],
      ),
    );
  }

  _signInValidate() {
    var _formState = _formKey.currentState;
    if (_formState.validate()) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false); // TODO:giriş Yap fonksiyonu Ekle!
    } else {
      return _formState.context;
    }
  }
}
