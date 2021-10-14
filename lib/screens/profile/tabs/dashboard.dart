import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    _buildCard({required String title, required String value}) {
      return Container(
        height: 80,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xffE8E8E8), width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: textTheme.subtitle1),
            const SizedBox(height: 10),
            Text(value, style: textTheme.headline1),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const CircleAvatar(
              radius: 40,
              child: Icon(Icons.person, size: 40),
            ),
            const SizedBox(height: 25),
            Text(
              "Sameer Pokkharel",
              style: textTheme.headline2,
            ),
            const SizedBox(height: 10),
            Text(
              "i.amsameer2061@gmail.com",
              style: textTheme.subtitle2,
            ),
            const SizedBox(height: 15),
            const Divider(),
            const SizedBox(height: 15),
            GridView.builder(
              itemCount: 6,
              shrinkWrap: true,
              primary: false,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                return _buildCard(title: "Total orders", value: "02");
              },
            )
          ],
        ),
      ),
    );
  }
}
