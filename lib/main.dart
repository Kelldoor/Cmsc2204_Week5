import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Week 6 Git',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Week 6 Git'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading = false;
  List<Customer> customers = [];
  bool isResetVisible = false;

  void loadItems() {
    setState(() {
      isLoading = true;
      isResetVisible = false;
    });

    Future.delayed(const Duration(seconds: 3), () {
      loadMockCustomers();
      setState(() {
        isLoading = false;
        isResetVisible = true;
      });
    });
  }

  void resetPage() {
    setState(() {
      isLoading = false;
      customers.clear();
      isResetVisible = false;
    });
  }

  void loadMockCustomers() {
    customers.clear();

    customers.add(Customer(
      firstName: 'Doge',
      lastName: 'Coin',
      customerID: 99,
      type: 'Saver',
    ));

    customers.add(Customer(
      firstName: 'Bob',
      lastName: 'Something',
      customerID: 98,
      type: 'Spender',
    ));

    customers.add(Customer(
      firstName: 'Brady',
      lastName: 'Peters',
      customerID: 97,
      type: 'Frequent',
    ));

    customers.add(Customer(
      firstName: 'Michael',
      lastName: 'Jordan',
      customerID: 96,
      type: 'Occasional',
    ));

    customers.add(Customer(
      firstName: 'Tom',
      lastName: 'Hanks',
      customerID: 95,
      type: 'Spender',
    ));

    customers.add(Customer(
      firstName: 'George',
      lastName: 'Washington',
      customerID: 94,
      type: 'Saver',
    ));

    customers.add(Customer(
      firstName: 'Peters',
      lastName: 'Brady',
      customerID: 93,
      type: 'Frequent',
    ));

    customers.add(Customer(
      firstName: 'Harry',
      lastName: 'Jackson',
      customerID: 92,
      type: 'Occasional',
    ));

    customers.add(Customer(
      firstName: 'Kendrick',
      lastName: 'Lamar',
      customerID: 91,
      type: 'Saver',
    ));

    customers.add(Customer(
      firstName: 'Bill',
      lastName: 'Gates',
      customerID: 90,
      type: 'Spender',
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: isLoading
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Please Wait'),
                ],
              )
            : customers.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 250,
                        child: FloatingActionButton.extended(
                          onPressed: isLoading ? null : loadItems,
                          label: Text('Load items from database'),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          itemCount: customers.length,
                          separatorBuilder: (context, index) => Divider(
                            color: Colors.black,
                            thickness: 1.0,
                            height: 8.0,
                          ),
                          itemBuilder: (context, index) {
                            final customer = customers[index];
                            return ListTile(
                              title: Text(
                                customer.firstName,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Last Name: ${customer.lastName}'),
                                  Text('CustomerID: ${customer.customerID}'),
                                  Text('Type: ${customer.type}'),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 16),
                      FloatingActionButton(
                        onPressed: resetPage,
                        tooltip: 'Reset Page',
                        child: Icon(Icons.refresh),
                      ),
                    ],
                  ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class Customer {
  final String firstName;
  final String lastName;
  final int customerID;
  final String type;

  Customer({
    required this.firstName,
    required this.lastName,
    required this.customerID,
    required this.type,
  });
}
