import 'package:flutter/material.dart';

class loginscreen extends StatelessWidget 
{
  final String loginLabel;
  final String passwordLabel;

  loginscreen(this.loginLabel, this.passwordLabel);

  @override
  Widget build(BuildContext context)
  {
    return Container(
      color: Theme.of(context).primaryColorLight,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column: (
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      loginLabel,
                      ),
                    Text(
                      passwordLabel,
                     ),
                  ])),
          ],
      )
    );
  }
}