
import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  final TextEditingController nameController =
  TextEditingController();

  final TextEditingController phoneController =
  TextEditingController();

  final List<Map<String, String>> contacts = [
    {'name': 'Jawad', 'phone': '01877-777777'},
    {'name': 'Ferdous', 'phone': '01673-777777'},
    {'name': 'Hasan', 'phone': '01745-777777'},
    {'name': 'Hasan', 'phone': '01745-777777'},
    {'name': 'Hasan', 'phone': '01745-777777'},
  ];

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void addContact() {
    String name = nameController.text.trim();
    String phone = phoneController.text.trim();

    if (name.isEmpty || phone.isEmpty) {
      return;
    }

    setState(() {
      contacts.add({
        'name': name,
        'phone': phone,
      });
    });

    nameController.clear();
    phoneController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),

        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Enter Name',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 8),

            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: 'Enter Phone Number',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 8),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: addContact,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Add'),
              ),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: ListView.builder(
                itemCount: contacts.length,

                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.grey.shade100,

                    child: ListTile(
                      onTap: () {
                        nameController.text =
                        contacts[index]['name']!;

                        phoneController.text =
                        contacts[index]['phone']!;
                      },

                      leading: const Icon(
                        Icons.person,
                        color: Colors.brown,
                        size: 30,
                      ),

                      title: Text(
                        contacts[index]['name']!,
                        style: const TextStyle(
                          color: Colors.deepOrange,
                        ),
                      ),

                      subtitle: Text(
                        contacts[index]['phone']!,
                      ),

                      trailing: const Icon(
                        Icons.call,
                        color: Colors.blue,
                      ),
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
