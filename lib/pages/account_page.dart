import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    Widget orderVoucherItems({required String name, required int number}) {
      return Column(
        children: [
          Text(
            number.toString(),
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Theme.of(context).primaryColor,
            ),
          ),
          Text(name, style: Theme.of(context).textTheme.titleMedium),
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
        leading: Icon(icon, size: size.width * 0.05),
        title: Text(title),
        subtitle: suTitle != null ? Text(suTitle) : null,
        trailing: Icon(
          Icons.chevron_right,
          size: size.width * 0.04,
        ),
      );
    }

    return Column(
      children: [
        Container(
          height: size.height * 0.3,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/images/mohamed.jpg'),
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(height: size.height * 0.016),
        Text(
          'Mohamed Samir',
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(height: size.height * 0.016),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            orderVoucherItems(name: 'Orders', number: 50),
            orderVoucherItems(name: 'Vouchers', number: 10),
          ],
        ),
        Divider(),
        onTileTapped(title: 'Past Orders', icon: Icons.shopping_cart),
        Divider(),
        onTileTapped(title: 'Available Vouchers', icon: Icons.card_giftcard),
        Divider(),
      ],
    );
  }
}
