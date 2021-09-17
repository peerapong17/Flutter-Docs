import 'package:flutter/material.dart';
import 'package:flutter_docs/ProviderSection/provider/stateless_provider.dart';
import 'package:provider/provider.dart';

class StatelessProviderPage extends StatelessWidget {
  const StatelessProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StatelessProvider>(
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
                      "Stateless Provider",
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
