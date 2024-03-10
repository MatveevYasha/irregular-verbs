import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:irregular_verbs_app/data/entities/verb.dart';
import 'package:irregular_verbs_app/ui/pages/main_page/bloc/main_bloc.dart';
import 'package:irregular_verbs_app/ui/pages/main_page/bloc/main_event.dart';
import 'package:irregular_verbs_app/ui/pages/main_page/widgets/common/divider_widget.dart';
import 'package:irregular_verbs_app/ui/pages/main_page/widgets/common/text_widget.dart';

class Practise extends StatelessWidget {
  final Verb? verb;
  final List<Verb> listOfVerbs;
  final int count;

  const Practise({
    required this.verb,
    required this.listOfVerbs,
    required this.count,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<MainBloc>(context);

    return Stack(children: [
      (verb == null)
          ? const Center(
              child: Text(
                'Click on the button to start!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextWidget(
                  number: 1,
                  title: verb!.baseForm,
                  wordNumber: count,
                ),
                const DividerWidget(),
                TextWidget(
                  number: 2,
                  title: verb!.pastSimple,
                  wordNumber: count,
                ),
                const DividerWidget(),
                TextWidget(
                  number: 3,
                  title: verb!.pastParticiple,
                  wordNumber: count,
                ),
                const DividerWidget(),
                TextWidget(
                  number: 4,
                  title: verb!.translation,
                  wordNumber: count,
                ),
                const Spacer(flex: 1)
              ],
            ),
      Positioned(
        right: 20,
        bottom: 20,
        child: (verb == null)
            ? FloatingActionButton.extended(
                onPressed: () {
                  bloc.add(GetNextWordMainEvent(
                    listOfVerbs: listOfVerbs,
                    count: 0,
                  ));
                },
                label: const Text('Start'),
              )
            : FloatingActionButton(
                onPressed: () {
                  bloc.add(GetNextWordMainEvent(
                    listOfVerbs: listOfVerbs,
                    verb: verb,
                    count: count,
                  ));
                },
                child: const Icon(Icons.workspaces_outline),
              ),
      ),
    ]);
  }
}
