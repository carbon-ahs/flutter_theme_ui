import 'package:flutter/material.dart';
import 'package:theme_prac/theme/theme_constants.dart';
import 'package:theme_prac/theme/theme_manager.dart';
import 'package:theme_prac/utils/helper_widgets.dart';

void main() {
  runApp(const MyApp());
}

ThemeManger _themeManger = ThemeManger();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    _themeManger.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    _themeManger.addListener(themeListener);
    super.initState();
  }

  void themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManger.themeMode,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool flag = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Theme Application'),
        actions: [
          Switch(
              value: _themeManger.themeMode == ThemeMode.dark,
              onChanged: (newValue) {
                _themeManger.toggleTheme(newValue);
              }),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/profile_pic.png',
                width: 200,
                height: 200,
              ),
              addVerticalSpace(10),
              Text("@carbon-ahs"),
              addVerticalSpace(10),
              Text("Live Like There's No Tomorrow"),
              addVerticalSpace(20),
              TextField(),
              addVerticalSpace(20),
              ElevatedButton(
                child: Text('Just Click'),
                onPressed: (flag) {
                  // _themeManger.toggleTheme(flag);
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
