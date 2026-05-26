import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget orderVoucherItems({required String name, required int number}) {
      return Column(
        children: [
          Text(
            number.toString(),
            style: TextStyle(
              fontSize: MediaQuery.of(context).textScaler.scale(30),
              fontWeight: FontWeight.w600,
              color: Colors.deepOrange,
            ),
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: MediaQuery.of(context).textScaler.scale(18),
            ),
          ),
        ],
      );
    }

    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/images/mohamed.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.016),
        Text(
          'Mohamed Samir',
          style: TextStyle(
            fontSize: MediaQuery.of(context).textScaler.scale(32),
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.016),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            orderVoucherItems(name: 'Orders', number: 50),
            orderVoucherItems(name: 'Vouchers', number: 10),
          ],
        ),
      ],
    );
  }
}
