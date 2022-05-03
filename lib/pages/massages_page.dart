import 'package:flutter/material.dart';
import 'package:uchat/theme.dart';

class MassagesPage extends StatelessWidget {
  const MassagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8),
      child: _Stories(),
    );
  }
}

class _Stories extends StatelessWidget {
  const _Stories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 0,
      child: SizedBox(
        height: 134,
        child: Column(
          children: [
            const Text(
              'Stories',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 15,
                color: AppColors.textFaded,
              ),
            ),
            Expanded(
              child: ListView.builder(
                // listview初始时纵向的，需要改成横向
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return const Text('test');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  const _StoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
