import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';

class CheckOrder extends StatefulWidget {
  @override
  _CheckOrderState createState() => _CheckOrderState();
}

class _CheckOrderState extends State<CheckOrder> {
  String note;
  String _selectedPay;
  String selectedAdress;
  String _cardNo, _name;
  bool _pay = false;

  var countriesKey = GlobalKey<FindDropdownState>();
  var payKey = GlobalKey<FindDropdownState>();

  List<String> adress = ['Ev Adresi Açıklaması', 'İş Adresi', 'Aile Evi'];
  List<String> payList = ['Online Ödeme', 'Nakit Ödeme'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ödeme İşlemi'),
        ),
        body: ListView(
          children: [
            _buildAdress(),
            Container(
              height: !_pay ? 80 : 300,
              child: _payOnline(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Tahmini Teslim Süresi : "),
                  SizedBox(
                    width: 20,
                  ),
                  Text('15 Dakika')
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onSaved: (value) => note = value,
                decoration: InputDecoration(
                    hintText: "Sipariş Notu",
                    labelText: 'Sipariş Notu',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(),
                        borderRadius: BorderRadius.circular(8.0))),
              ),
            ),
            buildButton(context),
          ],
        ));
  }

  buildButton(BuildContext context) {
    return InkWell(
      onTap: null, //TODO : Alışverişi tamamla Fonk. yazılacak
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: 45.0,
          decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(8.0)),
          child: Center(
            child: Text(
              "Alışverişi Tamamla",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildAdress() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FindDropdown<String>(
        key: countriesKey,
        items: adress,
        label: "Adres Seçiniz",
        selectedItem: adress[0],
        showSearchBox: false,
        onChanged: (selectedItem) => selectedAdress = selectedItem,
      ),
    );
  }

  _payOnline() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FindDropdown<String>(
            key: payKey,
            items: payList,
            label: "Ödeme Yöntemi Seçiniz",
            selectedItem: "Ödeme Yöntemi Seç",
            showSearchBox: false,
            onChanged: (selectedItem) {
              setState(() {
                _selectedPay = selectedItem;
              });
              _selected();
            },
          ),
        ),
        _formField(
            hint: '**** **** **** ****', title: 'Kart Numarası', des: _cardNo),
        _formField(
            hint: 'Kart sahibinin adı soyadı',
            title: 'Kart üzerindeki isim',
            des: _name),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.3,
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Ay/Yıl alanı boş bırakılamaz';
                      } else if (value.contains('/')) {
                        return 'Ay-Yıl alanını doğru şekilde giriniz';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Ay / Yıl",
                        labelText: 'Son kullanma tarihi',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.circular(8.0))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.3,
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'CVV alanı boş bırakılamaz';
                      } else if (value.trim().length < 2 ||
                          value.trim().length > 3) {
                        return 'CVV alanı doğru şekilde giriniz';
                      } else {}
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "CVC/CVV",
                        labelText: 'Güvenlik kodu',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.circular(8.0))),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  _formField({String title, String hint, String des}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return '$title boş bırakılamaz';
          }
          return null;
        },
        onSaved: (value) => des = value,
        decoration: InputDecoration(
            hintText: hint, //"**** **** **** ****",
            labelText: title, //'Kart Numarası',
            border: OutlineInputBorder(
                borderSide: BorderSide(),
                borderRadius: BorderRadius.circular(8.0))),
      ),
    );
  }

  _selected() {
    if (_selectedPay == 'Nakit Ödeme') {
      setState(() {
        _pay = false;
      });
    } else {
      setState(() {
        _pay = true;
      });
    }
  }
}
