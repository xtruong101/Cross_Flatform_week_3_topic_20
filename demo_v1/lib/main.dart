


import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'redux/state.dart';
import 'redux/reducer.dart';
import 'redux/todo_screen.dart';

void main() {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
  );
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  const MyApp({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TodoScreen(),
      ),
    );
  }
}


















// =============================================================================================================================


// import 'package:flutter/material.dart';
// import 'package:flutter_redux/flutter_redux.dart';
// import 'package:redux/redux.dart';

// import 'redux/state.dart';
// import 'redux/actions.dart';
// import 'redux/reducer.dart';

// void main() {
//   final store = Store<AppState>(
//     appReducer,
//     initialState: AppState.initial(),
//   );
//   runApp(MyApp(store: store));
// }

// class MyApp extends StatelessWidget {
//   final Store<AppState> store;

//   const MyApp({Key? key, required this.store}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return StoreProvider<AppState>(
//       store: store,
//       child: const MaterialApp(
//         home: CounterScreen(),
//       ),
//     );
//   }
// }

// class CounterScreen extends StatelessWidget {
//   const CounterScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     print('Widget rebuilt!'); 

//     return Scaffold(
//       appBar: AppBar(title: const Text('StoreConnector Example')),
//       body: Center(
        
//         child: StoreConnector<AppState, int>(
//           converter: (store) => store.state.counter,
//           builder: (context, counter) {
//             return Text(
//               'Count: $counter',
//               style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//             );
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => StoreProvider.of<AppState>(context).dispatch(IncrementAction()),
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }




// =============================================================================================================================


// import 'package:flutter/material.dart';
// import 'package:flutter_redux/flutter_redux.dart';
// import 'package:redux/redux.dart';

// import 'redux/state.dart';
// import 'redux/actions.dart';
// import 'redux/reducer.dart';

// void main() 
// {
//   final store = Store<AppState>(
//     appReducer,
//     initialState: AppState.initial(),
//   );

//   runApp(MyApp(store: store));
// }

// class MyApp extends StatelessWidget {
//   final Store<AppState> store;

//   const MyApp({Key? key, required this.store}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return StoreProvider<AppState>(
//       store: store,
//       child: MaterialApp(
//         title: 'Flutter Redux Demo',
//         home: CounterPage(),
//       ),
//     );
//   }
// }

// class CounterPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Redux Counter Example')),
//       body: Center(
//         child: StoreConnector<AppState, int>(
//           converter: (store) => store.state.counter,
//           builder: (context, counter) {
//             return Text(
//               'Counter: $counter',
//               style: const TextStyle(fontSize: 30),
//             );
//           },
//         ),
//       ),
//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             heroTag: 'tang',
//             onPressed: () =>
//                 StoreProvider.of<AppState>(context).dispatch(IncrementAction()),
//             child: const Icon(Icons.add),
//           ),
//           const SizedBox(height: 10),
//           FloatingActionButton(
//             heroTag: 'giam',
//             onPressed: () =>
//                 StoreProvider.of<AppState>(context).dispatch(DecrementAction()),
//             child: const Icon(Icons.remove),
//           ),
//           const SizedBox(height: 10),
//           FloatingActionButton(
//             heroTag: 'xoa',
//             onPressed: () =>
//                 StoreProvider.of<AppState>(context).dispatch(ResetAction()),
//             child: const Icon(Icons.refresh),
//           ),
//         ],
//       ),
//     );
//   }
// }









// =============================================================================================================================



// class LoginAction{
//     final String email;
//     final String password;
//     LoginAction({required this.email,
//     required this.password});
// }
// class UpdateUserAction{
//     final String name;
//     final int age;
//     UpdateUserAction({required this.name,
//     required this.age});
// }


// // 1. Store chứa toàn bộ state
// final store = Store<int>(counterReducer, initialState: (0);

// // 2. State là read-only - không thể thay đổi trực tiếp
// // store.state = 1; // Không được phép

// // 3. Thay đổi state thông qua Action
// store.dispatch (IncrementAction()); // Được
// // Reducer (pure function) xử lý state mới
// int counterReducer (int state, dynamic action) {
//     if (action is IncrementAction) {
//         return state + 1; // Trả về state mới
// }
// return state;
// }

// // Vẫn đề với setState() truyền thống
// class MyApp extends StatefulWidget
// {
//     @override
//     MyAppState createState() => _MyAppState();
// }
// class MyAppState extends State<MyApp>{
//     String_userName = "";
//     int_counter = 0;
//     List<String> _items = [];
//     bool_isLoading = false;
// // State được quản lý rải rác, khó theo dõi
// void _updateProfile(){
//     setState((){
//     userName = 'New Name';
//     _counter++;
//     _items.add('New Item');
//     _isLoading = true;
// });
// }
// }


// //không payload
// store.dispatch(IncrementAction());
// store.dispatch (LogoutAction());
// //có payload
// store.dispatch (LoginAction (email: 'user@example.com', password: '123456'));
// store.dispatch(UpdateUserAction (name: 'TinTruong', age: 18));
// )







// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text('You have pushed the button this many times:'),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
