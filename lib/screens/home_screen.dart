import 'dart:async';

import 'package:dialogs_demo_flutter/Models/menu_items_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<MenuItemModel> itemList = const <MenuItemModel>[
    MenuItemModel(title: 'Settings', icon: Icons.settings),
    MenuItemModel(title: 'Theme', icon: Icons.theaters),
    MenuItemModel(title: 'FeedBack', icon: Icons.feedback),
  ];
  dynamic _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Material Dialogs Demo"),
          actions: <Widget>[
            PopupMenuButton<MenuItemModel>(
              onSelected: _selectedValue,
              itemBuilder: (BuildContext context) {
                return itemList.map((MenuItemModel item) {
                  return PopupMenuItem<MenuItemModel>(
                    value: item,
                    child: Row(
                      children: <Widget>[
                        Icon(item.icon),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(item.title!),
                        )
                      ],
                    ),
                  );
                }).toList();
              },
            )
          ],
        ),
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Builder(builder: (BuildContext context) {
              context = context;
              return Column(
                children: <Widget>[
                  const SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Card(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(30.0)),
                            elevation: MaterialStateProperty.all(0.0),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                          ),
                          onPressed: () async {
                            DateTime _todayDate = DateTime.now();
                            DateTime _initialDate = DateTime(1990);
                            DateTime _lastDate = DateTime(2080);
                            final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: _todayDate,
                              firstDate: _initialDate,
                              lastDate: _lastDate,
                            );

                            final snackBar = SnackBar(
                              content: Text(
                                picked.toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                              backgroundColor: const Color(0xFF000000),
                            );

                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          },
                          child: SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Image.asset('assets/images/calendar.png',
                                    width: 40.0, height: 40.0),
                                const Padding(
                                  padding: EdgeInsets.only(top: 15.0),
                                  child: Text(
                                    "Calendar ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                            width: 80.0,
                          ),
                        ),
                        elevation: 2.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Card(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.all(30.0)),
                              elevation: MaterialStateProperty.all(0.0),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                            ),
                            onPressed: () async {
                              TimeOfDay? timeOfDay = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now());

                              final snackBar = SnackBar(
                                content: Text(
                                  timeOfDay.toString(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                                backgroundColor: const Color(0xFF000000),
                              );

                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            },
                            child: SizedBox(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Image.asset('assets/images/time.png',
                                      width: 40.0, height: 40.0),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 15.0),
                                    child: Text(
                                      "Time",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                              width: 80.0,
                            ),
                          ),
                          elevation: 2.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Card(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(30.0)),
                            elevation: MaterialStateProperty.all(0.0),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                          ),
                          onPressed: () {
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                // user must tap button!

                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text("Dialog"),
                                    content:
                                        const Text("This is an alert dialog"),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text('Cancel'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      TextButton(
                                        child: const Text('OK'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      )
                                    ],
                                  );
                                });

                            /* new AlertDialog(title: Text("Default Dialog"),actions: <Widget>[
                   new FlatButton(
                     child: new Text('Cancel'),
                     onPressed: () {
                       Navigator.of(context).pop();
                     },
                   ),

                 ],);*/
                          },
                          child: SizedBox(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Image.asset('assets/images/aleart_dialog.png',
                                    width: 40.0, height: 40.0),
                                const Padding(
                                  padding:
                                      EdgeInsets.only(top: 15.0, left: 17.0),
                                  child: Text(
                                    "Alert Dialog",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                            width: 80.0,
                          ),
                        ),
                        elevation: 2.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Card(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.all(30.0)),
                              elevation: MaterialStateProperty.all(0.0),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                            ),
                            onPressed: () {
                              showModalBottomSheet<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        ListTile(
                                            leading: const Icon(Icons.settings),
                                            title: const Text('Settings'),
                                            onTap: () {
                                              final snackBar = SnackBar(
                                                content: const Text(
                                                  'Settings',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                backgroundColor:
                                                    const Color(0xFF000000),
                                                action: SnackBarAction(
                                                  label: 'Done',
                                                  onPressed: () {
                                                    // Some code to undo the change!
                                                  },
                                                ),
                                              );

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                              Navigator.of(context).pop();
                                            }),
                                        ListTile(
                                            leading: const Icon(Icons.theaters),
                                            title: const Text('Theme'),
                                            onTap: () {
                                              final snackBar = SnackBar(
                                                content: const Text(
                                                  'Theme',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                backgroundColor:
                                                    const Color(0xFF000000),
                                                action: SnackBarAction(
                                                  label: 'Done',
                                                  onPressed: () {
                                                    // Some code to undo the change!
                                                  },
                                                ),
                                              );

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                              Navigator.of(context).pop();
                                            }),
                                        ListTile(
                                            leading: const Icon(Icons.feedback),
                                            title: const Text('Feedback'),
                                            onTap: () {
                                              final snackBar = SnackBar(
                                                content: const Text(
                                                  'Feedback',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                backgroundColor:
                                                    const Color(0xFF000000),
                                                action: SnackBarAction(
                                                  label: 'Done',
                                                  onPressed: () {
                                                    // Some code to undo the change!
                                                  },
                                                ),
                                              );

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                              Navigator.of(context).pop();
                                            }),
                                      ],
                                    );
                                  });
                            },
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Image.asset('assets/images/bottem_sheet.png',
                                      width: 40.0, height: 40.0),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(top: 15.0, left: 15.0),
                                    child: Text(
                                      "Bottom Sheet",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                              width: 80.0,
                              alignment: Alignment.center,
                            ),
                          ),
                          elevation: 2.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Card(
                        child: ElevatedButton(
                          onPressed: () {
                            showLoader();
                          },
                          child: SizedBox(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Image.asset('assets/images/progress.png',
                                    width: 40.0, height: 40.0),
                                const Padding(
                                  padding: EdgeInsets.only(top: 15.0),
                                  child: Text(
                                    "Progress",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                            width: 80.0,
                          ),
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(30.0)),
                            elevation: MaterialStateProperty.all(0.0),
                            backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                          ),
                        ),
                        elevation: 2.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Card(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.all(30.0)),
                              elevation: MaterialStateProperty.all(0.0),
                              backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                            ),
                            onPressed: () {
                              final snackBar = SnackBar(
                                content: const Text(
                                  'This is SnackBar',
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: const Color(0xFF000000),
                                action: SnackBarAction(
                                  label: 'Done',
                                  onPressed: () {
                                    // Some code to undo the change!
                                  },
                                ),
                              );

                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            },
                            child: SizedBox(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Image.asset('assets/images/snack_bar.png',
                                      width: 40.0, height: 40.0),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 15.0),
                                    child: Text(
                                      "Snack Bar",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                              width: 80.0,
                            ),

                          ),
                          elevation: 2.0,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            })
          ],
        ));

    // TODO: implement build
  }

  void showLoader() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Loading..."),
                ),
              ],
            ),
          ),
        );
      },
    );

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context); //pop dialog
    });
  }
}
