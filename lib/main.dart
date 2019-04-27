import 'package:flutter/material.dart';
import 'package:whatsapps/customMenu.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

List<CustomPopupMenu> choices = <CustomPopupMenu>[
  CustomPopupMenu(title: 'New Group'),
  CustomPopupMenu(
    title: 'New Boardcast',
  ),
  CustomPopupMenu(title: 'Whatsapp Web'),
  CustomPopupMenu(title: 'Starred Messages'),
  CustomPopupMenu(title: 'Settings'),
];

class _MyAppState extends State<MyApp> {
  ScrollController _scrollViewController;
  CustomPopupMenu _selectedChoices = choices[0];

  void _select(CustomPopupMenu choice) {
    setState(() {
      _selectedChoices = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: NestedScrollView(
          controller: _scrollViewController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              new SliverAppBar(
                title: new Text("WhatsApp"),
                pinned: true,
                floating: true,
                actions: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search),
                  ),
                  PopupMenuButton<CustomPopupMenu>(
                    initialValue: choices[1],
                    onSelected: _select,
                    itemBuilder: (BuildContext context) {
                      return choices.map((CustomPopupMenu choice) {
                        return PopupMenuItem<CustomPopupMenu>(
                          value: choice,
                          child: Text(choice.title),
                        );  
                      }).toList();
                    },
                  )
                ],
                forceElevated: innerBoxIsScrolled,
                bottom: new TabBar(
                  tabs: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Icon(Icons.camera),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text("CHATS"),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text("STATUS"),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text("CALLS"),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: new TabBarView(
            children: <Widget>[],
          ),
        ),
      ),
    );
  }
}
