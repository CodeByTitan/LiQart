import 'package:flutter/material.dart';
import 'colors.dart'; // Import your colors file
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'carousel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

import 'location.dart';
import 'presentation/location_search.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:geolocator/geolocator.dart';


class AppState extends ChangeNotifier {
  PanelController panelController = PanelController();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
        '/location': (context) => Location(),
        '/locationsearch': (context) => LocationSearch()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    return Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 50, 0, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Container(
                          width: 32.0,
                          height: 32.0,
                          child: SvgPicture.asset('assets/location.svg'),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 50,right: 100,top: 0,bottom: 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          border: Border.all(
                            color: CustomColors.wine, // Add your desired border color
                            width: 2.0,
                          ),
                        ),
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: 5, top: 12, right: 25, bottom: 10),
                            child: GestureDetector(
                                onTap: () {
                                  appState.panelController.open(); // Open the sliding panel
                                },
                                child: Text(
                                  ' Select your location',
                                  style: TextStyle(
                                    fontFamily: "Quicksand",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 16.0,
                                  ),

                                  // enabledBorder: OutlineInputBorder(
                                  //   borderRadius: BorderRadius.circular(50.0),
                                  //   borderSide: BorderSide(
                                  //     color: CustomColors.wine,
                                  //     width: 2.0,
                                  //   ),
                                  // ),
                                  // contentPadding: EdgeInsets.symmetric(
                                  //   horizontal: 25.0,
                                  // ),
                                ),
                            ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Container(
                    alignment: Alignment.topLeft,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.2,
                    decoration: BoxDecoration(
                      color: CustomColors.wine,
                      border: Border(
                        top: BorderSide(color: Colors.black, width: 5.0),
                        bottom: BorderSide(color: Colors.black, width: 5.0),
                      ),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            'assets/wine.png',
                            width: 100,
                            height: 100,
                          ),
                          Text(
                            "LiQart",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Glittery",
                              fontSize: 100,
                            ),
                          ),
                          Transform(
                            transform: Matrix4.identity()
                              ..scale(-1.0, 1.0),
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/wine.png',
                              width: 100,
                              height: 100,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(child: Carousel()),
                ],
              ),
            ),
            SlidingUpPanel(
              minHeight: MediaQuery
                  .of(context)
                  .size
                  .height * 0,
              maxHeight: MediaQuery
                  .of(context)
                  .size
                  .height * 0.9,
              panel: LocationSearch(),
              controller: appState.panelController ,
            ),
          ],
        ));
  }
}
