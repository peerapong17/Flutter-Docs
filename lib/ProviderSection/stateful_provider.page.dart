import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_docs/ProviderSection/provider/stateful_provider.dart';

class StatefulProviderPage extends StatefulWidget {
  const StatefulProviderPage({Key? key}) : super(key: key);

  @override
  _StatefulProviderPageState createState() => _StatefulProviderPageState();
}

class _StatefulProviderPageState extends State<StatefulProviderPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<StatefulProvider>(
      builder: (context, statefulProvider, child) => Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Text(
                      "Stateful Provider",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      statefulProvider.count.toString(),
                      style:
                          TextStyle(fontSize: 120, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            statefulProvider.count++;
            setState(() {});
          },
          child: Text(
            "+",
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
