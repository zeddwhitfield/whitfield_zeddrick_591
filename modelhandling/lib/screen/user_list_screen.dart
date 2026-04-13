import 'package:flutter/material.dart';
import 'package:modelhandling/controller/user_controller.dart';
import 'package:modelhandling/model/user_model.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final controller = UserController();
List<User> users = [];
final nameController = TextEditingController();
final emailController = TextEditingController();

void loadUsers() async{
  final userdata = await controller.getUsers();
  setState(() {
    users = userdata;
  });
}

void addUser() async{
  if (nameController.text.isEmpty || emailController.text.isEmpty) 
  {
    return;
  }
  final userdata = User(
    name: nameController.text,
    email: emailController.text,
  );
  await controller.addUser(userdata);
  nameController.clear();
  emailController.clear();
  loadUsers();
}

void deleteUser(int id) async{
  await controller.deleteUser(id);
  loadUsers();
}

@override
  void initState() {
    super.initState();
    loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          TextField(controller:nameController, decoration: InputDecoration(labelText:'Name'),),
          TextField(controller:emailController, decoration: InputDecoration(labelText:'Email'),),
          ElevatedButton(onPressed: (){
            addUser();
          }, child: Text('Add User')),
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index){
                final listuser = users[index];
                return ListTile(
                  title: Text(listuser.name),
                  subtitle: Text(listuser.email),
                  trailing: IconButton(onPressed: (){
                    deleteUser(listuser.id!);
                  }, 
                  icon: Icon(Icons.delete)),
                );
              }
            ) 
          )
        ],
      ),
    );
  }
}