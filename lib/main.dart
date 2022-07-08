import 'package:blocapi/repository/news_repository.dart';
import 'package:blocapi/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';

import 'blocs/newsbloc/news_bloc.dart';

void main() {
  runApp(MyApp());
  // runApp(
  //   BlocProvider<NewsBloc>(
  //     create: (context) => NewsBloc(NewsRepository()),
  //     child: MyApp(),
  //   ),
  // );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsBloc>(
          create: (context) => NewsBloc(
              // initialState: NewsInitState(), newsRepository: NewsRepository()
              NewsRepository()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: SplashScreen(),
        // ),
      ),
    );
  }
}
