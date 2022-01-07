import 'package:bmi_app/pages/bmi_result.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _height = TextEditingController();

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FaIcon(
                FontAwesomeIcons.running,
                color: Colors.green,
                size: 90,
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              const Text(
                'คำนวณหาค่า BMI ของคุณ',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    weight(),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                    height(),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 20)),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    var route = MaterialPageRoute(
                      builder: (context) => ResultPage(
                        weight: _weight.text,
                        height: _height.text,
                      ),
                    );
                    Navigator.push(context, route);
                  } else {
                    Fluttertoast.showToast(
                      msg: 'กรุณากรอกข้อมูลให้ครบถ้วน',
                      timeInSecForIosWeb: 3,
                    );
                  }
                },
                child: const Text(
                  'ยืนยัน',
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                    // primary: Colors.pink,
                    fixedSize: const Size(150, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox height() {
    return SizedBox(
      width: 350,
      child: TextFormField(
        controller: _height,
        validator: (value) {
          if (value!.isEmpty) {
            return 'กรุณากรอกส่วนสูง';
          }
        },
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          label: Text(
            'ส่วนสูง (เซนติเมตร)',
            style: TextStyle(color: Colors.grey[800], fontSize: 18),
          ),
          prefixIcon: const Icon(Icons.height),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              width: 2,
              color: Colors.black,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              width: 2,
              color: Colors.green,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              width: 2,
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              width: 2,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }

  SizedBox weight() {
    return SizedBox(
      width: 350,
      child: TextFormField(
        controller: _weight,
        validator: (value) {
          if (value!.isEmpty) {
            return 'กรุณากรอกน้ำหนัก';
          }
        },
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          label: Text(
            'น้ำหนัก (กิโลกรัม)',
            style: TextStyle(color: Colors.grey[800], fontSize: 18),
          ),
          prefixIcon: const Icon(Icons.monitor_weight),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              width: 2,
              color: Colors.black,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              width: 2,
              color: Colors.green,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              width: 2,
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              width: 2,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
