import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:irregular_verbs_app/data/entities/verb.dart';

import 'package:irregular_verbs_app/ui/pages/main_page/bloc/main_bloc.dart';
import 'package:irregular_verbs_app/ui/pages/main_page/bloc/main_event.dart';
import 'package:irregular_verbs_app/ui/pages/main_page/bloc/main_state.dart';
import 'package:irregular_verbs_app/ui/pages/main_page/widgets/divider_widget.dart';
import 'package:irregular_verbs_app/ui/pages/main_page/widgets/text_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<MainBloc>(context);

    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return switch (state) {
          LoadingMainState() => const CircularProgressIndicator(),
          CounterMainState() => Scoup(child: [
              Stack(children: [
                (state.verb == null)
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
                            title: state.verb!.baseForm,
                            wordNumber: state.count,
                          ),
                          const DividerWidget(),
                          TextWidget(
                            number: 2,
                            title: state.verb!.pastSimple,
                            wordNumber: state.count,
                          ),
                          const DividerWidget(),
                          TextWidget(
                            number: 3,
                            title: state.verb!.pastParticiple,
                            wordNumber: state.count,
                          ),
                          const DividerWidget(),
                          TextWidget(
                            number: 4,
                            title: state.verb!.translation,
                            wordNumber: state.count,
                          ),
                          const SizedBox(height: 100),
                        ],
                      ),
                Positioned(
                  right: 20,
                  bottom: 20,
                  child: (state.verb == null)
                      ? FloatingActionButton.extended(
                          onPressed: () {
                            bloc.add(GetNextWordMainEvent(
                              listOfVerbs: state.listOfVerbs,
                              count: 0,
                            ));
                          },
                          label: const Text('Start'),
                        )
                      : FloatingActionButton(
                          onPressed: () {
                            bloc.add(GetNextWordMainEvent(
                              listOfVerbs: state.listOfVerbs,
                              verb: state.verb,
                              count: state.count,
                            ));
                          },
                        ),
                ),
              ]),
              ListOfVerbsWidget(listOfVerbs: state.listOfVerbs),
            ]),
          ErrorMainState() => const Center(
              child: Text(
                'An error has occurred, try restarting the application',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
        };
      },
    );
  }
}

class ListOfVerbsWidget extends StatelessWidget {
  final List<Verb> listOfVerbs;

  const ListOfVerbsWidget({
    super.key,
    required this.listOfVerbs,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listOfVerbs.length,
      itemBuilder: (context, index) {
        final verb = listOfVerbs[index];
        // return Text(listOfVerbs[index].baseForm);
        return Column(
          children: [
            if (index == 0) const SizedBox(height: 6),
            if (index == 0 || listOfVerbs[index].baseForm[0] != listOfVerbs[index - 1].baseForm[0])
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

class Scoup extends StatefulWidget {
  final List<Widget> child;

  const Scoup({super.key, required this.child});

  @override
  State<Scoup> createState() => _ScoupState();
}

class _ScoupState extends State<Scoup> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Irregular Verbs'),
        centerTitle: true,
      ),
      body: widget.child[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.track_changes_outlined),
            label: 'Train',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_sharp),
            label: 'Verb List',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: _onItemTapped,
      ),
    );
  }
}
