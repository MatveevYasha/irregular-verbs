import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:irregular_verbs_app/ui/pages/main_page/bloc/main_bloc.dart';
import 'package:irregular_verbs_app/ui/pages/main_page/bloc/main_state.dart';
import 'package:irregular_verbs_app/ui/pages/main_page/widgets/error/error_page.dart';
import 'package:irregular_verbs_app/ui/pages/main_page/widgets/list_of_verbs/list_of_verbs.dart';
import 'package:irregular_verbs_app/ui/pages/main_page/widgets/practice/practice.dart';
import 'package:irregular_verbs_app/ui/pages/scoup/scoup.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return switch (state) {
          LoadingMainState() => const Material(child: CircularProgressIndicator()),
          CounterMainState() => Scoup(child: [
              Practise(
                verb: state.verb,
                listOfVerbs: state.listOfVerbs,
                count: state.count,
              ),
              ListOfVerbs(listOfVerbs: state.listOfVerbs),
            ]),
          ErrorMainState() => const ErrorPage(),
        };
      },
    );
  }
}
