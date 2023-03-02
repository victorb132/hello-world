import 'package:flutter/material.dart';
import 'package:hello_world/app_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.network(
                    'https://avatars.githubusercontent.com/u/32309553?s=96&v=4'),
              ),
              accountName: Text('Victor Rodrigues Novais'),
              accountEmail: Text('victor96novais@gmail.com'),
            ),
            ListTile(
                leading: Icon(Icons.home),
                title: Text('Inicio'),
                subtitle: Text('tela de inicio'),
                onTap: () {
                  print('Home');
                }),
            ListTile(
                leading: Icon(Icons.logout),
                title: Text('Sair'),
                subtitle: Text('Finalizar sessão'),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/');
                }),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: const [
          CustomSwitch(),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Contador: $counter'),
            Container(
              height: 30,
            ),
            const CustomSwitch(),
            Container(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.amber,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.plus_one,
        ),
        onPressed: () {
          setState(() {
            counter++;
          });
        },
      ),
    );
  }
}

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({super.key});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.isDarkTheme,
      onChanged: (value) {
        setState(() {
          AppController.instance.changeTheme();
        });
      },
    );
  }
}
