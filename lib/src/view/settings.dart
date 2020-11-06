import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  static final String path = "lib/src/pages/settings/settings1.dart";

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                color: Colors.red,
                child: ListTile(
                  onTap: () {
                    //open edit profile
                  },
                  title: Text(
                    "Иванов Иван",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  leading: Icon(
                    Icons.verified_user,
                    color: Colors.white,
                  ),
                  trailing: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Card(
                elevation: 4.0,
                margin: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 16.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.lock_outline,
                        color: Colors.red,
                      ),
                      title: Text("Изменить пароль"),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        //open change password
                      },
                    ),
                    _buildDivider(),
                    ListTile(
                      leading: Icon(
                        Icons.language,
                        color: Colors.red,
                      ),
                      title: Text("Изменить язык"),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        //open change language
                      },
                    ),
                    _buildDivider(),
                    ListTile(
                      leading: Icon(
                        Icons.location_on,
                        color: Colors.red,
                      ),
                      title: Text("Изменить профиль"),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        //open change location
                      },
                    ),
                  ],
                ),
              ),
              Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 16.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: SwitchListTile(
                          activeColor: Colors.red,
                          contentPadding: const EdgeInsets.all(0),
                          value: true,
                          title: Text("Уведомления по email"),
                          onChanged: (val) {},
                        ),
                      ),
                      _buildDivider(),
                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: SwitchListTile(
                          activeColor: Colors.red,
                          contentPadding: const EdgeInsets.all(0),
                          value: true,
                          title: Text("Уведомления по sms"),
                          onChanged: (val) {},
                        ),
                      ),
                      _buildDivider(),
                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: SwitchListTile(
                          activeColor: Colors.red,
                          contentPadding: const EdgeInsets.all(0),
                          value: true,
                          title: Text("Уведомления в приложении"),
                          onChanged: (val) {},
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ],
    );
  }

  Container _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade400,
    );
  }
}
