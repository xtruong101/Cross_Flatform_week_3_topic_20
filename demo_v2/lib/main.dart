import 'package:flutter/material.dart';
//import 'package:flutter/services.dart'; 
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'redux/actions.dart';
import 'redux/store.dart';
import 'redux/reducers.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Time Travel Debugging',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white, 
        ),
        home: const TimeTravelScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class TimeTravelScreen extends StatelessWidget {
  const TimeTravelScreen({super.key});
  // Hiển thị snackbar
  void _showSnack(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(milliseconds: 600)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Travel Debugging'),
        centerTitle: true,
        elevation: 2,
      ),
      body: StoreConnector<AppState, _ViewModel>(
        converter: (store) => _ViewModel(
          history: store.state.history,
          currentIndex: store.state.currentIndex,
          updateState: (value) => store.dispatch(UpdateStateAction(value)),
          travelTo: (index) => store.dispatch(TravelToStateAction(index)),
        ),
        builder: (context, vm) {

          final currentSequence = vm.currentIndex >= 0
              ? vm.history.sublist(0, vm.currentIndex + 1).join('')
              : '(Chưa có)';

          return Column(
            children: [

              const _NumberButtons(),

              _CurrentStateDisplay(sequence: currentSequence),

              const Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Lịch sử Time Travel:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ),

              Expanded(
                child: vm.history.isEmpty
                    ? const Center(
                        child: Text(
                          '(Chưa có trạng thái)',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: vm.history.length,
                        itemBuilder: (context, index) {
                          final isCurrent = index == vm.currentIndex;
                        
                          return Card(
                            elevation: isCurrent ? 4 : 1,
                            color: isCurrent ? Colors.white : null,
                            child: ListTile(
                              leading: Icon(
                                isCurrent ? Icons.check_circle : Icons.history,
                                color: isCurrent ? Colors.green : null,
                              ),
                              title: Row(
                                children: [
                                  // State n
                                  Text(
                                    'State ${index + 1}: ',
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  // Action: x
                                  Text(
                                    'Action: ${vm.history[index]}',
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  const SizedBox(width: 16),
                                  // Sequence: abc
                                  Expanded(
                                    child: Text(
                                      'Sequence: ${vm.history.sublist(0, index + 1).join('')}',
                                      style: const TextStyle(
                                        //fontFamily: 'monospace',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              onTap: isCurrent ? null : () {
                                      vm.travelTo(index);
                                      _showSnack(context, 'Đã quay về State ${index + 1}');
                                    },
                            ),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}


class _NumberButtons extends StatelessWidget {
  const _NumberButtons();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, void Function(int)>(
      converter: (store) => (value) => store.dispatch(UpdateStateAction(value)),
      builder: (context, updateState) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: List.generate(10, (i) {
              final value = i;
              return SizedBox(
                width: 120,
                height: 60,
                child: ElevatedButton(
                  onPressed: () => updateState(value),
                  child: Text('$value', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}


class _CurrentStateDisplay extends StatelessWidget {
  final String sequence;
  const _CurrentStateDisplay({required this.sequence});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blueGrey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Chuỗi số hiện tại: ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SelectableText(
            sequence,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'monospace',
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}

class _ViewModel {
  final List<int> history;
  final int currentIndex;
  final void Function(int) updateState;
  final void Function(int) travelTo;

  _ViewModel({
    required this.history,
    required this.currentIndex,
    required this.updateState,
    required this.travelTo,
  });
}


