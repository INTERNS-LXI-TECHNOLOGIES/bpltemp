import 'package:flutter/material.dart';
import 'package:invoice_frontend/InvoiceWidget.dart';
import 'package:openapi/openapi.dart';


class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;


Future<void> _login() async{
  setState(() {
    _isLoading = true;
  });

  try{
    LoginVMBuilder loginVMBuilder = LoginVMBuilder()
    ..username = _usernameController.text
    ..password = _passwordController.text;
    LoginVM loginVM = loginVMBuilder.build();

    final response =await Openapi()
    .getAuthenticateControllerApi().authorize(loginVM: loginVM);

    if(response.statusCode == 200){
      Openapi.jwt = response.data?.idToken;

      final accountResponse = await Openapi().getAccountResourceApi().getAccount(headers: {'Authorization': 'Bearer ${Openapi.jwt}'});
      if(accountResponse.statusCode == 200){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const InvoiceWidget()) 
    );
    print('Login successful');
    print('Bearer Toke: ${Openapi.jwt}');
        } else {
          _showErrorDialog('Failed to fetch account details.');
        }
      } else {
        _showErrorDialog('Invalid username or password.');
      }
    } catch (e) {
      _showErrorDialog('An error occurred: $e');
    }

    setState(() {
      _isLoading = false;
    });
  }
    void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Login Failed'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.lock, size: 80, color: Colors.white),
              const SizedBox(height: 20),
              TextField(
                controller: _usernameController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: const TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.blueGrey[800],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: const TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.blueGrey[800],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  child: const Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
