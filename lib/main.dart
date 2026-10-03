
import 'package:flutter/material.dart';

void main() {
  runApp(const HabitMarketApp());
}

class HabitMarketApp extends StatelessWidget {
  const HabitMarketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class Task {
  final String name;
  final int reward;
  bool done;

  Task({required this.name, required this.reward, this.done = false});
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int balance = 0;

  final List<Task> tasks = [
    Task(name: 'دراسة نص ساعة', reward: 20),
    Task(name: 'قراءة صفحة', reward: 10),
  ];

  void toggleTask(Task task) {
    setState(() {
      if (!task.done) {
        task.done = true;
        balance += task.reward;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('سوق العادات'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Colors.amber.shade100,
            child: Text(
              '💰 $balance',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    title: Text(task.name),
                    subtitle: Text('+${task.reward}'),
                    trailing: Icon(
                      task.done ? Icons.check_circle : Icons.radio_button_unchecked,
                      color: task.done ? Colors.green : Colors.grey,
                    ),
                    onTap: () => toggleTask(task),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
