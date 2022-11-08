import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:waller_ui/utils/my_button.dart';
import 'package:waller_ui/utils/my_card.dart';
import 'package:waller_ui/utils/my_list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //page controller
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        child: Icon(
          Icons.monetization_on,
          size: 32,
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[200],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.home,
                size: 32,
                color: Colors.pink,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                size: 32,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            //app bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Text(
                        'My',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                      Text(
                        ' Cards',
                        style: TextStyle(fontSize: 28),
                      ),
                    ],
                  ),

                  //add icon
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[400],
                    ),
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            //card
            Container(
              height: 200,
              child: PageView(
                controller: _controller,
                scrollDirection: Axis.horizontal,
                children: const [
                  MyCard(
                    balance: 5250.20,
                    cardNumber: 12345678,
                    expiryMonth: 10,
                    expiryYear: 24,
                    color: Colors.deepOrange,
                  ),
                  MyCard(
                    balance: 523.20,
                    cardNumber: 12345678,
                    expiryMonth: 10,
                    expiryYear: 24,
                    color: Colors.green,
                  ),
                  MyCard(
                    balance: 123.20,
                    cardNumber: 12345678,
                    expiryMonth: 10,
                    expiryYear: 24,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: ExpandingDotsEffect(
                activeDotColor: Colors.grey.shade800,
              ),
            ),

            const SizedBox(height: 40),

            //3 button -> send + pay + bills
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  //send button
                  MyButton(
                    iconImagePath: 'assets/icons/send_money.png',
                    buttonText: 'Send',
                  ),

                  //pay button
                  MyButton(
                    iconImagePath: 'assets/icons/credit_card.png',
                    buttonText: 'Pay',
                  ),

                  //bills button
                  MyButton(
                    iconImagePath: 'assets/icons/bill.png',
                    buttonText: 'Bills',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            //column -> stats + transaction
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: const [
                  //stats
                  MyListTile(
                    iconImagePath: 'assets/icons/statistics.png',
                    tileName: 'Statistics',
                    tileSubName: 'Paymant and Income',
                  ),
                  //transaction
                  MyListTile(
                    iconImagePath: 'assets/icons/transaction.png',
                    tileName: 'Transaction',
                    tileSubName: 'Transaction history',
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
