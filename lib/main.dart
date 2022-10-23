import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_delivery_app/Root/backend/backend.dart';

import 'Constants/colors.dart';
import 'HomeSreen/tabs.dart';
import 'Root/auth/auth_util.dart';
import 'Root/auth/firebase_user_provider.dart';
import 'Root/flutter_flow/flutter_flow_theme.dart';
import 'Root/login_page/login_page_widget.dart';
import 'Root/my_appointments/my_appointments_widget.dart';
import 'Root/profile_page/profile_page_widget.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Stream<FlutterflowFirebaseUser> userStream;
  FlutterflowFirebaseUser initialUser;

  @override
  void initState() {
    super.initState();
    userStream = flutterflowFirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crystal Bites',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(primarySwatch: Colors.blue),
      home: initialUser == null
          ? Center(
              child: Builder(
                builder: (context) => Image.asset(
                  'assets/splashscreen_image.png',
                  width: MediaQuery.of(context).size.width / 2,
                  fit: BoxFit.fitWidth,
                ),
              ),
            )
          : currentUser.loggedIn
              ? Home()
              : LoginPageWidget(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<SliderDrawerState> _key = GlobalKey<SliderDrawerState>();
  String title;

  @override
  void initState() {
    title = "Home";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SliderDrawer(
            appBar: SliderAppBar(
              appBarColor: Colors.white,
              title: null,
            ),
            key: _key,
            sliderShadow: SliderShadow(),
            sliderOpenSize: 179,
            slider: _SliderView(
              onItemClick: (title) {
                _key.currentState.closeSlider();
                setState(() {
                  this.title = title;
                });
              },
            ),
            child: AppB()),
      ),
    );
  }
}

class _SliderView extends StatelessWidget {
  final Function(String) onItemClick;

  const _SliderView({Key key, this.onItemClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
        stream: UsersRecord.getDocument(currentUserReference),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 40,
                height: 40,
                child: SpinKitChasingDots(
                  color: FlutterFlowTheme.primaryColor,
                  size: 40,
                ),
              ),
            );
          }
          final homePageUsersRecord = snapshot.data;
          return Container(
            color: AppColors.primary,
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfilePageWidget())),
                    child: CircleAvatar(
                      radius: 65,
                      backgroundColor: Colors.grey,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage('assets/man.jpeg'),
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  homePageUsersRecord.displayName,
                  style: FlutterFlowTheme.title2.override(
                      fontFamily: 'Lexend Deca',
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                    title: Text('Orders',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'BalsamiqSans_Regular')),
                    leading: Icon(Icons.menu, color: Colors.black),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyAppointmentsWidget()));
                    }),
                ListTile(
                    title: Text('Payments'),
                    leading: Icon(Icons.payment),
                    onTap: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePageWidget()));
                    }),
                ListTile(
                    title: Text('Notification'),
                    leading: Icon(Icons.notifications_active),
                    onTap: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePageWidget()));
                    }),
                ListTile(
                    title: Text('Profile'),
                    leading: Icon(Icons.person),
                    onTap: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePageWidget()));
                    }),
                ListTile(
                    title: Text('Setting'),
                    leading: Icon(Icons.settings),
                    onTap: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePageWidget()));
                    }),
                ListTile(
                  title: Text('LogOut'),
                  leading: Icon(Icons.arrow_back_ios),
                  onTap: () async {
                    await signOut();
                    await Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPageWidget(),
                      ),
                      (r) => false,
                    );
                  },
                ),
              ],
            ),
          );
        });
  }
}
