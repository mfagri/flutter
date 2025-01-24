import 'package:coursa_maroc/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme(context),
      darkTheme: darkTheme(context),
      themeMode: ThemeMode.system,
      home: const OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Onboarding Screen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Circular Container with Icon
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Icon(
                  HugeIcons.strokeRoundedHome11,
                  size: 100,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              const SizedBox(height: 20),

              // Text Widget
              Text(
                'Welcome to the Onboarding Screen',
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 20),

              // Card Widget
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'This is a card widget',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // ElevatedButton
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 300,
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Text(
                            'This is a bottom sheet',
                            style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: const Text('Show Bottom Sheet'),
              ),
              const SizedBox(height: 20),

              // TextButton
              TextButton(
                onPressed: () {},
                child: Text(
                  'TextButton',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // OutlinedButton
              OutlinedButton(
                onPressed: () {},
                child: Text(
                  'OutlinedButton',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Checkbox
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                  Text(
                    'Checkbox',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Switch
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Switch(
                    value: true,
                    onChanged: (value) {},
                  ),
                  Text(
                    'Switch',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // TextField
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'TextField',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // BottomSheet Button
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 300,
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Text(
                            'This is a bottom sheet',
                            style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: const Text('Show Bottom Sheet'),
              ),

              FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.add),
              ),

              BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'Settings',
                  ),
                ],
              ),
              Wrap(
                spacing: 8.0,
                children: [
                  Chip(
                    label: Text('Chip 1'),
                    onDeleted: () {},
                  ),
                  Chip(
                    label: Text('Chip 2'),
                  ),
                ],
              ),
              Slider(
                value: 0.5,
                onChanged: (value) {},
              ),
              Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: 1,
                    onChanged: (value) {},
                  ),
                  Text('Option 1'),
                ],
              ),
              DropdownButton<String>(
                value: 'Option 1',
                items: ['Option 1', 'Option 2', 'Option 3']
                    .map((String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
                onChanged: (value) {},
              ),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('This is a SnackBar'),
                    ),
                  );
                },
                child: Text('Show SnackBar'),
              ),
              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 20),
              Icon(Icons.star),
              SizedBox(height: 20),
              Tooltip(
                message: 'This is a tooltip',
                child: Icon(Icons.info),
              ),
              DataTable(
                columns: const [
                  DataColumn(label: Text('Column 1')),
                  DataColumn(label: Text('Column 2')),
                ],
                rows: const [
                  DataRow(cells: [
                    DataCell(Text('Cell 1')),
                    DataCell(Text('Cell 2')),
                  ]),
                ],
              ),
              SizedBox(height: 20),
              ExpansionTile(
                title: Text('Expansion Tile'),
                children: [
                  ListTile(
                    title: Text('Item 1'),
                  ),
                  ListTile(
                    title: Text('Item 2'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Stepper(
                steps: const [
                  Step(
                      title: Text('Step 1'),
                      content: Text('Content for Step 1'),
                      isActive: true,
                      state: StepState.disabled),
                  Step(
                    title: Text('Step 2'),
                    content: Text('Content for Step 2'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text('Item 1'),
                  ),
                  PopupMenuItem(
                    child: Text('Item 2'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Alert Dialog'),
                      content: Text('This is an alert dialog.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Close'),
                        ),
                      ],
                    ),
                  );
                },
                child: Text('Show Alert Dialog'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                },
                child: Text('Show Time Picker'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                },
                child: Text('Show Date Picker'),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.star),
              title: Text('ListTile Title'),
              subtitle: Text('ListTile Subtitle'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('ListTile Title'),
              subtitle: Text('ListTile Subtitle'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
