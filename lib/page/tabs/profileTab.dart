import 'package:flutter/material.dart';

import 'package:foody_business/widgets/profile_header.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          ProfileHeader(),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: SizedBox(
                width: 100,
                child: Image(image: AssetImage('assets/profile.png'))),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'coffeeboom@gmail.com',
            style:
                TextStyle(color: Colors.black38, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Coffee BOOM',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30.0),
          ),
          SizedBox(
            height: 30.0,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Настройки',
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20.0),
                ),
                SizedBox(
                  height: 10,
                ),
                OutlinedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.person_outline_outlined,
                            color: Colors.black,
                            size: 30,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Данные ресторана',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                          Expanded(child: SizedBox.shrink()),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    )),
                SizedBox(height: 10),
                OutlinedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.key_outlined,
                            color: Colors.black,
                            size: 30,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Изменить пароль',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                          Expanded(child: SizedBox.shrink()),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
