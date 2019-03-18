import 'package:flutter/material.dart';
import 'package:flutter_max/common/styles/max_images.dart';

/**
 * Created by Maker on 2019/3/18.
 * Describe:
 */

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
              accountName: Text(
                'max',
                style: TextStyle(color: Colors.white),
              ),
              accountEmail: Text(
                'www.max@max.com',
                style: TextStyle(color: Colors.white),
              ),
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage(images[0].imageUrl),
          ),
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            image: DecorationImage(image:AssetImage(images[5].imageUrl),
            fit: BoxFit.cover),

          ),
          otherAccountsPictures: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage(images[1].imageUrl),
            ),
            CircleAvatar(
              backgroundImage: AssetImage(images[2].imageUrl),
            ),
            CircleAvatar(
              backgroundImage: AssetImage(images[3].imageUrl),
            ),

          ],),
          ListTile(
            title: Text(
              'Message',
              textAlign: TextAlign.right,
            ),
            trailing: Icon(Icons.message),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text(
              'History',
              textAlign: TextAlign.right,
            ),
            trailing: Icon(Icons.history),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text(
              'Setting',
              textAlign: TextAlign.right,
            ),
            trailing: Icon(Icons.settings),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
