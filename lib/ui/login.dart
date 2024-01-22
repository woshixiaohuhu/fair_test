import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Welcome Back',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 60,
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(3),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black54,
                                        blurRadius: 20,
                                        offset: Offset(0, 10)),
                                  ]),
                              child: Column(
                                children: const [
                                  TextField(),
                                  TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ],
                              )),
                          const SizedBox(
                            height: 60,
                          ),
                          const Text('Forget password'),
                          const SizedBox(
                            height: 60,
                          ),
                          ElevatedButton(
                              onPressed: () {}, child: const Text('Login')),
                          const Text('Contiune with social media'),
                          const SizedBox(
                            height: 100,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                  onPressed: () {},
                                  child: const SizedBox(
                                      width: 120,
                                      child: Text(
                                        'Facebook',
                                        textAlign: TextAlign.center,
                                      ))),
                              ElevatedButton(
                                  onPressed: () {},
                                  child: const SizedBox(
                                      width: 120,
                                      child: Text('Github',
                                          textAlign: TextAlign.center))),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
