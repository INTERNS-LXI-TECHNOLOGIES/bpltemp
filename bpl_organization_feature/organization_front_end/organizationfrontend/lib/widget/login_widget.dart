import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:organizationfrontend/widget/logistics_dashboard.dart';

class LoginWidget extends StatelessWidget {
  final Function(Locale) setLocale;

  LoginWidget({required this.setLocale}); // Accepts setLocale as a required parameter

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  LoginVMBuilder loginVMBuilder = LoginVMBuilder()
                    ..username = usernameController.text
                    ..password = passwordController.text;
                  LoginVM loginVM = loginVMBuilder.build();
                  final response = await Openapi().getAuthenticateControllerApi().authorize(loginVM: loginVM);

                  if (response.statusCode == 200 || response.statusCode == 201) {
                    Openapi.jwt = response.data!.idToken!;
                  } else {
                    print('Login failed!');
                  }
                  print('openapi: ${Openapi.jwt}');
                  final accResponse = await Openapi().getAccountResourceApi().getAccount(headers: {'Authorization': 'Bearer ${Openapi.jwt}'});

                  if (accResponse.statusCode == 200) {
                    print('Login successful!');
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LogisticsDashboard(setLocale: setLocale)), // Pass setLocale
                    );
                  } else {
                    print('Login failed!');
                  }
                } catch (e) {
                  print('Error: $e');
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
