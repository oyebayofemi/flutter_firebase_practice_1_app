import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegistrationDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 200,
        child: Column(children: [
          Container(
              padding: EdgeInsets.all(10),
              height: 100,
              child: SvgPicture.asset('assets/svg/success.svg')),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              color: Colors.grey[400],
              child: Column(
                children: [
                  Container(
                    child: Text(
                      'Registration Successful!!.',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    alignment: Alignment.bottomCenter,
                    child: FlatButton(
                      color: Colors.blue,
                      child: Text(
                        'okay',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
