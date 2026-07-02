import 'package:bethriftytoday/config/utils.dart';
import 'package:bethriftytoday/models/models.dart';
import 'package:bethriftytoday/services/services.dart';
import 'package:bethriftytoday/shared/shared.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    var user = Provider.of<User>(context);
    updateStatusBarColor(context);

    _firebaseMessaging.getToken().then((token) {
      UserDatabaseService(user).updateUserPushToken(token ?? '');
    });

    return MultiProvider(
      providers: [
        StreamProvider<User>(
          create: (context) => UserDatabaseService(user).userDocument,
          initialData: user,
        ),
        StreamProvider<double>(
          create: (context) => TransactionDatabaseService(user).balance,
          initialData: 0.0,
        ),
        StreamProvider<List<Transaction>>(
          create: (context) => TransactionDatabaseService(user)
              .expensesByMonth(DateTime.now()),
          initialData: [],
        ),
      ],
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: ThriftyDrawer(),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerFloat,
        floatingActionButton: AddTransactionFloatingButton(),
        body: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ThriftyAppBar(),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    ThriftyOverview(),
                    DailyTransactionList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
