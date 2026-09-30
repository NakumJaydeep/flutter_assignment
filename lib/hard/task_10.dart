import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class User {
  final String username;
  final String password;
  User({required this.username, required this.password});
}

class UserProvider extends ChangeNotifier {
  final List<User> _users = [
    User(username: 'admin', password: '123'),
    User(username: 'user1', password: 'password'),
    User(username: 'test', password: 'test'),
  ];

  bool validateUser(String username, String password) {
    return _users.any((u) => u.username == username && u.password == password);
  }
}

class HardTask10 extends StatefulWidget {
  const HardTask10({super.key});

  @override
  State<HardTask10> createState() => _HardTask10State();
}

class _HardTask10State extends State<HardTask10> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final provider = Provider.of<UserProvider>(context, listen: false);
      if (provider.validateUser(_usernameController.text, _passwordController.text)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login Successful!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid username or password')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(title: const Text('Hard 10: Multi-user Login')),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(labelText: 'Username'),
                    validator: (val) => val == null || val.isEmpty ? 'Enter username' : null,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    validator: (val) => val == null || val.isEmpty ? 'Enter password' : null,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _login(context),
                    child: const Text('Login'),
                  ),
                  const SizedBox(height: 20),
                  const Text('Valid accounts: admin/123, user1/password, test/test'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
