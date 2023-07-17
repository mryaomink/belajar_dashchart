import 'package:flutter/material.dart';

class AppBarYao extends StatelessWidget {
  const AppBarYao({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Diskominfo Banjarbaru Kota',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.lightBlue,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                ),
              ),
              const SizedBox(
                width: 4.0,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                ),
              ),
              const SizedBox(
                width: 4.0,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.nightlight,
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              ElevatedButton.icon(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                  label: const Text(
                    'Add Data',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
