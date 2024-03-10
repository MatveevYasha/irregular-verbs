import 'package:flutter/material.dart';
import 'package:irregular_verbs_app/data/entities/verb.dart';
import 'package:irregular_verbs_app/ui/pages/main_page/widgets/common/divider_widget.dart';

class ListOfVerbs extends StatefulWidget {
  final List<Verb> listOfVerbs;

  const ListOfVerbs({
    super.key,
    required this.listOfVerbs,
  });

  @override
  State<ListOfVerbs> createState() => _ListOfVerbsState();
}

class _ListOfVerbsState extends State<ListOfVerbs> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.listOfVerbs.length,
      itemBuilder: (context, index) {
        final verb = widget.listOfVerbs[index];

        return Column(
          children: [
            if (index == 0) const SizedBox(height: 6),
            if (index == 0 || widget.listOfVerbs[index].baseForm[0] != widget.listOfVerbs[index - 1].baseForm[0])
              Column(
                children: [
                  Text(
                    verb.baseForm[0].toUpperCase(),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const DividerWidget()
                ],
              ),
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(child: _Text(title: verb.baseForm)),
                  const VerticalDivider(color: Colors.black, thickness: 1),
                  Expanded(child: _Text(title: verb.pastSimple)),
                  const VerticalDivider(color: Colors.black, thickness: 1),
                  Expanded(child: _Text(title: verb.pastParticiple)),
                  const VerticalDivider(color: Colors.black, thickness: 1),
                  Expanded(child: _Text(title: verb.translation)),
                ],
              ),
            ),
            const DividerWidget()
          ],
        );
      },
    );
  }
}

class _Text extends StatelessWidget {
  final String title;

  const _Text({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 15),
    );
  }
}
