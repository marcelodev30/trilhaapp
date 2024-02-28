import 'package:flutter/material.dart';

class MyPage2 extends StatefulWidget {
  const MyPage2({super.key});

  @override
  State<MyPage2> createState() => _MyPage2State();
}

class _MyPage2State extends State<MyPage2> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('app'),
          bottom: const TabBar(tabs: [
            Tab(
              text: 'test app',
              icon: Icon(Icons.label),
            ),
            Tab(
              text: 'api',
              icon: Icon(Icons.api),
            )
          ]),
        ),
        body: TabBarView(children: [
          Container(
            color: Colors.indigo,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(25))),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.blue,
          )
        ]),
      ),
    );
  }
}
