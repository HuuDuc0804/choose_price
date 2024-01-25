import 'package:choose_price/widgets/reponsive_builder.dart';
import 'package:flutter/material.dart';

import '../utils/theme.dart';

class ChooseTopicPage extends StatelessWidget {
  const ChooseTopicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ReponsiveBuilder(
        portrait: Column(
          children: [
            const Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: _Header(),
            ),
            Flexible(
              flex: 3,
              child: Container(
                color: Colors.lightBlue,
              ),
            )
          ],
        ),
        landscape: Row(
          children: [
            const Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Column(
                children: [Expanded(child: _Header()), Spacer()],
              ),
            ),
            Flexible(
              flex: 3,
              child: Container(
                color: Colors.lightBlue,
              ),
            )
          ],
        ),
      )),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          Expanded(
            child: FittedBox(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  text: 'What Brings you\n',
                  style: PrimaryFont.bold(28).copyWith(color: kColorDarkGrey),
                  children: [
                    TextSpan(
                      text: 'to Silent Moon?',
                      style: PrimaryFont.light(28),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: FittedBox(
              alignment: Alignment.topLeft,
              fit: BoxFit.scaleDown,
              child: Text(
                'choose a topic to focus on:',
                style: PrimaryFont.light(20).copyWith(
                  color: kColorDarkGrey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
