import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/core/injection/injector.dart';
import 'features/posts/presentation/providers/movie_provider.dart';
import 'features/posts/presentation/screens/posts_main_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Injector.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PostsProvider(repository: injector())..getPosts(),
        ),
      ],
      child: MaterialApp(
        title: 'Provider Example',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: const MovieMainScreen(),
      ),
    );
  }
}
