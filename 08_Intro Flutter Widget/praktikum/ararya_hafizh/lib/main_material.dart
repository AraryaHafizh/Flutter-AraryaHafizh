// .txt karena menghindari error.

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MaterialApp'),
      ),
      body: tulisanView(),
      drawer: sideDrawer(),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }

  Widget tulisanView() {
    return const Center(
      child: Text('This is Material App'),
    );
  }

  Widget contactView() {
    List<String> names = [
      'Budi Santoso',
      'Alice Johnson',
      'Charlie Brown',
      'David Smith',
      'Ella Davis',
      'Frank White',
      'Grace Miller',
      'Henry Clark',
      'Isabella Lee',
      'Jack Young',
      'Katherine Lewis',
      'Liam Hall',
      'Mia Turner',
      'Noah Adams',
      'Olivia Ward',
      'Patrick Evans',
      'Quinn Moore',
      'Ruby Foster',
      'Samuel Patterson',
    ];

    List<String> phones = [
      '0812-1212-4567',
      '0812-1212-1234',
      '0812-1212-5678',
      '0812-1212-9876',
      '0812-1212-4321',
      '0812-1212-8765',
      '0812-1212-1111',
      '0812-1212-2222',
      '0812-1212-3333',
      '0812-1212-4444',
      '0812-1212-5555',
      '0812-1212-6666',
      '0812-1212-7777',
      '0812-1212-8888',
      '0812-1212-9999',
      '0812-1212-0000',
      '0812-1212-0101',
      '0812-1212-0202',
      '0812-1212-0303',
      '0812-1212-0404',
    ];

    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 20),
      itemCount: names.length,
      separatorBuilder: (context, index) =>
          const SizedBox(height: 15), // Tambahkan jarak di sini
      itemBuilder: (context, index) {
        return contactMaker(names[index], phones[index]);
      },
    );
  }

  Widget contactMaker(String name, String phone) {
    String initials = name[0].toUpperCase();
    return Row(
      children: [
        CircleAvatar(
          radius: 26,
          backgroundColor: Colors.green[400],
          child: Text(
            initials,
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
        const SizedBox(
          width: 22,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(phone, style: TextStyle(color: Colors.white30, fontSize: 15)),
          ],
        )
      ],
    );
  }

  Widget sideDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 7, 123, 255)),
              child: Text('Drawer Header')),
          ListTile(
            onTap: () {},
            // leading: Icon(Icons.account_circle),
            title: const Text('Home'),
          ),
          ListTile(
            onTap: () {},
            // leading: Icon(Icons.account_circle),
            title: const Text('Settings'),
          ),
        ],
      ),
    );
  }
}
