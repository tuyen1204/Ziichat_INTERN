import 'package:flutter/cupertino.dart';
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

class Todo {
  final String title;
  final String description;
  Todo(this.title, this.description);
}

class _MyHomePageState extends State<MyHomePage> {
  final todos = List.generate(
      10,
      (i) => Todo(
          'Todo $i', 'A description of what needs to be done for Todo $i'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context)
            .colorScheme
            .inversePrimary, //! Use the primary color
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
                  for (var todo in todos)
                    Card(
                      child: ListTile(
                        title: Text(todo.title),
                        subtitle: Text(todo.description),
                        onTap: () {
                          //! Redirect to the detail page
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ToDetail(),
                                  settings: RouteSettings(arguments: todo)));
                        },
                      ),
                    ),
                ],
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                  backgroundColor: WidgetStateProperty.all<Color>(Colors.amber),
                ),
                onPressed: () {
                  Route route =
                      MaterialPageRoute(builder: (context) => SecondHome());
                  Navigator.push(context, route);
                },
                child: Text(
                  'Second Home',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Button'),
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
              SizedBox(
                height: 200,
                child: CarouselView(
                  itemExtent: 200,
                  children: [
                    for (int i = 0; i < 10; i++)
                      SizedBox(
                        width: double.infinity,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image.asset('assets/images/image-1.jpg'),
                        ),
                      )
                  ],
                ),
              ),

              //* 7/1/2025
              GridView.count(
                //! Use simple count
                scrollDirection: Axis.vertical, //! Get auto height of the grid
                shrinkWrap: true, //! Get auto height of the grid
                physics: NeverScrollableScrollPhysics(), //! Disable scrolling
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                crossAxisCount: 4,
                children: <Widget>[
                  for (int i = 0; i < 10; i++)
                    ClipRRect(
                      //! Use Rounded for Image
                      borderRadius: BorderRadius.circular(8),
                      child: FittedBox(
                        //! Use Cover for Image
                        fit: BoxFit.fill,
                        child: Image.asset(
                          'assets/images/image-1.jpg',
                        ),
                      ),
                    )
                ],
              ),

              GridView.builder(
                //! Use as loop
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                ),
                itemBuilder: (_, index) => ClipRRect(
                    // Use Rounded for Image
                    borderRadius: BorderRadius.circular(8),
                    child: FittedBox(
                      // Use Cover for Image
                      fit: BoxFit.fill,
                      child: Image.asset(
                        'assets/images/image-1.jpg',
                      ),
                    )),
                itemCount: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ToDetail extends StatelessWidget {
  const ToDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final todo = ModalRoute.of(context)!.settings.arguments as Todo;
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page ${todo.title}'),
      ),
      body: Column(
        spacing: 16,
        children: [
          Text(
            'This is the second home page ${todo.title}',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back!'),
            ),
          ),
        ],
      ),
    );
  }
}

class SecondHome extends StatelessWidget {
  const SecondHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Home'),
      ),
      body: Center(
        child: Column(
          spacing: 16,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back!'),
            ),
          ],
        ),
      ),
    );
  }
}
