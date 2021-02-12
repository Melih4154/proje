class Adress {
  final String adressTitle;
  final String adressDescription;
  final String adressCity;

  Adress({this.adressTitle, this.adressDescription, this.adressCity});
  static List<Adress> adressList = [
    Adress(
        adressTitle: "Ev",
        adressDescription:
            "Levent Mah. Mobilyacılar Sitesi. 50 Blok, Kavaklar Cad. No:47 Yüreğir",
        adressCity: "Adana"),
    Adress(
        adressTitle: "İş",
        adressDescription: "KÜÇÜK BALIKLI MH MUHİTTİN KIRCAL SK NO 3",
        adressCity: "Bursa"),
    Adress(
        adressTitle: "Aile",
        adressDescription:
            "İKİTELLİ SAN.BOLG. MUTSAN SAN.SİT. 3 BLOK NO 21, 34306",
        adressCity: "İstanbul")
  ];
}
