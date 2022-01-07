import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key, this.weight, this.height}) : super(key: key);

  final String? weight;
  final String? height;

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  double? _result;
  String? _msg;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'BMI Calculate',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/bg_form.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.all(50)),
              const Text(
                'BMI',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.green),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 20)),
              SizedBox(
                width: 300,
                child: Column(
                  children: [
                    Text(
                      'น้ำหนัก : ${widget.weight!}' + ' กิโลกรัม',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 10)),
                    Text(
                      'ส่วนสูง : ${widget.height!}' + ' เซนติเมตร',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            calculate();
                          },
                          child: const Text(
                            'คำนวณ',
                            style: TextStyle(fontSize: 20),
                          ),
                          style: ElevatedButton.styleFrom(
                              // primary: Colors.pink,
                              fixedSize: const Size(120, 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                        const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10)),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'กลับ',
                            style: TextStyle(fontSize: 20),
                          ),
                          style: ElevatedButton.styleFrom(
                              // primary: Colors.pink,
                              fixedSize: const Size(120, 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 25, 10, 10),
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        image: DecorationImage(
                            fit: BoxFit.none,
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.4), BlendMode.dstIn),
                            image: const AssetImage('images/bg_form.jpg')),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Text(
                        _result == null
                            ? 'No result'
                            : _result!.toStringAsFixed(2),
                        style: const TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w700,
                            color: Colors.green),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.4), BlendMode.dstIn),
                            image: const AssetImage('images/bg_form.jpg')),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Text(
                        'การแปลผล : ' + _msg.toString(),
                        style: const TextStyle(fontSize: 22),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              // const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            ],
          ),
        ),
      ),
    );
  }

  void calculate() {
    double height = double.parse(widget.height!) / 100;
    double weight = double.parse(widget.weight!);

    double heightSquare = height * height;
    // double result = weight / heightSquare;
    // _result = result;

    setState(() {
      double result = weight / heightSquare;
      _result = result;
      if (_result! < 18.5) {
        _msg = 'น้ำหนักน้อยเกินไป';
      } else if (_result! <= 22.99) {
        _msg = 'น้ำหนักปกติ';
      } else if (_result! <= 24.99) {
        _msg = 'น้ำหนักเกิน (ท้วม)';
      } else if (_result! <= 29.99) {
        _msg = 'อ้วนระดับ 1 (อ้วนระยะเริ่มต้น)';
      } else if (_result! <= 39.99) {
        _msg = 'อ้วนระดับ 2 (อ้วนมาก)';
      } else {
        _msg = 'อ้วนระดับ 3 (อ้วนระดับรุนแรงมาก)';
      }
    });
  }
}
