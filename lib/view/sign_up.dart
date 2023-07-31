import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:read_in/view/start.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
                        hintText: 'İsim',
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide:
                                BorderSide(color: Colors.black, width: 2)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide:
                                BorderSide(color: Colors.black, width: 10))),
                  ),
                  SizedBox(
                    height: 15,
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
                            'Şifreniz en az 8 karakter olmalıdır.',
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
                        'KAYIT OL',
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.normal),
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 19,
                  ),
                  RichText(
                      text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: [
                        TextSpan(
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                            text: 'Zaten bir hesabın var mı?'),
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => StartPage(),
                                  )),
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 12,
                              color: Colors.black,
                            ),
                            text: 'Giriş yap'),
                      ]))
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
