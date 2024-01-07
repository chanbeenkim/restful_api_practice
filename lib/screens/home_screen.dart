import 'package:flutter/material.dart';
import 'package:restful_api_practice/service/data_service.dart';

import '../models/data_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Data>? datas;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    loadDatas();
  }

  Future<void> loadDatas() async {
    final dataService = DataService();
    datas = await dataService.getAllData();
    setState(() {
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoaded && datas != null
          ? SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Expanded(
                          child: Text('UserId', textAlign: TextAlign.center)),
                      Expanded(
                          child: Text('Title', textAlign: TextAlign.center)),
                      Expanded(
                          child:
                              Text('Completed', textAlign: TextAlign.center)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: datas!
                              .map(
                                (data) => Column(
                                  children: [
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "${data.id}",
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(data.title),
                                        ),
                                        Expanded(
                                          child: Text(
                                            "${data.completed}",
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    const Divider(),
                                  ],
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
