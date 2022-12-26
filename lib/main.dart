import 'package:flutter/material.dart';

import 'constants.dart';

void main() {
  runApp(MyTest());
}

class MyTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.purple[50],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuestionPage(),
          ),
        ),
      ),
    );
  }
}

class QuestionPage extends StatefulWidget {
  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  List<Widget> secimler = [];
  int sualNomresi = 0;

  List<String> suallar = [
    'Fevral ayında 31 gün var.',
    '2 və 3-ün cəmi 5-ə bərabərdir.',
    'İndi saat 15:30dur. 145 saat sonra saat 16:30 olacaq',
    '2010-cu ildə dünya kubokunu İspaniya qazanıb',
    'Dövri sistem cədvəlində Oksigenin sıra nömrəsi 10-dur',
    ""
  ];

  List<bool> cavablar = [false, true, true, true, false, false];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
                child: Text(
              suallar[sualNomresi],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
              ),
            )),
          ),
        ),
        Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 3,
          spacing: 3,
          direction: Axis.horizontal,
          children: secimler,
        ),
        Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: [
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  child: ElevatedButton(
                    child: Icon(
                      Icons.thumb_down,
                      size: 30.0,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      bool dogruCavablar = cavablar[sualNomresi];
                      setState(() {
                        dogruCavablar == false
                            ? secimler.add(kdogruIconu)
                            : secimler.add(kyanlisIconu);
                        // if (dogruCavab == false) {
                        //   secimler.add(kdogruIconu);
                        // } else {
                        //   secimler.add(kyanlisIconu);
                        // }
                        sualNomresi++;
                        //secimler.add(kyanlisIconu);
                      });
                    },
                  ),
                )),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  child: ElevatedButton(
                    child:
                        Icon(Icons.thumb_up, size: 30.0, color: Colors.green),
                    onPressed: () {
                      bool dogruCavablar = cavablar[sualNomresi];
                      setState(() {
                        dogruCavablar == true
                            ? secimler.add(kdogruIconu)
                            : secimler.add(kyanlisIconu);
                        // if (dogruCavab == false) {
                        //   secimler.add(kdogruIconu);
                        // } else {
                        //   secimler.add(kyanlisIconu);
                        // }
                        sualNomresi++;
                        //secimler.add(kyanlisIconu);
                      });
                    },
                  ),
                ))
              ]),
            ))
      ],
    );
  }
}
