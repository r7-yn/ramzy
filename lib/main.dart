import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const myapp());
}

class myapp extends StatelessWidget {
  const myapp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: quizl(),
    );
  }
}

class quizl extends StatefulWidget {
  const quizl({super.key});

  @override
  State<quizl> createState() => _quizlState();
}

class _quizlState extends State<quizl> {
  TextEditingController con = TextEditingController();
  String operation = '';
  String result = '';
  void _calculate() {
    int number = int.tryParse(con.text) ?? 0;
    setState(() {
      if (operation == 'f') {
        result = (number * 2).toString();
      } else if (operation == 'mult') {
        result = List.generate(10, (index) => (number * (index + 1)).toString())
            .join('\n');
      } else if (operation == 'convert') {
        result = (-number).toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFiled("ادخل الرقم", "number1", con),
          SizedBox(
            height: 24,
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(10),
              color: Color.fromARGB(255, 41, 37, 37),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operation = 'f';
                          _calculate();
                        });
                      },
                      child: Text("مضروبه في نفسه")),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operation = 'mult';
                          _calculate();
                        });
                      },
                      child: Text("مضاعفاته")),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          operation = 'convert';
                          _calculate();
                        });
                      },
                      child: Text("التحويل")),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          con.clear();
                        });
                      },
                      child: Text("تنظيف")),
                  SizedBox(
                    height: 22,
                  ),
                  Center(
                    child: Container(
                      width: 100,
                      color: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          result,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding TextFiled(hint, lbl, con) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: con,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            fillColor: Colors.blueGrey,
            filled: true,
            hintText: hint,
            labelText: lbl,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)))),
      ),
    );
  }
}
