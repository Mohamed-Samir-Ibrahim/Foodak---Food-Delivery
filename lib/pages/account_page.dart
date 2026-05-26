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

    Widget onTileTapped({
      required String title,
      required IconData icon,
      String? suTitle,
    }) {
      return ListTile(
        onTap: () => debugPrint('$title tapped'),
        leading: Icon(
          icon,
          color: Colors.deepOrange,
          size: MediaQuery
              .of(context)
              .size
              .width * 0.05,
        ),
        title: Text(title),
        subtitle: suTitle != null ? Text(suTitle) : null,
        trailing: Icon(
          Icons.chevron_right,
          color: Colors.deepOrange,
          size: MediaQuery
              .of(context)
              .size
              .width * 0.04,
        ),
      );
    }

    return Column(
      children: [
        Container(
          height: MediaQuery
              .of(context)
              .size
              .height * 0.3,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/images/mohamed.jpg'),
              fit: BoxFit.contain,
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
        Divider(
          thickness: MediaQuery
              .of(context)
              .size
              .width * 0.002,
          indent: MediaQuery
              .of(context)
              .size
              .width * 0.016,
          endIndent: MediaQuery
              .of(context)
              .size
              .width * 0.016,
        ),
        onTileTapped(
          title: 'Past Orders',
          icon: Icons.shopping_cart,
        ),
        Divider(
          thickness: MediaQuery
              .of(context)
              .size
              .width * 0.002,
          indent: MediaQuery
              .of(context)
              .size
              .width * 0.016,
          endIndent: MediaQuery
              .of(context)
              .size
              .width * 0.016,
        ),
        onTileTapped(
          title: 'Available Vouchers',
          icon: Icons.card_giftcard,
        ),
        Divider(
          thickness: MediaQuery
              .of(context)
              .size
              .width * 0.002,
          indent: MediaQuery
              .of(context)
              .size
              .width * 0.016,
          endIndent: MediaQuery
              .of(context)
              .size
              .width * 0.016,
        ),
      ],
    );
  }
}
