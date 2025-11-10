import 'package:flutter/material.dart';

void main() {
  runApp(const TimeTravelApp());
}

class TimeTravelApp extends StatelessWidget {
  const TimeTravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Travel Demo',
      home: const TimeTravelPage(),
    );
  }
}

class TimeTravelPage extends StatefulWidget {
  const TimeTravelPage({super.key});

  @override
  State<TimeTravelPage> createState() => _TimeTravelPageState();
}

class _TimeTravelPageState extends State<TimeTravelPage> {
  List<int> _history = [0]; // Lịch sử trạng thái, bắt đầu từ 0
  int _currentIndex = 0;     // Vị trí hiện tại trong lịch sử

  // Bấm nút từ 1-10
  void _pressButton(int value) {
    setState(() {
      // Nếu đang ở quá khứ -> xóa các trạng thái phía sau
      if (_currentIndex < _history.length - 1) {
        _history = _history.sublist(0, _currentIndex + 1);
      }
      _history.add(value);
      _currentIndex++;
    });
  }

  // Chọn state từ lịch sử
  void _jumpToState(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentValue = _history[_currentIndex];

    return Scaffold(
      appBar: AppBar(title: const Text('Time Travel Demo')),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            'Current Value: $currentValue',
            style: const TextStyle(fontSize: 32),
          ),
          const SizedBox(height: 20),
          // Nút 1-10
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(10, (index) {
              int value = index + 1;
              return ElevatedButton(
                onPressed: () => _pressButton(value),
                child: Text('$value'),
              );
            }),
          ),
          const Divider(height: 40),
          const Text(
            'History (Time Travel)',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          // List lịch sử trạng thái
          Expanded(
            child: ListView.builder(
              itemCount: _history.length,
              itemBuilder: (context, index) {
                final value = _history[index];
                final isCurrent = index == _currentIndex;
                return ListTile(
                  title: Text('Value: $value'),
                  tileColor: isCurrent ? Colors.blue.shade100 : null,
                  trailing: isCurrent
                      ? const Icon(Icons.arrow_right, color: Colors.blue)
                      : null,
                  onTap: () => _jumpToState(index),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_redux/flutter_redux.dart';
// import 'package:redux/redux.dart';
// import 'redux/actions.dart';
// import 'redux/store.dart';
// import 'redux/reducers.dart';
// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return StoreProvider<AppState>(
//       store: store,
//       child: MaterialApp(
//         title: 'Time Travel Debugging',
//         theme: ThemeData(primarySwatch: Colors.deepPurple),
//         home: const TimeTravelScreen(),
//         debugShowCheckedModeBanner: false,
//       ),
//     );
//   }
// }

// class TimeTravelScreen extends StatelessWidget {
//   const TimeTravelScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Time Travel Debugging'),
//         centerTitle: true,
//         elevation: 2,
//       ),
//       body: StoreConnector<AppState, _ViewModel>(
//         converter: (store) => _ViewModel(
//           history: store.state.history,
//           currentIndex: store.state.currentIndex,
//           updateState: (value) => store.dispatch(UpdateStateAction(value)),
//           travelTo: (index) => store.dispatch(TravelToStateAction(index)),
//         ),
//         builder: (context, vm) {
//           final currentSequence = vm.currentIndex >= 0
//               ? vm.history.sublist(0, vm.currentIndex + 1).join('')
//               : '(Chưa có)';

//           return Column(
//             children: [
//               // Nút 1-10
//               Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Wrap(
//                   spacing: 12,
//                   runSpacing: 12,
//                   alignment: WrapAlignment.center,
//                   children: List.generate(10, (i) {
//                     final value = i + 1;
//                     return SizedBox(
//                       width: 60,
//                       height: 60,
//                       child: ElevatedButton(
//                         onPressed: () => vm.updateState(value),
//                         style: ElevatedButton.styleFrom(
//                           shape: const CircleBorder(),
//                           padding: const EdgeInsets.all(8),
//                         ),
//                         child: Text(
//                           '$value',
//                           style: const TextStyle(fontSize: 20),
//                         ),
//                       ),
//                     );
//                   }),
//                 ),
//               ),

//               // Trạng thái hiện tại
//               Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Colors.purple[50],
//                   borderRadius: BorderRadius.circular(12),
//                   border: Border.all(color: Colors.purple),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       'Trạng thái hiện tại: ',
//                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                     SelectableText(
//                       vm.currentIndex >= 0
//                           ? vm.history.sublist(0, vm.currentIndex + 1).join('')
//                           : '(Chưa có)',
//                       style: const TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.deepPurple,
//                         fontFamily: 'monospace', // Đẹp, đều chữ
//                         letterSpacing: 1.5,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.all(16),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'Lịch sử Time Travel List',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//                   ),
//                 ),
//               ),
//               // Danh sách lịch sử
//               Expanded(
//                 child: vm.history.isEmpty
//                     ? const Center(
//                         child: Text(
//                           '(Chưa có trạng thái)',
//                           style: TextStyle(color: Colors.grey, fontSize: 16),
//                         ),
//                       )
//                     : ListView.builder(
//                         padding: const EdgeInsets.symmetric(horizontal: 16),
//                         itemCount: vm.history.length,
//                         itemBuilder: (context, index) {
//                           final isCurrent = index == vm.currentIndex;
//                           final stateValue = vm.history[index];

//                           return Card(
//                             elevation: isCurrent ? 4 : 1,
//                             color: isCurrent ? Colors.purple[100] : null,
//                             child: ListTile(
//                               leading: isCurrent
//                                   ? const Icon(Icons.check_circle, color: Colors.green)
//                                   : const Icon(Icons.history),
//                               title: Text('State: $stateValue'),
//                               trailing: isCurrent
//                                   ? const Text('', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green))
//                                   : null,
//                               onTap: () {
//                                 if (!isCurrent) {
//                                   vm.travelTo(index);
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     SnackBar(
//                                       content: Text('Đã quay về State: $stateValue'),
//                                       duration: const Duration(milliseconds: 800),
//                                     ),
//                                   );
//                                 }
//                               },
//                             ),
//                           );
//                         },
//                       ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

// class _ViewModel {
//   final List<int> history;
//   final int currentIndex;
//   final void Function(int) updateState;
//   final void Function(int) travelTo;

//   _ViewModel({
//     required this.history,
//     required this.currentIndex,
//     required this.updateState,
//     required this.travelTo,
//   });
// }
