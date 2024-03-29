// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:find_food_application/theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class history extends StatefulWidget {
  const history({Key? key}) : super(key: key);

  @override
  State<history> createState() => _historyState();
}

class _historyState extends State<history> {
  @override
  void initState() {
    loadData();
    getContact();
    super.initState();
  }

  loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      // saveListTitle = prefs.getStringList('saveTitleKey') ?? [];
      // saveListDate = prefs.getStringList('saveDateKey') ?? [];
      // recentTitle = prefs.getStringList('recentTitleKey') ?? [];
      // recentDate = prefs.getStringList('recentDateKey') ?? [];
    });
  }

  getContact() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      // title = prefs.getStringList('titleKey') ?? [];
      // subtitle = prefs.getStringList('subtitleKey') ?? [];
      // icon = prefs.getStringList('iconKey') ?? [];
      // bgColor = prefs.getStringList('bgColorKey') ?? [];
      // iconColor = prefs.getStringList('colorKey') ?? [];
      // dateSubmit = prefs.getStringList('dateKey') ?? [];
    });
  }
  bool saveListTitle = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 25, left: 25, right: 25),
              child: Text(
                "History",
                style: myTextStyle.title,
              ),
            ),
            const SizedBox(height: 25),
            DefaultTabController(
              length: 3,
              initialIndex: 0,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: SizedBox(
                      height: 40,
                      child: Material(
                        borderRadius: BorderRadius.circular(13),
                        elevation: 1,
                        child: TabBar(
                          labelColor: Colors.white,
                          unselectedLabelColor:
                              AppColors.primaryColor.withOpacity(0.6),
                          padding: const EdgeInsets.all(3),
                          indicator: BoxDecoration(
                              color: AppColors.secondary,
                              borderRadius: BorderRadius.circular(10)),
                          tabs: const [
                            Tab(text: 'Scan'),
                            Tab(text: 'Create'),
                            Tab(text: 'Boomark'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    height: 500,
                    child: TabBarView(
                      children: [
                        ListView.builder(
                           // itemCount: recentDate.length,
                            itemBuilder: (BuildContext context, int index) {
                              return history();
                            }),
                        ListView.builder(
                           // itemCount: title.length,
                            itemBuilder: (BuildContext context, int index) {
                              return history();
                            }),
                        saveListTitle == null
                            ? Text('sad')
                            : ListView.builder(
                                //itemCount: saveListDate.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return history();
                                },
                              ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
