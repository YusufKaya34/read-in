import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            SizedBox(
                height: 300,
                width: 150,
                child: Image.asset('assets/images/read.png')),
            Form(
                child: Padding(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(14),
                        hintText: 'Mail',
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide:
                                BorderSide(color: Colors.black, width: 2)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(1000),
                            borderSide: BorderSide())),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(14),
                        hintText: 'Şifre',
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide:
                                BorderSide(color: Colors.black, width: 2)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(
                              color: Colors.black,
                            ))),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Şifremi unuttum.',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          minimumSize: MaterialStatePropertyAll(Size(300, 40)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100)))),
                      onPressed: () {},
                      child: Text(
                        'GİRİŞ YAP',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal),
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          minimumSize: MaterialStatePropertyAll(Size(300, 40)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  side:
                                      BorderSide(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.circular(100)))),
                      onPressed: () {},
                      child: Text(
                        'KAYIT OL',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.normal),
                      ))
                ],
              ),
            )),
            Spacer()
          ],
        ),
      ),
    );
  }
}
