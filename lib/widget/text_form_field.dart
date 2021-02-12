import 'package:flutter/material.dart';

Widget textFormField(
    {String text,
    String initialValue,
    String txt,
    double heigth,
    IconData icon}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: heigth,
      child: Card(
        child: TextFormField(
          maxLines: 3,
          initialValue: initialValue, // TODO:Kullanıcının değerini getir...
          onSaved: (value) => txt = value,
          validator: (value) {
            if (value.isEmpty || value == null) {
              return "Değer boş bırakılamaz";
            }
            return null;
          },
          //value.isEmpty ? "Değer boş bırakılamaz" : null,},
          decoration: InputDecoration(
              prefixIcon: icon != null ? Icon(icon) : null,
              isDense: true,
              contentPadding: EdgeInsets.only(
                top: 35.0,
                left: 8.0,
              ),
              hintText: text,
              labelText: text,
              border: OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.circular(8.0))),
        ),
      ),
    ),
  );
}
