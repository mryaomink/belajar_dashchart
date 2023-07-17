import 'package:flutter/material.dart';

class SideNavYao extends StatelessWidget {
  const SideNavYao({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width * 0.2,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: ListView(
        shrinkWrap: true,
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1499952127939-9bbf5af6c51c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=876&q=80'),
              ),
              SizedBox(
                height: 4.0,
              ),
              Text(
                'Mrs.Yaomink',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 4.0,
              ),
              Text('programmer')
            ],
          ),
          const SizedBox(
            height: 30.0,
          ),
          ListTile(
            onTap: () {},
            selectedColor: Colors.amber,
            leading: const Icon(Icons.dashboard),
            title: const Text("Dashboard"),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const ListTile(
            leading: Icon(Icons.square_sharp),
            title: Text("Order"),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text("Product"),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
            ),
          )
        ],
      ),
    );
  }
}
