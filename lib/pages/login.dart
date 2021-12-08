import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _unfocusedColor = Colors.grey[600];
  final _usernameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _usernameFocusNode.addListener(() {
      setState(() {
        //Redraw so that the username label reflects the focus state
      });
    });
    _passwordFocusNode.addListener(() {
      setState(() {
        //Redraw so that the password label reflects the focus state
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        children: <Widget>[
          const SizedBox(height: 80.0),
          Column(
            children: <Widget>[
              Image.asset('assets/logo.png',
                  fit: BoxFit.contain, height: 100, width: 200),
              const SizedBox(height: 20.0),
              Text(
                'Mina\'s Store',
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
          const SizedBox(height: 50.0),
          //Username
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(
              labelText: 'Username',
              labelStyle: TextStyle(
                  color: _usernameFocusNode.hasFocus
                      ? Theme.of(context).colorScheme.secondary
                      : _unfocusedColor),
            ),
            focusNode: _usernameFocusNode,
          ),
          //spacer
          const SizedBox(height: 12.0),
          //Password
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: TextStyle(
                  color: _passwordFocusNode.hasFocus
                      ? Theme.of(context).colorScheme.secondary
                      : _unfocusedColor),
            ),
            obscureText: true,
            focusNode: _passwordFocusNode,
          ),
          //Button bar
          ButtonBar(
            children: [
              TextButton(
                onPressed: () {
                  //clear text field
                  _usernameController.clear();
                  _passwordController.clear();
                },
                child: const Text('CANCEL'),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.secondary,
                  ),
                  shape: MaterialStateProperty.all(
                    const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  //Show next page
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(8.0),
                  shape: MaterialStateProperty.all(
                    const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    ),
                  ),
                ),
                child: const Text('NEXT'),
              )
            ],
          ),
        ],
      ),
    ));
  }
}
