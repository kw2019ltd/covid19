import 'package:covid19/screens/boarding/boarding.indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class BoardingBottomNav extends StatelessWidget {
  const BoardingBottomNav({
    Key key,
    @required List<Widget> pages,
    @required ValueNotifier<int> pageIndex,
    @required PageController pageController,
    this.ontap,
  })  : _pages = pages,
        _pageIndex = pageIndex,
        _pageController = pageController,
        super(key: key);

  final List<Widget> _pages;
  final ValueNotifier<int> _pageIndex;
  final PageController _pageController;
  final void Function(int) ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FlatButton(
            onPressed: () => ontap(_pages.length),
            child: Text(
              'Skip',
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyText1.color,
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (var i = 0; i < _pages.length; i++)
                  _pageIndex.value == i
                      ? BoardingIndicator(
                          toggle: true,
                          onTap: () => ontap(i),
                        )
                      : BoardingIndicator(
                          onTap: () => ontap(i),
                        )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 23),
            child: IconButton(
              icon: Icon(
                Ionicons.ios_arrow_round_forward,
                size: 30,
              ),
              onPressed: () => _pageController.nextPage(
                duration: const Duration(milliseconds: 400),
                curve: Curves.linear,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
