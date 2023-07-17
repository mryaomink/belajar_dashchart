import 'package:flutter/material.dart';
import 'package:yao_dash/widget/yao_chart.dart';

class YaoTop extends StatefulWidget {
  const YaoTop({super.key});

  @override
  State<YaoTop> createState() => _YaoTopState();
}

class _YaoTopState extends State<YaoTop> {
  String dropValue = 'Last 28 Days';
  List<String> judul = [
    'Total Sales',
    'Total Order',
    'New Customer',
    'History'
  ];
  List<String> harga = [
    'Rp 1.5.000.000.000',
    'Rp 2.5.000.000.000',
    'Rp 8.5.000.000.000',
    'Rp 3.5.000.000.000'
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  const Text(
                    'Summary For The Past 28 Days',
                    style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  DropdownButton(
                      items: <String>['past week', 'past days']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: dropValue,
                            child: Text(
                              dropValue,
                              style: const TextStyle(color: Colors.black),
                            ));
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropValue = newValue!;
                        });
                      })
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 250.0,
                    child: Card(
                      color: Colors.white,
                      elevation: 5,
                      child: ListTile(
                        title: Text(
                          judul[index],
                          style: const TextStyle(
                              fontSize: 16.0, color: Colors.grey),
                        ),
                        subtitle: Row(
                          children: [
                            Text(
                              harga[index],
                              style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.upgrade,
                                size: 20.0,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            BarChartSample1(),
          ],
        ),
      ),
    );
  }
}
