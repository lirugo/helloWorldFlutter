import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world_flutter/src/view/camera.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key key, this.cameras}) : super(key: key);
  final List<CameraDescription> cameras;

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer>{
  @override
  Widget build(BuildContext buildContext){
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            color: Colors.red,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 40, 0, 18),
              child: Row(
                children: [
                  new Padding(
                      padding: new EdgeInsets.only(left: 10.0, right: 20.0),
                      child: new CircleAvatar(
                        radius: 35.0,
                        backgroundImage: NetworkImage(
                            'https://img1.grunge.com/img/uploads/2018/11/scientific-effects-happen-man-grows-beard.jpg'),
                      )),
                  Text('Иванов Иван',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20))
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.access_alarm),
            title: Text('Напоминания'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.bar_chart),
            title: Text('Отчеты'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.group),
            title: Text('Пользователи'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.camera),
            title: Text('Камера'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Camera(cameras: widget.cameras)),
              );
            },
          ),
        ],
      ),
    );
  }
}