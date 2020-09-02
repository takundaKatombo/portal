import 'package:flutter/material.dart';
import 'package:portal/ui/screens/products.dart';

//TODO:ADD BUTTON TO ADD PRODUCTS AND AN APP BAR
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('DashBoard'),
      ),
      body: ListView(
        children: [
          Wrap(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.redAccent,
                  elevation: 10,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        onTap: () => Navigator.pushNamed(context, '/products'),
                        //leading: Icon(Icons.album, size: 60),
                        title: Text('Products',
                            style: TextStyle(color: Colors.white)),
                        subtitle:
                            Text('37', style: TextStyle(color: Colors.white)),
                      ),
                      FlatButton(
                        child: const Text('View Products',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.redAccent,
                  elevation: 10,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        onTap: () =>
                            Navigator.pushNamed(context, '/categories'),
                        //leading: Icon(Icons.album, size: 50),
                        title: Text('Categories',
                            style: TextStyle(color: Colors.white)),
                        subtitle:
                            Text('4', style: TextStyle(color: Colors.white)),
                      ),
                      FlatButton(
                        child: const Text('View',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.redAccent,
                  elevation: 10,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        onTap: () => Navigator.pushNamed(context, '/users'),
                        //leading: Icon(Icons.album, size: 60),
                        title: Text('Users',
                            style: TextStyle(color: Colors.white)),
                        subtitle:
                            Text('220', style: TextStyle(color: Colors.white)),
                      ),
                      FlatButton(
                        child: const Text('View',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.redAccent,
                  elevation: 10,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        onTap: () => Navigator.pushNamed(context, '/orders'),
                        //leading: Icon(Icons.album, size: 70),
                        title: Text('Orders',
                            style: TextStyle(color: Colors.white)),
                        subtitle:
                            Text('500', style: TextStyle(color: Colors.white)),
                      ),
                      FlatButton(
                        child: const Text('View',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.redAccent,
                  elevation: 10,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        title: Text('Monthly Orders',
                            style: TextStyle(color: Colors.white)),
                      ),
                      Image.asset('assets/orders.png'),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.redAccent,
                  elevation: 10,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        title: Text('Most Selling Product',
                            style: TextStyle(color: Colors.white)),
                      ),
                      Image.asset('assets/piechart.png'),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.redAccent,
                  elevation: 10,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: Text('Sales Report',
                            style: TextStyle(color: Colors.white)),
                      ),
                      Image.asset('assets/sales.png'),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget test() {
    return MaterialApp(
      home: Products(),
    );
  }
}
