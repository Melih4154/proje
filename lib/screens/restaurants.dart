import 'package:flutter/material.dart';

class Restaurants extends StatefulWidget {
  @override
  _RestaurantsState createState() => _RestaurantsState();
}

class _RestaurantsState extends State<Restaurants>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: controller,
          tabs: [
            Tab(
              icon: Icon(Icons.menu),
              text: "Menü",
            ),
            Tab(
              icon: Icon(Icons.comment),
              text: "Yorumlar",
            ),
          ],
        ),
        title: Text('Restoran Bilgileri'),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          _buildMenu(context),
          _buildComment(),
        ],
      ),
    );
  }

  ListView _buildComment() {
    return ListView(
      children: [
        Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.all(0.0),
                  leading: Container(
                    width: 75,
                    height: 75,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/profile.png"),
                    ),
                  ),
                  title:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 2,
                          child: Text("Hız : 10"),
                        ),
                        Flexible(
                            flex: 2,
                            fit: FlexFit.tight,
                            child: Container(child: Text("Servis : 7"))),
                        Flexible(
                            flex: 2,
                            fit: FlexFit.tight,
                            child: Container(child: Text("Lezzet : 8")))
                      ],
                    
                  ),
                  trailing: Text("2 gün önce"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                      "Hızlı teslim, lezzeti yerinde ancak serviste eksiklikler mevcut. Siparişlerim eksik geldi."),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  _buildMenu(BuildContext context) {
    return ListView(
      children: [
        Card(
          elevation: 5,
          child: Row(
            children: [
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width / 3.5,
                child: Card(
                  elevation: 5,
                  child: Image(
                    image: NetworkImage(
                        "https://cdn.pixabay.com/photo/2015/05/15/14/55/cafe-768771_960_720.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 3 / 5,
                    child: Text(
                      "ZİYA GÖKALP C METRO HAN N 24/12, Kızılay Çankaya ANKARA",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 50,
                            height: 50,
                            color: Colors.amber,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Hız",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("8.8",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 50,
                            height: 50,
                            color: Colors.amber,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Servis",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("8.9",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 50,
                            height: 50,
                            color: Colors.amber,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Lezzet",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("9.1",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Card(
          elevation: 5,
          child: ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "Hamburger",
                style: TextStyle(fontSize: 15),
              ),
            ),
            title: Text("Double Köfte, Patetes Cipsi ve Kola"),
            subtitle: Text("25.0 TL"),
            trailing: Container(
              width: 60,
              height: 60,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://cdn.pixabay.com/photo/2016/03/05/19/02/abstract-1238247_960_720.jpg",
                ),
              ),
            ),
          ),
        ),
        Card(
          elevation: 5,
          child: ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "Hamburger",
                style: TextStyle(fontSize: 15),
              ),
            ),
            title: Text("Double Köfte, Patetes Cipsi ve Kola"),
            subtitle: Text("25.0 TL"),
            trailing: Container(
              width: 60,
              height: 60,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://cdn.pixabay.com/photo/2016/03/05/19/02/abstract-1238247_960_720.jpg",
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
