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
  final ValueNotifier<bool> _hasShowScrollButton = ValueNotifier<bool>(false);
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_listener);
  }

  void _listener() {
    if (_controller.offset > 2200) {
      _hasShowScrollButton.value = true;
    } else {
      _hasShowScrollButton.value = false;
    }
  }

  void _scrollUp() {
    _controller.animateTo(
      _controller.position.minScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          controller: _controller,
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
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: _Text(title: verb.translation),
                      )),
                    ],
                  ),
                ),
                const DividerWidget()
              ],
            );
          },
        ),
        ValueListenableBuilder<bool>(
          valueListenable: _hasShowScrollButton,
          builder: (context, value, child) {
            return (value)
                ? Positioned(
                    right: 20,
                    bottom: 20,
                    child: FloatingActionButton(
                      onPressed: _scrollUp,
                      child: const Icon(
                        Icons.arrow_circle_up_rounded,
                        size: 32,
                      ),
                    ),
                  )
                : const SizedBox.shrink();
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
