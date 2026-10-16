
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoPage(),
    );
  }
}

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  TextEditingController todoController = TextEditingController();

  List<String> tasks = [
    'making video',
    'set aside money for necessities',
    'work on buyer deadlines',
    'learn new things',
  ];

  Color yellow = const Color(0xFFFFD51B);

  void addTask() {
    if (todoController.text.isNotEmpty) {
      setState(() {
        tasks.add(todoController.text);
        todoController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: yellow,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.fromLTRB(24, 30, 24, 24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(9),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'TODO',
                style: TextStyle(
                  fontSize: 54,
                  height: 1,
                  fontWeight: FontWeight.w900,
                ),
              ),

              Text(
                'LIST',
                style: TextStyle(
                  fontSize: 48,
                  height: 1.05,
                  color: yellow,
                ),
              ),

              const SizedBox(height: 30),

              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: todoController,
                      onSubmitted: (_) => addTask(),
                      decoration: InputDecoration(
                        hintText: 'what your todo..',
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 16,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  SizedBox(
                    width: 58,
                    height: 58,
                    child: ElevatedButton(
                      onPressed: addTask,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: yellow,
                        foregroundColor: Colors.black,
                        elevation: 0,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                          side: const BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                      ),
                      child: const Icon(Icons.add, size: 36),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              const Divider(
                thickness: 1.5,
                color: Color(0xFFCCCCCC),
              ),

              const SizedBox(height: 18),

              Expanded(
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(19),
                      decoration: BoxDecoration(
                        color: index.isEven ? yellow : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      child: Text(
                        tasks[index],
                        style: const TextStyle(fontSize: 14),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
