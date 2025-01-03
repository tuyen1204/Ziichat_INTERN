import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        padding:
            const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 80),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 16,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Column(
                spacing: 12,
                children: [
                  for (int i = 0; i < 10; i++)
                    Container(
                      color: Color(0xFFE0E0E0),
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      child: Text("Item $i"),
                    )
                ],
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                  backgroundColor: WidgetStateProperty.all<Color>(Colors.amber),
                ),
                onPressed: () {},
                child: Text(
                  'TextButton',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print("on pressed");
                },
                child: Text('ElevatedButton'),
              ),
              FilledButton(onPressed: null, child: Text('Disabled')),
              FloatingActionButton(
                  onPressed: () => {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                height: 200,
                                color: Colors.white,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      const Text('BottomSheet'),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Close'),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            })
                      },
                  child: Icon(Icons.add)),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a search term',
                ),
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
              ),
              TextField(
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'Enter a search term',
                ),
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
