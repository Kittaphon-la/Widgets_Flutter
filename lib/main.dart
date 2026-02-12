import 'package:flutter/material.dart';

void main() {
  runApp(const LabApp());
}

class LabApp extends StatelessWidget {
  const LabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material Lab",
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
       cardTheme: const CardThemeData(
  elevation: 4,
  margin: EdgeInsets.symmetric(vertical: 8),
),
      ),

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
// COMMON HEADER
//////////////////////////////////////////////////////////////

Widget pageWrapper(String title, Widget child) {
  return Scaffold(
    appBar: AppBar(title: Text(title)),
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: child,
    ),
  );
}

//////////////////////////////////////////////////////////////
// MENU PAGE
//////////////////////////////////////////////////////////////

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  Widget menuBtn(BuildContext c, String t, String r, IconData icon) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(t),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () => Navigator.pushNamed(c, r),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return pageWrapper(
      "Material Widgets Lab",
      ListView(
        children: [
          menuBtn(context,"Actions","/actions",Icons.touch_app),
          menuBtn(context,"Communication","/communication",Icons.message),
          menuBtn(context,"Containment","/containment",Icons.widgets),
          menuBtn(context,"Navigation","/navigation",Icons.navigation),
          menuBtn(context,"Selection","/selection",Icons.check_box),
          menuBtn(context,"Text Inputs","/textinput",Icons.text_fields),
        ],
      ),
    );
  }
}

//////////////////////////////////////////////////////////////
// ACTIONS
//////////////////////////////////////////////////////////////

class ActionsPage extends StatelessWidget {
  const ActionsPage({super.key});

  void snack(BuildContext c,String m){
    ScaffoldMessenger.of(c)
        .showSnackBar(SnackBar(content: Text(m)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Actions Widgets")),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>snack(context,"FAB clicked"),
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Wrap(
          spacing: 10,
          children: [
            ElevatedButton(
              onPressed: ()=>snack(context,"Elevated"),
              child: const Text("Elevated"),
            ),
            TextButton(
              onPressed: ()=>snack(context,"TextButton"),
              child: const Text("Text"),
            ),
            IconButton(
              icon: const Icon(Icons.thumb_up),
              onPressed: ()=>snack(context,"IconButton"),
            ),
          ],
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

  void dialog(BuildContext c){
    showDialog(
      context: c,
      builder: (_) => AlertDialog(
        title: const Text("Dialog"),
        content: const Text("This is communication widget"),
        actions: [
          TextButton(
            onPressed: ()=>Navigator.pop(c),
            child: const Text("Close"),
          )
        ],
      ),
    );
  }

  void snack(BuildContext c){
    ScaffoldMessenger.of(c)
        .showSnackBar(const SnackBar(content: Text("Hello SnackBar")));
  }

  @override
  Widget build(BuildContext context) {
    return pageWrapper(
      "Communication Widgets",
      Column(
        children: [
          ElevatedButton(
              onPressed: ()=>dialog(context),
              child: const Text("Show Dialog")),
          ElevatedButton(
              onPressed: ()=>snack(context),
              child: const Text("Show SnackBar")),
        ],
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
    return pageWrapper(
      "Containment Widgets",
      ListView(
        children: [

          Card(
            child: ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Card Example"),
              subtitle: const Text("Contain content"),
            ),
          ),

          ExpansionTile(
            title: const Text("ExpansionTile"),
            children: const [
              Padding(
                padding: EdgeInsets.all(12),
                child: Text("Expandable content"),
              )
            ],
          )
        ],
      ),
    );
  }
}

//////////////////////////////////////////////////////////////
// NAVIGATION
//////////////////////////////////////////////////////////////

class NavigationDemoPage extends StatelessWidget {
  const NavigationDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return pageWrapper(
      "Navigation Demo",
      Column(
        children: [
          ElevatedButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SubPage()),
              );
            },
            child: const Text("Push Page"),
          ),
          ElevatedButton(
            onPressed: (){
              Navigator.pushNamed(context, '/actions');
            },
            child: const Text("Named Route"),
          )
        ],
      ),
    );
  }
}

class SubPage extends StatelessWidget {
  const SubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return pageWrapper(
      "Sub Page",
      Center(
        child: ElevatedButton(
          onPressed: ()=>Navigator.pop(context),
          child: const Text("Go Back"),
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
  bool check=false;
  bool sw=false;
  int radio=0;

  @override
  Widget build(BuildContext context) {
    return pageWrapper(
      "Selection Widgets",
      Column(
        children: [

          CheckboxListTile(
            value: check,
            title: const Text("Checkbox"),
            onChanged: (v)=>setState(()=>check=v!),
          ),

          SwitchListTile(
            value: sw,
            title: const Text("Switch"),
            onChanged: (v)=>setState(()=>sw=v),
          ),

          RadioListTile(
            value: 1,
            groupValue: radio,
            title: const Text("Radio"),
            onChanged: (v)=>setState(()=>radio=v!),
          ),
        ],
      ),
    );
  }
}

//////////////////////////////////////////////////////////////
// TEXT INPUT
//////////////////////////////////////////////////////////////

class TextInputPage extends StatefulWidget {
  const TextInputPage({super.key});

  @override
  State<TextInputPage> createState() => _TextInputPageState();
}

class _TextInputPageState extends State<TextInputPage> {
  final controller = TextEditingController();
  String output="";

  @override
  Widget build(BuildContext context) {
    return pageWrapper(
      "Text Input Widgets",
      Column(
        children: [

          TextField(
            controller: controller,
            decoration: const InputDecoration(
              labelText: "Enter text",
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.edit),
            ),
          ),

          const SizedBox(height: 12),

          ElevatedButton(
            onPressed: (){
              setState(()=>output=controller.text);
            },
            child: const Text("Submit"),
          ),

          const SizedBox(height: 20),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text("Output: $output"),
            ),
          )
        ],
      ),
    );
  }
}
