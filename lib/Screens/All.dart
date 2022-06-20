import 'package:flutter/material.dart';
import 'package:tasks_flutter_app/constants/colors.dart';
import 'package:tasks_flutter_app/models/Task.dart';
import '../constants/data.dart';
import '../constants/db.dart';
import '../constants/todo_model.dart';
import 'adds.dart';

class All extends StatefulWidget {
  final String? title;
  final IconData? icon;
  final String? subtitle;

  All({
    this.title,
    this.icon,
    this.subtitle,
  });

  @override
  State<All> createState() => _AllState();
}

class _AllState extends State<All> {
  List<Map<String, dynamic>> data = [];

  @override
  void initState() {
    fetchAll();
    super.initState();
  }

  fetchAll() async {
    switch (widget.title) {
      case 'All':
        await TodoData.readTodo('All');
        print(TodoData.All);
        data = TodoData.All;
        break;
      case 'Work':
        await TodoData.readTodo('Work');
        print(TodoData.Work);
        data = TodoData.Work;
        break;
      case 'Music':
        await TodoData.readTodo('Music');
        print(TodoData.Music);
        data = TodoData.Music;
        break;
      case 'Travel':
        await TodoData.readTodo('Travel');
        print(TodoData.Travel);
        data = TodoData.Travel;
        break;
      case 'Study':
        await TodoData.readTodo('Study');
        print(TodoData.Study);
        data = TodoData.Study;
        break;
      case 'Home':
        await TodoData.readTodo('Home');
        print(TodoData.Home);
        data = TodoData.Home;
        break;
      case 'Shopping':
        await TodoData.readTodo('Shopping');
        print(TodoData.Shopping);
        data = TodoData.Shopping;
        break;
      case 'Paint':
        await TodoData.readTodo('Paint');
        print(TodoData.Paint);
        data = TodoData.Paint;
        break;
    }

    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolor.blue,
      body: customScrollViews(context),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Add()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget customScrollViews(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _buildAppBar(context),
        SliverToBoxAdapter(
          child: Container(
            decoration: const BoxDecoration(
              color: Mycolor.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 18),
                  child: Text("All Todo"),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(data.length, (index) => Column(
                    children: [
                      taskItem(
                        title: data[index]['planning'],
                        date: DateTime.parse(data[index]['date']), 
                        done: data[index]['done']),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 80,
                      ),
                    ],
                  )),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 230,
      backgroundColor: Mycolor.blue,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.navigate_before),
        iconSize: 30,
      ),
      actions: [
        const Icon(
          Icons.more_vert,
          size: 30,
        )
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 38.0, top: 95),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Mycolor.white,
                  child: Icon(
                    widget.icon,
                    color: Mycolor.blue,
                    size: 35,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 60),
                Text(
                  widget.title!,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Mycolor.white),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 60),
                Text(
                  widget.subtitle!,
                  style: const TextStyle(color: Mycolor.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget taskItem({String? title, DateTime? date, bool? done}) {
    return Column(
      children: [
        CheckboxListTile(
            title: Text(title!,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            subtitle: Text(
              formatter.format(date!),
              style: TextStyle(color: Mycolor.red),
            ),
            value: done,
            onChanged: (value) {
              setState(() {
                // this.value1 = value!;
              });
            })
      ],
    );
  }
}
