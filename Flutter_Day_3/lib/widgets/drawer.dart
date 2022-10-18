import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   const String imgUrl = 'https://i.pinimg.com/236x/83/dc/a6/83dca6d03da4d29b5258e03d8d46ad2c--hairstyles.jpg';
   const textColor = TextStyle(color: Colors.white);
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountName: Text('Laiba Arooj',style:textColor),
                  accountEmail: Text('laibaarooj@gmail.com', style:textColor ,),
                  currentAccountPicture: CircleAvatar(
                   backgroundImage: NetworkImage(imgUrl),
                  ),
              )
            ),
            Divider(height: 2, thickness: 2,color: Colors.white,),
            ListTile(
              leading: Icon(
                CupertinoIcons.house_alt_fill,
                color: Colors.white,
              ),
              title: Text('Home',textScaleFactor: 1.3,style: textColor,),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.person_alt_circle_fill,
                color: Colors.white,
              ),
              title: Text('Profile',textScaleFactor: 1.3,style: textColor,),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail_solid,
                color: Colors.white,
              ),
              title: Text('Contact Me',textScaleFactor: 1.3,style: textColor,),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.suit_heart_fill,
                color: Colors.white,
              ),
              title: Text('Favorite',textScaleFactor: 1.2,style: textColor,),
            ),


          ],
        ),
      ),
    );
  }
}
