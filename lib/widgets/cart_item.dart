import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrMGW9uwPwquAJVCsVfUOOTUQyH-Rl3xYEHkJwSStxkAC4YlHxngCHgkdWyzJ9JlV4RzMUr7ifeg&usqp=CAc')
        ],
      ),
    );
  }
}
