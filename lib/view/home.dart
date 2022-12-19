import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../bloc/theme_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: scaffoldKey,
      appBar: AppBar(
          backgroundColor: Color(int.parse(ThemeBloc.selectedColor.toString())),
          title: Text('HOME',
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
          centerTitle: true),
      drawer: Drawer(
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          child: Column(
            children: [
              DrawerHeader(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                  child: UserAccountsDrawerHeader(
                      decoration: BoxDecoration(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer),
                      accountName: const Text('ThemeDemo'),
                      accountEmail: const Text('themedemo@demo.com')))
            ],
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<ThemeBloc, ThemeInitial>(
            builder: (context, state) {
              return ColorPicker(
                pickerColor: Color(int.parse(state.color)),
                onColorChanged: (Color value) {
                  ThemePreferences.setTheme(
                      "0x${value.value.toRadixString(16).toString()}");
                  BlocProvider.of<ThemeBloc>(context).add(const ThemeEvent());
                },
              );
            },
          ),
          ElevatedButton(
              onPressed: () {}, child: const Text('ELEVATED BUTTON')),
          OutlinedButton(
              onPressed: () {}, child: const Text('OUTLINED BUTTON')),
          TextButton(onPressed: () {}, child: const Text('Text BUTTON')),
          const Card(
            child: ListTile(
              trailing: Icon(Icons.login_outlined, size: 50),
              leading: Icon(Icons.account_circle_rounded, size: 50),
              title: Text('Card Title'),
              subtitle: Text('Card Subtitle'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 2),
                        blurRadius: 5,
                        color: Theme.of(context).colorScheme.onPrimaryContainer)
                  ],
                  borderRadius: BorderRadius.circular(8)),
              child: const ListTile(
                trailing: Icon(Icons.login_outlined, size: 50),
                leading: Icon(Icons.account_circle_rounded, size: 50),
                title: Text('Container Title'),
                subtitle: Text('Container Subtitle'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
