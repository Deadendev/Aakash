import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aakash Terminal',
      home: const TerminalScreen(),
    );
  }
}

class TerminalScreen extends StatefulWidget {
  const TerminalScreen({super.key});

  @override
  State<TerminalScreen> createState() => _TerminalScreenState();
}

class _TerminalScreenState extends State<TerminalScreen> {
  final List<String> _output = [];
  final TextEditingController _controller = TextEditingController();

  void _addCommand(String command) {
    setState(() {
      _output.add('> $command');
      _controller.clear();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Aakash Terminal')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _output.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.terminal),
                  title: Text(_output[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter command',
                    ),
                    onSubmitted: (value) {
                      if (value.isNotEmpty) {
                        _addCommand(value);
                      }
                    },
                  ),
                ),
                const SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    final command = _controller.text.trim();
                    if (command.isNotEmpty) {
                      _addCommand(command);
                    }
                  },
                  child: const Text('Run'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}