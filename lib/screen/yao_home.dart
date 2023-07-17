import 'package:flutter/material.dart';
import 'package:yao_dash/widget/app_bar.dart';
import 'package:yao_dash/widget/side_nav_yao.dart';
import 'package:yao_dash/widget/yao_top.dart';

class YaoHome extends StatelessWidget {
  const YaoHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarYao(),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SideNavYao(),
                  YaoTop(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
