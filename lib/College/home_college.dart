import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model.dart';

class CollegeHome extends StatefulWidget {
  const CollegeHome({super.key});

  @override
  State<CollegeHome> createState() => _CollegeHomeState();
}

class _CollegeHomeState extends State<CollegeHome> {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("USA"), value: "USA"),
    DropdownMenuItem(child: Text("Canada"), value: "Canada"),
    DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
    DropdownMenuItem(child: Text("England"), value: "England"),
  ];
  String selectedValue = '';
  TimeOfDay selectedTime = TimeOfDay.now();
  final nameController = TextEditingController();
  final newItemController = TextEditingController();
  List<Section> section = [];

  void addNewItem(String newItem) {
    if (newItem.isNotEmpty) {
      setState(() {
        menuItems.add(DropdownMenuItem(
          child: Text(newItem),
          value: newItem,
        ));
        newItemController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drop '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: DropdownButtonFormField(
                    onSaved: (section) => selectedValue,
                    validator: (value) => value == null ? "Select a country" : null,
                    items: menuItems,
                    onChanged: (String? value) {
                      setState(() {
                        selectedValue = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    controller: newItemController,
                    decoration: InputDecoration(
                      labelText: 'Add new item',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    addNewItem(newItemController.text);
                  },
                  child: Text('Add'),
                ),
              ],
            ),
            SizedBox(height: 35),
            Text('${selectedTime.hour} : ${selectedTime.minute}'),
            ElevatedButton(
              onPressed: () async {
                final TimeOfDay? timeofday = await showTimePicker(
                  context: context,
                  initialTime: selectedTime,
                  initialEntryMode: TimePickerEntryMode.dial,
                );
                if (timeofday != null) {
                  setState(() {
                    selectedTime = timeofday;
                  });
                }
              },
              child: Text('Select Time'),
            ),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  section.add(Section(
                    name: nameController.text,
                    selected: selectedValue,
                    hour: selectedTime.hour,
                    minute: selectedTime.minute,
                  ));
                });
              },
              child: Text('Submit'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: section.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(section[index].name.toString()),
                    subtitle: Text(section[index].selected.toString()),
                    trailing: Text(
                      '${section[index].hour.toString().padLeft(2, '0')}:${section[index].minute.toString().padLeft(2, '0')}',
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
