import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

bool isDarkMode = true;

profilePage() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Column(
          children: [
            Icon(
              Icons.account_circle,
              size: 54,
              color: Colors.white,
            ),
            Text(
              'Username',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Dark mode",
                style: TextStyle(color: Colors.white),
              ),
              StatefulBuilder(
                builder: (BuildContext context, setState) {
                  return CupertinoSwitch(
                      value: isDarkMode,
                      onChanged: (val) {
                        setState(() {
                          isDarkMode = val;
                        });
                      });
                },
              ),
            ],
          ),
          ClickableSetting(
            namaSetting: 'Language',
            namaSubSetting: 'English',
          ),
          ClickableSetting(namaSetting: 'Account'),
          ClickableSetting(namaSetting: 'Security'),
          ClickableSetting(namaSetting: 'Help'),
          ClickableSetting(namaSetting: 'Contact Us'),
          ClickableSetting(namaSetting: 'App Version'),
        ],
      ),
      ElevatedButton(
        onPressed: () {},
        child: Text("Logout"),
      ),
    ],
  );
}

class ClickableSetting extends StatelessWidget {
  const ClickableSetting({
    Key? key,
    required this.namaSetting,
    this.namaSubSetting,
  }) : super(key: key);

  final String namaSetting;
  final String? namaSubSetting;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {
          print('click on : $namaSetting');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              namaSetting,
              style: TextStyle(color: Colors.white),
            ),
            Row(
              children: [
                namaSubSetting != null
                    ? Text(
                        namaSubSetting!,
                        style: TextStyle(color: Colors.grey),
                      )
                    : Text(''),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
