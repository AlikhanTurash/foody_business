import 'package:flutter/material.dart';
import '../page/login_page.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 50,
        ),
        Expanded(
          child: SizedBox.shrink(),
        ),
        Text(
          'Профиль',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        Expanded(
          child: SizedBox.shrink(),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
          icon: Icon(Icons.exit_to_app),
        )
      ],
    );
  }
}
