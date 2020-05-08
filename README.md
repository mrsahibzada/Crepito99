# Crepito99

A food ordering Mobile Application for both Android & iOS built on Flutter for a Quick Service Restaurant Ćrepito99.

# Motivation

This project intends to make a holistic mobile phone application for a Quick Service Restaurant, Crepito99, which is based in Valencia Town, Lahore. The application will enable customers to directly order food from Crepito 99 online without any intervention by any third party application.

# Code style

A standard coding style is used in the development. A mixture of object-oriented, and procedural programming is used.

# Tech/framework used

Built in Flutter using dart programming language. Backend and Database managed at Firebase implemented with Flutter.

# Features

1. Make User Profile
2. View Latest Deals
3. View Menu Items
4. Add Items in Cart
5. Place Order
6. Redeem Loyalty Points
7. View Order Status
8. View Previous Orders 

# Code Example

    class _TrackOrderState extends State<TrackOrder> {
      String order;
    _TrackOrderState(this.order);
    @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            //Icon button to go to profile
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Profile_page()));
            },
          )
        ],
        backgroundColor: Colors.white,
        title: Text("Tracking",
            textAlign: TextAlign.center, style: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(color: Color(0xFFDB2C27)),
      ),
      body: order == null
          ? Center(
              child: Column(children: <Widget>[
                CheckList(0, progress[0][0], "Order accepted"),
                CheckList(1, progress[0][1], "We are preparing your food!"),
                CheckList(2, progress[0][2], "Your food's on its way!"),
                CheckList(3, progress[0][3], "Order delivered!"),
                Padding(
                  padding: const EdgeInsets.all(63.0),
                  child: Center(
                    child: RaisedButton(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Order More",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        onPressed: () {
                          print("pressed");
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomePage(1)));
                        },
                        color: Color(0xFFDB2C27)),
                  ),
                )
              ]),
            )
          : StreamBuilder(
              stream: Firestore.instance
                  .collection("orders")
                  .document(order)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Text("loading");
                return Center(
                  child: Column(children: <Widget>[
                    CheckList(0, progress[snapshot.data["status"]][0],
                        "Order accepted"),
                    CheckList(1, progress[snapshot.data["status"]][1],
                        "We are preparing your food!"),
                    CheckList(2, progress[snapshot.data["status"]][2],
                        "Your food's on its way!"),
                    CheckList(3, progress[snapshot.data["status"]][3],
                        "Order delivered!"),
                    Padding(
                      padding: const EdgeInsets.all(63.0),
                      child: Center(
                        child: RaisedButton(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Order More",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            onPressed: () {
                              print("pressed");
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => HomePage(1)));
                            },
                            color: Color(0xFFDB2C27)),
                      ),
                    )
                  ]),
                );
              }),
      drawer: Drawer(
          // Drawer that contains additional options at left
          child: ListView(// 4 Options in Drawer
              children: <Widget>[
        CustomDrawerHeader(), // Displays drawer header information
        CustomListItem(
            Icons.flip_to_front,
            'My Orders',
            () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    My_orders()))), // Displays Option in drawer
        CustomListItem(Icons.star, 'Rate us', () => {}),
        CustomListItem(Icons.phone_android, 'Contact us\n03157008877',
            () => launch("tel://03157008877")),
        CustomListItem(
            Icons.face,
            'Sign Out',
            () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => LoginScreen()))),
      ])),
      bottomNavigationBar: bottombar(),
    );
  }
}

# Installation

1. Install Flutter.
2. Install Android Studio.
3. Add flutter plugin to Android Studio.
4. Clone [this](https://github.com/mrsahibzada/Crepito99) GITHUB repository and add it to your Flutter Project.
5. Run the project on either an iOS or an Android emulator.

# API Reference

API's generated from Google Firebase for User Authentication, Database and Storage for the efficient communication of the app with its cashier [web-app portal](https://github.com/MuteeullahBaig/crepito99_web_app).

# How to use?

1. Install Flutter.
2. Install Android Studio.
3. Add flutter plugin to Android Studio.
4. Clone [this](https://github.com/mrsahibzada/Crepito99) GITHUB repository and add it to your Flutter Project.
5. Run the project on either an iOS or an Android emulator.
6. Build an apk Android app using 'flutter build apk'.
7. It will be located in build/app/outputs/apk/release/app-release.apk.
8. Download and install it on an Android Device.
9. Run and kindly report if any bugs found.

# Credits

Contributors:

Sahibzada Sarmad Mansoor Bugvi
https://github.com/mrsahibzada

Hoshi Hamza
https://github.com/HoshiHamza

Ahmad Hassaan Mirza
https://github.com/AhmedHassaanMirza1

Muteeullah Baig
https://github.com/MuteeullahBaig

Qutaiba Rohan Ul Haq
https://github.com/QutaibaRohan
