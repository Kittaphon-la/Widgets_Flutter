import 'package:flutter/material.dart';

void main() {
  runApp(const LabApp());
}

class LabApp extends StatelessWidget {
  const LabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      // ✅ Named Routing
      initialRoute: '/',
      routes: {
        '/': (_) => const MenuPage(),
        '/actions': (_) => const ActionsPage(),
        '/communication': (_) => const CommunicationPage(),
        '/containment': (_) => const ContainmentPage(),
        '/navigation': (_) => const NavigationDemoPage(),
        '/selection': (_) => const SelectionPage(),
        '/textinput': (_) => const TextInputPage(),
      },
    );
  }
}

//////////////////////////////////////////////////////////////
// MENU PAGE
//////////////////////////////////////////////////////////////

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  Widget btn(BuildContext c, String t, String r) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(c, r),
        child: Text(t),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Material Widgets Lab")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            btn(context,"Actions","/actions"),
            btn(context,"Communication","/communication"),
            btn(context,"Containment","/containment"),
            btn(context,"Navigation Demo","/navigation"),
            btn(context,"Selection","/selection"),
            btn(context,"Text Inputs","/textinput"),
          ],
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////
// ACTIONS
//////////////////////////////////////////////////////////////

class ActionsPage extends StatelessWidget {
  const ActionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Actions Widgets")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text("Elevated Button"),
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////
// COMMUNICATION
//////////////////////////////////////////////////////////////

class CommunicationPage extends StatelessWidget {
  const CommunicationPage({super.key});

  void showSnack(BuildContext context){
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Hello Snackbar")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Communication Widgets")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => showSnack(context),
          child: const Text("Show Snackbar"),
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////
// CONTAINMENT
//////////////////////////////////////////////////////////////

class ContainmentPage extends StatelessWidget {
  const ContainmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Containment Widgets")),
      body: Center(
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.home),
                Text("Card Example"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////
// NAVIGATION DEMO
//////////////////////////////////////////////////////////////

class NavigationDemoPage extends StatelessWidget {
  const NavigationDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Navigator Demo")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // ✅ Using Navigator.push
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SubPage(),
                  ),
                );
              },
              child: const Text("Open SubPage (Navigator.push)"),
            ),

            // ✅ Named route example
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/actions');
              },
              child: const Text("Open Actions (Named Route)"),
            ),
          ],
        ),
      ),
    );
  }
}

class SubPage extends StatelessWidget {
  const SubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sub Page")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Back"),
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////
// SELECTION
//////////////////////////////////////////////////////////////

class SelectionPage extends StatefulWidget {
  const SelectionPage({super.key});

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  bool checked=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Selection Widgets")),
      body: Center(
        child: CheckboxListTile(
          title: const Text("Select option"),
          value: checked,
          onChanged: (v){
            setState(()=> checked=v!);
          },
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////
// TEXT INPUT
//////////////////////////////////////////////////////////////

class TextInputPage extends StatelessWidget {
  const TextInputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Text Input Widgets")),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Enter text",
          ),
        ),
      ),
    );
  }
}
