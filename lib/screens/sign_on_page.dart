import 'package:flutter/material.dart';
import 'package:proje_app/widget/app_bar.dart';

class SignOnPage extends StatefulWidget {
  @override
  _SignOnPageState createState() => _SignOnPageState();
}

class _SignOnPageState extends State<SignOnPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool download = false;
  String name, surname, city, title, adress, phone, date, eMail, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: appBar(title: "Hesap Oluştur"),
      body: ListView(
        children: [
          download ? LinearProgressIndicator() : Center(),
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2.2,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "İsim Giriniz.";
                            } else if (value.trim().length < 3) {
                              return "İsim En Az üç Karakter Olmalıdır.";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            name = value;
                          },
                          autocorrect: true,
                          decoration: InputDecoration(
                            labelText: "İsim",
                            errorStyle: TextStyle(fontSize: 13.0),
                            hintText: "İsim",
                            prefixIcon: Icon(
                              Icons.person,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2.2,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Soyisim Giriniz.";
                            } else if (value.trim().length < 2) {
                              return "İsim En Az İki Karakter Olmalıdır.";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            surname = value;
                          },
                          autocorrect: true,
                          decoration: InputDecoration(
                            labelText: "Soyisim",
                            errorStyle: TextStyle(fontSize: 13.0),
                            hintText: "Soyisim",
                            prefixIcon: Icon(
                              Icons.person,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextFormField(
                    keyboardType: TextInputType.datetime,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Doğum Tarihi Giriniz.";
                      } else if (value.trim().length < 2) {
                        return "İsim En Az İki Karakter Olmalıdır.";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      date = value;
                    },
                    autocorrect: true,
                    decoration: InputDecoration(
                      labelText: "Doğum Tarihi",
                      errorStyle: TextStyle(fontSize: 13.0),
                      hintText: "Doğum Tarihi  'GG/AA/YYYY'",
                      prefixIcon: Icon(
                        Icons.date_range_rounded,
                      ),
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Lütfen Email Adresinizi giriniz.";
                      } else if (!value.contains("@")) {
                        return "Girilen Değer Mail formatında olmalı.";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      eMail = value;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(fontSize: 13.0),
                      labelText: "E-Mail",
                      hintText: "Email Adresi",
                      prefixIcon: Icon(
                        Icons.mail,
                      ),
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Lütfen Şifrenizi giriniz.";
                      } else if (value.trim().length < 6) {
                        return "Şİfre 4 karakterden az olamaz.";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      password = value;
                    },
                    autocorrect: true,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Şifre",
                      errorStyle: TextStyle(fontSize: 13.0),
                      labelText: "Şifre",
                      prefixIcon: Icon(
                        Icons.lock,
                      ),
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Lütfen Şifrenizi giriniz.";
                      } else if (value.trim().length < 6) {
                        return "Şİfre 4 karakterden az olamaz.";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      password = value;
                    },
                    autocorrect: true,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Şifre Tekrar",
                      errorStyle: TextStyle(fontSize: 13.0),
                      labelText: "Şifre Tekrar",
                      prefixIcon: Icon(
                        Icons.lock,
                      ),
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Şehir Giriniz.";
                      } else if (value.trim().length < 2 ||
                          value.trim().length > 15) {
                        return "Şehir Adı en az 4 en fazla 15 karakter olmalıdır";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      city = value;
                    },
                    autocorrect: true,
                    decoration: InputDecoration(
                      labelText: "Şehir",
                      errorStyle: TextStyle(fontSize: 13.0),
                      hintText: "Şehir",
                      prefixIcon: Icon(
                        Icons.location_city_sharp,
                      ),
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Adres Başlığı Giriniz.";
                      } else if (value.trim().length < 2 ||
                          value.trim().length > 15) {
                        return "Adres Başlığı en az 2 en fazla 15 karakter olmalıdır";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      title = value;
                    },
                    autocorrect: true,
                    decoration: InputDecoration(
                      labelText: "Adres Başlığı",
                      errorStyle: TextStyle(fontSize: 13.0),
                      hintText: "Adres Başlığı",
                      prefixIcon: Icon(
                        Icons.title,
                      ),
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Adres Giriniz.";
                      } else if (value.trim().length < 10) {
                        return "Adres en az 10  karakter olmalıdır";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      adress = value;
                    },
                    autocorrect: true,
                    decoration: InputDecoration(
                      labelText: "Adres",
                      errorStyle: TextStyle(fontSize: 13.0),
                      hintText: "Adres",
                      prefixIcon: Icon(
                        Icons.home_outlined,
                      ),
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Telefon Numarası Giriniz.";
                      } else if (value.trim().length < 10 ||
                          value.trim().length > 11) {
                        return "Telefon Numarası en az 10 en fazla 11 karakter olmalıdır";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      phone = value;
                    },
                    autocorrect: true,
                    decoration: InputDecoration(
                      labelText: "Telefon",
                      errorStyle: TextStyle(fontSize: 13.0),
                      hintText: "Telefon",
                      prefixIcon: Icon(
                        Icons.phone,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  FlatButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: () => null, // Kayıt Ol Fonksiyonu eklenecek
                    child: Text(
                      "Hesap Oluştur",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
