import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'Item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'To Do List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static List<Item> toDoList = [];
  static List<bool> checkBoxes = List.filled(100, false);
  TextEditingController nameController = TextEditingController();
  TextEditingController nameController2 = TextEditingController();
  TextEditingController nameController3 = TextEditingController();
  TextEditingController nameController4 = TextEditingController();
  TextEditingController nameController5 = TextEditingController();

  static List<DropdownMenuItem<String>> months = [
    const DropdownMenuItem(value: "No Month", child: Text("No Month")),
    const DropdownMenuItem(value: "January", child: Text("January")),
    const DropdownMenuItem(value: "February", child: Text("February")),
    const DropdownMenuItem(value: "March", child: Text("March")),
    const DropdownMenuItem(value: "April", child: Text("April")),
    const DropdownMenuItem(value: "May", child: Text("May")),
    const DropdownMenuItem(value: "June", child: Text("June")),
    const DropdownMenuItem(value: "July", child: Text("July")),
    const DropdownMenuItem(value: "August", child: Text("August")),
    const DropdownMenuItem(value: "September", child: Text("September")),
    const DropdownMenuItem(value: "October", child: Text("October")),
    const DropdownMenuItem(value: "November", child: Text("November")),
    const DropdownMenuItem(value: "December", child: Text("December")),
  ];
  String? selectedMonth = months[0].value;

  static List<DropdownMenuItem<String>> days = [
    const DropdownMenuItem(value: "No Day", child: Text("No Day")),
    const DropdownMenuItem(value: "1", child: Text("01")),
    const DropdownMenuItem(value: "2", child: Text("02")),
    const DropdownMenuItem(value: "3", child: Text("03")),
    const DropdownMenuItem(value: "4", child: Text("04")),
    const DropdownMenuItem(value: "5", child: Text("05")),
    const DropdownMenuItem(value: "6", child: Text("06")),
    const DropdownMenuItem(value: "7", child: Text("07")),
    const DropdownMenuItem(value: "8", child: Text("08")),
    const DropdownMenuItem(value: "9", child: Text("09")),
    const DropdownMenuItem(value: "10", child: Text("10")),
    const DropdownMenuItem(value: "11", child: Text("11")),
    const DropdownMenuItem(value: "12", child: Text("12")),
    const DropdownMenuItem(value: "13", child: Text("13")),
    const DropdownMenuItem(value: "14", child: Text("14")),
    const DropdownMenuItem(value: "15", child: Text("15")),
    const DropdownMenuItem(value: "16", child: Text("16")),
    const DropdownMenuItem(value: "17", child: Text("17")),
    const DropdownMenuItem(value: "18", child: Text("18")),
    const DropdownMenuItem(value: "19", child: Text("19")),
    const DropdownMenuItem(value: "20", child: Text("20")),
    const DropdownMenuItem(value: "21", child: Text("21")),
    const DropdownMenuItem(value: "22", child: Text("22")),
    const DropdownMenuItem(value: "23", child: Text("23")),
    const DropdownMenuItem(value: "24", child: Text("24")),
    const DropdownMenuItem(value: "25", child: Text("25")),
    const DropdownMenuItem(value: "26", child: Text("26")),
    const DropdownMenuItem(value: "27", child: Text("27")),
    const DropdownMenuItem(value: "28", child: Text("28")),
    const DropdownMenuItem(value: "29", child: Text("29")),
    const DropdownMenuItem(value: "30", child: Text("30")),
    const DropdownMenuItem(value: "31", child: Text("31")),
  ];
  String? selectedDay = days[0].value;

  void addItemToList() {
    setState(
      () {
        if (selectedMonth == "No Month" ||
            selectedDay == "No Day" ||
            nameController.text.trim() == "") {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              elevation: 0,
              content: Container(
                padding: const EdgeInsets.all(16),
                height: 90,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Item-Name, Month, and Day Requirement!",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          );

          return;
        }

        toDoList.insert(
            0,
            Item(nameController.text, nameController2.text, selectedMonth,
                selectedDay));
        nameController.clear();
        nameController2.clear();
        selectedMonth = months[0].value;
        selectedDay = days[0].value;
      },
    );
  }

  void editToDoList(int index) {
    setState(
      () {
        toDoList[index] = Item(nameController3.text, nameController4.text,
            selectedMonth, selectedDay);
        Navigator.of(context).pop();
      },
    );
  }

  void removeItem(int index) {
    setState(
      () {
        toDoList.removeAt(index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "To-Do List Items: ",
                  textScaleFactor: 1.3,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Add To-Do List Item',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Item-Description: ",
                  textScaleFactor: 1.3,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
              child: TextField(
                minLines: 1,
                maxLines: 10,
                controller: nameController2,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Item Description',
                ),
              ),
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Text("Month: "),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(70, 20, 20, 0),
                  child: Text("Day: "),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: DropdownButton<String>(
                    value: selectedMonth,
                    items: months,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedMonth = newValue!;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: DropdownButton<String>(
                    value: selectedDay,
                    items: days,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedDay = newValue!;
                      });
                    },
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 80, 20),
                  child: TextButton(
                    child: const Text('Add'),
                    onPressed: () {
                      addItemToList();
                    },
                  ),
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: toDoList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 12.0, 12.0, 12.0),
                    child: ExpandablePanel(
                      header: Row(
                        children: [
                          Checkbox(
                            value: checkBoxes[index],
                            onChanged: (bool? value) {
                              setState(
                                () {
                                  checkBoxes[index] = !checkBoxes[index];
                                },
                              );
                            },
                          ),
                          Text(
                            "  ${toDoList[index].itemName}",
                            textScaleFactor: 1.25,
                          ),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(Icons.settings),
                            tooltip: "Edit",
                            splashRadius: 20,
                            onPressed: () {
                              nameController3.text = toDoList[index].itemName;
                              nameController4.text =
                                  toDoList[index].itemDescription;
                              selectedMonth = toDoList[index].month;
                              selectedDay = toDoList[index].day;

                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text(
                                      "Editing ${toDoList[index].itemName}"),
                                  content: SizedBox(
                                    width: width,
                                    height: height,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 10),
                                          child: TextField(
                                            controller: nameController3,
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText: 'Item Name',
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 10, 0, 10),
                                          child: TextField(
                                            minLines: 1,
                                            maxLines: 8,
                                            controller: nameController4,
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText: 'Item Description',
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: const [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 20, 20, 0),
                                              child: Text("Month: "),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  50, 20, 20, 0),
                                              child: Text("Day: "),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 0, 20, 20),
                                              child: DropdownButton<String>(
                                                value: selectedMonth,
                                                items: months,
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    selectedMonth = newValue!;
                                                  });
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 0, 20, 20),
                                              child: DropdownButton<String>(
                                                value: selectedDay,
                                                items: days,
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    selectedDay = newValue!;
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: TextButton(
                                            child: const Text('Confirm Edits'),
                                            onPressed: () {
                                              editToDoList(index);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.highlight_remove),
                            tooltip: "Remove",
                            splashRadius: 20,
                            onPressed: () {
                              removeItem(index);
                            },
                          )
                        ],
                      ),
                      collapsed: const SizedBox.shrink(),
                      expanded: Column(
                        children: [
                          Center(
                            child: Text(
                              " -- ${toDoList[index].month}, ${toDoList[index].day} -- \n ",
                              textScaleFactor: 1,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Wrap(
                            children: [
                              Text(
                                toDoList[index].itemDescription,
                                textAlign: TextAlign.start,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
