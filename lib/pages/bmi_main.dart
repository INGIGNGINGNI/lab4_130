import 'package:bmi_app/pages/bmi_result.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
// import 'package:fluttertoast/fluttertoast.dart';

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
              icon: const Icon(Icons.favorite_border),
            ),
          ],
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/bg_form2.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              faicon(),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              topictext(),
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
              enterbtn(context),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton enterbtn(BuildContext context) {
    return ElevatedButton.icon(
      icon: const FaIcon(FontAwesomeIcons.checkSquare),
      label: const Text(
        'ตกลง',
        style: TextStyle(fontSize: 18),
      ),
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
          // Fluttertoast.showToast(
          //   msg: 'กรุณากรอกข้อมูลให้ครบถ้วน',
          //   timeInSecForIosWeb: 3,
          // );
          Alert(
            context: context,
            type: AlertType.error,
            title: 'ผิดพลาด',
            style: const AlertStyle(
                titleStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Colors.red)),
            desc: 'กรุณากรอกส่วนสูงและน้ำหนักของคุณ',
            buttons: [
              DialogButton(
                child: const Text(
                  "ลองใหม่",
                  style: TextStyle(color: Colors.red, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                width: 120,
                radius: const BorderRadius.all(Radius.circular(10)),
                border:
                    const Border.fromBorderSide(BorderSide(color: Colors.red)),
                color: Colors.white,
              )
            ],
          ).show();
        }
      },
      style: ElevatedButton.styleFrom(
          // primary: Colors.pink,
          fixedSize: const Size(150, 50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
    );
  }

  Text topictext() {
    return const Text(
      'คำนวณหาค่า BMI ของคุณ',
      style: TextStyle(
          fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
    );
  }

  FaIcon faicon() {
    return const FaIcon(
      FontAwesomeIcons.running,
      color: Colors.green,
      size: 90,
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
        maxLength: 3,
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
        maxLength: 3,
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
