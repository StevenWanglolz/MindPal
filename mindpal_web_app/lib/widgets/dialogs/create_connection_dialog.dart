import 'package:flutter/material.dart';
import 'package:mindpad_web_app/constants/ui_colors.dart';
import 'package:mindpad_web_app/constants/ui_style.dart';
import 'package:mindpad_web_app/widgets/dialogs/send_connection_dialog.dart';

class CreateConnectionDialog extends StatefulWidget {
  final String name;
  const CreateConnectionDialog({super.key, required this.name});

  @override
  State<CreateConnectionDialog> createState() => _CreateConnectionDialogState();
}

class _CreateConnectionDialogState extends State<CreateConnectionDialog> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: UIColors.apricot1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Text(
        "與諮商師建立連結",
        style: TextStyle(
            color: UIColors.darkGreen,
            fontWeight: FontWeight.bold,
            fontSize: 20),
      ),
      content: SizedBox(
        width: 300,
        height: 120,
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 14),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "諮商師",
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(
                        width: 170,
                        height: 28,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: UIColors.white),
                          child: Text(
                            " ${widget.name} 諮商師",
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 14),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("諮商主題", style: TextStyle(fontSize: 14)),
                      SizedBox(
                        width: 170,
                        height: 28,
                        child: Container(
                          alignment: Alignment.centerRight,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: UIColors.white),
                          child: const Text("v  "),
                        ),
                      )
                    ],
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 14),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("困擾程度", style: TextStyle(fontSize: 14)),
                      const SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: List.generate(5, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedIndex = index;
                              });
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: InfluenceLevelContainer(
                                index: index,
                                isSelected: _selectedIndex == index,
                              ),
                            ),
                          );
                        }),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
      actions: [
        ElevatedButton(
            style: MyButtonStyles.confirmDialogButtonStyle,
            onPressed: () {
              Navigator.pop(context);
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const SendConnectionDialog();
                  });
            },
            child: const Text("送出")),
      ],
    );
  }
}

class InfluenceLevelContainer extends StatelessWidget {
  final int index;
  final bool isSelected;
  const InfluenceLevelContainer(
      {super.key, required this.index, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 27,
      width: 27,
      decoration: BoxDecoration(
          color: isSelected ? UIColors.lightGreen : UIColors.grey1,
          shape: BoxShape.circle),
      child: Center(child: Text("${index + 1}")),
    );
  }
}
