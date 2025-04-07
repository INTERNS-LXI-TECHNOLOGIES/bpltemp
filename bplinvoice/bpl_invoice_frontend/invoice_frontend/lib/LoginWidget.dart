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

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final loginVMBuilder = LoginVMBuilder()
        ..username = _usernameController.text
        ..password = _passwordController.text;
      final loginVM = loginVMBuilder.build();

      final openapiInstance = Openapi();
      final response = await openapiInstance
          .getAuthenticateControllerApi()
          .authorize(loginVM: loginVM);

      if (response.statusCode == 200) {
        final jwtToken = response.data?.idToken ?? "";
        if (jwtToken.isEmpty) {
          _showErrorDialog('Received empty authentication token');
          return;
        }

        // Verify the token by fetching account details
        openapiInstance.jwt = jwtToken;
        final accountResponse = await openapiInstance.getAccountResourceApi().getAccount(
          headers: {'Authorization': 'Bearer $jwtToken'},
        );

        if (accountResponse.statusCode == 200) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => InvoiceWidget(token: jwtToken),
            ),
          );
          print('Login successful');
          print('Bearer Token: $jwtToken');
        } else {
          _showErrorDialog('Failed to verify account details');
        }
      } else {
        _showErrorDialog('Invalid username or password');
      }
    } catch (e) {
      _showErrorDialog('An error occurred: ${e.toString()}');
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Login Failed'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.lock, size: 80, color: Colors.white),
                const SizedBox(height: 30),
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
                    prefixIcon: const Icon(Icons.person, color: Colors.white70),
                  ),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 15),
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
                    prefixIcon: const Icon(Icons.lock, color: Colors.white70),
                  ),
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => _login(),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[700],
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          )
                        : const Text(
                            'LOGIN',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}