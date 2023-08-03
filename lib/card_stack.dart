import 'package:flutter/material.dart';

class CardStack extends StatefulWidget {
  const CardStack({super.key});

  @override
  State<CardStack> createState() => _CardStackState();
}

class _CardStackState extends State<CardStack> {
  var listTotal = List.generate(1, (index) => index);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          alignment: Alignment.center,
          children: listTotal.length == 1
              ? [containerType(0, size)]
              : listTotal
                  .map(
                    (e) => containerType(listTotal.indexOf(e), size),
                  )
                  .toList(),
        ),
      ),
    );
  }

  Size getSizeCenterOfScreen(Size screenSize) {
    return Size((screenSize.width / 2) - (containerWidth / 2),
        (screenSize.height / 2) - (containerHeight / 2));
  }

  final containerHeight = 234.0;
  final containerWidth = 284.0;

  Widget containerType(int index, Size size) => Positioned(
        right: getSizeCenterOfScreen(size).width +
            (index == 0 ? 0 : (10 * index).toDouble()),
        bottom: getSizeCenterOfScreen(size).height +
            (index == 0 ? 0 : (10 * index).toDouble()),
        child: Container(
          width: containerWidth,
          height: containerHeight,
          decoration: BoxDecoration(
            color: Colors.blueGrey.withOpacity(.8),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Center(
            child: SizedBox(
              width: kToolbarHeight * 2,
              height: kToolbarHeight * 2,
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                onPressed: () {
                  setState(
                    () {
                      listTotal.add(listTotal.length);
                    },
                  );
                },
                child: const Icon(
                  Icons.add,
                  color: Colors.blueAccent,
                ),
              ),
            ),
          ),
        ),
      );
}
