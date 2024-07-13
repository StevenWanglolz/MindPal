import "package:flutter/material.dart";
import "package:mindpad_web_app/constants/ui_colors.dart";

class HappyMoodContainer extends StatelessWidget {
  final int index;
  final bool isSelected;
  const HappyMoodContainer(
      {super.key, required this.index, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
          color: isSelected ? UIColors.lightGreen : UIColors.grey1,
          shape: BoxShape.circle),
      child: const Center(
          child: Column(
        children: [
          RotatedBox(
              quarterTurns: 1,
              child: Padding(
                padding: EdgeInsets.only(left: 14, top: 10),
                child: Text(":",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
              )),
          RotatedBox(
              quarterTurns: 1,
              child: Padding(
                padding: EdgeInsets.only(top: 14),
                child: Text("D",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
              )),
        ],
      )),
    );
  }
}

class SmileMoodContainer extends StatelessWidget {
  final int index;
  final bool isSelected;
  const SmileMoodContainer(
      {super.key, required this.index, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
          color: isSelected ? UIColors.lightGreen : UIColors.grey1,
          shape: BoxShape.circle),
      child: const Center(
          child: Column(
        children: [
          RotatedBox(
              quarterTurns: 1,
              child: Padding(
                padding: EdgeInsets.only(left: 14, top: 10),
                child: Text(":",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
              )),
          RotatedBox(
              quarterTurns: 1,
              child: Padding(
                padding: EdgeInsets.only(top: 14),
                child: Text(")",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
              )),
        ],
      )),
    );
  }
}

class NormalMoodContainer extends StatelessWidget {
  final int index;
  final bool isSelected;
  const NormalMoodContainer(
      {super.key, required this.index, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
          color: isSelected ? UIColors.lightGreen : UIColors.grey1,
          shape: BoxShape.circle),
      child: const Center(
          child: Column(
        children: [
          RotatedBox(
              quarterTurns: 1,
              child: Padding(
                padding: EdgeInsets.only(left: 14, top: 10),
                child: Text(":",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
              )),
          RotatedBox(
              quarterTurns: 1,
              child: Padding(
                padding: EdgeInsets.only(top: 14),
                child: Text("|",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
              )),
        ],
      )),
    );
  }
}

class BadMoodContainer extends StatelessWidget {
  final int index;
  final bool isSelected;
  const BadMoodContainer(
      {super.key, required this.index, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
          color: isSelected ? UIColors.lightGreen : UIColors.grey1,
          shape: BoxShape.circle),
      child: const Center(
          child: Column(
        children: [
          RotatedBox(
              quarterTurns: 1,
              child: Padding(
                padding: EdgeInsets.only(left: 14, top: 10),
                child: Text(":",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
              )),
          RotatedBox(
              quarterTurns: 1,
              child: Padding(
                padding: EdgeInsets.only(top: 14),
                child: Text("(",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
              )),
        ],
      )),
    );
  }
}

class ProfileHeadContainer extends StatelessWidget {
  const ProfileHeadContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(color: UIColors.white, shape: BoxShape.circle),
      child: const Center(
          child: Column(
        children: [
          RotatedBox(
              quarterTurns: 1,
              child: Padding(
                padding: EdgeInsets.only(left: 14, top: 10),
                child: Text(":",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
              )),
          RotatedBox(
              quarterTurns: 1,
              child: Padding(
                padding: EdgeInsets.only(top: 14),
                child: Text("D",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
              )),
        ],
      )),
    );
  }
}
