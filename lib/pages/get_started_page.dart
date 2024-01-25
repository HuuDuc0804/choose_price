import 'package:choose_price/pages/choose_topic_page.dart';
import 'package:choose_price/utils/images.dart';
import 'package:choose_price/utils/theme.dart';
import 'package:choose_price/widgets/reponsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kColorPrimary,
      body: SafeArea(
        child: ReponsiveBuilder(
          portrait: Stack(
            children: [
              const GetStartedBackground(),
              const FractionallySizedBox(
                heightFactor: 0.35,
                child: GetStartedHeader(),
              ),
              Align(
                alignment: const Alignment(0.0, 0.8),
                child: GetStartedButton(
                  fixedSize: MaterialStateProperty.all(
                    Size(
                      size.width * 0.9,
                      size.height * 0.065,
                    ),
                  ),
                  textStyle: MaterialStateProperty.all(
                    PrimaryFont.medium(size.height * 0.015).copyWith(
                      color: kColorDarkGrey,
                    ),
                  ),
                ),
              ),
            ],
          ),
          landscape: Row(
            children: [
              const Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: FractionallySizedBox(
                    heightFactor: 0.8,
                    child: GetStartedHeader(),
                  ),
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    const GetStartedBackground(),
                    Align(
                      alignment: const Alignment(0.0, 0.8),
                      child: GetStartedButton(
                        fixedSize: MaterialStateProperty.all(
                          Size(
                            size.width * 0.4,
                            size.height * 0.065,
                          ),
                        ),
                        textStyle: MaterialStateProperty.all(
                          PrimaryFont.medium(size.height * 0.015).copyWith(
                            color: kColorDarkGrey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({
    super.key,
    this.fixedSize,
    this.textStyle,
  });

  final MaterialStateProperty<Size>? fixedSize;
  final MaterialStateProperty<TextStyle>? textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed('$ChooseTopicPage');
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kColorLightGrey),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(38),
          ),
        ),
        elevation: MaterialStateProperty.all(0),
        fixedSize: fixedSize,
        foregroundColor: MaterialStateProperty.all(kColorDarkGrey),
        textStyle: textStyle,
      ),
      child: const Text('GET STARTED'),
    );
  }
}

class GetStartedBackground extends StatelessWidget {
  const GetStartedBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Align(
      alignment: Alignment.bottomCenter,
      child: FractionallySizedBox(
        heightFactor: orientation == Orientation.portrait ? 0.6 : 0.9,
        widthFactor: 1,
        child: FittedBox(
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
          child: SvgPicture.asset(background),
        ),
      ),
    );
  }
}

class GetStartedHeader extends StatelessWidget {
  const GetStartedHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          flex: 2,
          fit: FlexFit.tight,
          child: SvgPicture.asset(
            icLogo,
            alignment: const Alignment(0.0, -0.8),
          ),
        ),
        Flexible(
          flex: 1,
          child: FittedBox(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Hi Afsar, Welcome\n',
                style: PrimaryFont.medium(30).copyWith(
                  color: kColorLightYellow,
                  height: 1.3,
                ),
                children: [
                  TextSpan(
                    text: 'to Silent Moon',
                    style: PrimaryFont.thin(30)
                        .copyWith(color: kColorLightYellow, height: 1.3),
                  )
                ],
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: SizedBox.expand(
            child: FractionallySizedBox(
              widthFactor: 0.8,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: FittedBox(
                  child: Text(
                    'Explore the app, Find some peace of mind to\nprepare for meditation.',
                    style: PrimaryFont.light(16).copyWith(
                      color: kColorLightGrey,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
