import 'package:flutter/material.dart';

class Register2 extends StatefulWidget {
  const Register2({super.key});

  @override
  Register2State createState() => Register2State();
}

class Register2State extends State<Register2> {
  final TextEditingController _specialtyController = TextEditingController();
  Set<String> _selectedSpecialties = {};

  final List<String> _specialties = [
    '人際關係',
    '心理健康',
    '職業發展',
    '婚姻家庭',
    '青少年',
    '成癮問題',
    '壓力管理',
    '自尊心',
    '創傷治療',
    '失眠問題',
    '飲食障礙',
    '其他',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 40,
                ),
                const SizedBox(width: 5),
                const Text(
                  'MindPal',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.pushNamed(context, '/login');
                //   },
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Colors.green,
                //     padding: const EdgeInsets.symmetric(horizontal: 20),
                //   ),
                //   child: const Text('Log in'),
                // ),
                SizedBox(width: 10),
              ],
            ),
          ],
        ),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey[200], // Blank left side
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      '成為MindPal的諮商師...',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Text('What\'s your gender?'),
                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text('Female'),
                            value: 'Female',
                            groupValue: null,
                            onChanged: (value) {},
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text('Male'),
                            value: 'Male',
                            groupValue: null,
                            onChanged: (value) {},
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text('Non-binary'),
                            value: 'Non-binary',
                            groupValue: null,
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    const Text('您的諮商證照發行日期'),
                    Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            decoration:
                                const InputDecoration(labelText: 'Month'),
                            items: List.generate(12, (index) {
                              return DropdownMenuItem(
                                value: (index + 1).toString(),
                                child: Text((index + 1).toString()),
                              );
                            }),
                            onChanged: (value) {},
                          ),
                        ),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            decoration:
                                const InputDecoration(labelText: 'Date'),
                            items: List.generate(31, (index) {
                              return DropdownMenuItem(
                                value: (index + 1).toString(),
                                child: Text((index + 1).toString()),
                              );
                            }),
                            onChanged: (value) {},
                          ),
                        ),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            decoration:
                                const InputDecoration(labelText: 'Year'),
                            items: List.generate(50, (index) {
                              return DropdownMenuItem(
                                value: (2024 - index).toString(),
                                child: Text((2024 - index).toString()),
                              );
                            }),
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      children: [
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: '上傳諮商證照 格式限制: .pdf',
                              border: OutlineInputBorder(),
                            ),
                            readOnly: true,
                          ),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          child: const Text('選擇檔案'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _specialtyController,
                            decoration: const InputDecoration(
                              labelText: '諮商專長',
                              border: OutlineInputBorder(),
                            ),
                            readOnly: true,
                          ),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () async {
                            final result = await showDialog<Set<String>>(
                              context: context,
                              builder: (context) {
                                return SpecialtySelectionDialog(
                                  initialSpecialties: _selectedSpecialties,
                                  specialties: _specialties,
                                );
                              },
                            );

                            if (result != null) {
                              setState(() {
                                _selectedSpecialties = result;
                                _specialtyController.text =
                                    _selectedSpecialties.join(', ');
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          child: const Text('選擇專長'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      children: [
                        Checkbox(value: false, onChanged: (value) {}),
                        const Text('Agree to our '),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Terms of use'),
                        ),
                        const Text(' and '),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Privacy Policy'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: Colors.green,
                      ),
                      child: const Text('Sign up'),
                    ),
                    const SizedBox(height: 16.0),
                    const Center(
                      child: Text('Already have an account?'),
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/counselorLogin');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ),
                        child: const Text(
                          'Log In',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SpecialtySelectionDialog extends StatefulWidget {
  final List<String> specialties;
  final Set<String> initialSpecialties;

  const SpecialtySelectionDialog({
    required this.specialties,
    required this.initialSpecialties,
    super.key,
  });

  @override
  State<SpecialtySelectionDialog> createState() =>
      _SpecialtySelectionDialogState();
}

class _SpecialtySelectionDialogState extends State<SpecialtySelectionDialog> {
  late Set<String> _selectedSpecialties;

  @override
  void initState() {
    super.initState();
    _selectedSpecialties = Set.from(widget.initialSpecialties);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  '返回',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ),
            const Text(
              '諮商師專長',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: widget.specialties.map((specialty) {
                final isSelected = _selectedSpecialties.contains(specialty);
                return ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (isSelected) {
                        _selectedSpecialties.remove(specialty);
                      } else {
                        _selectedSpecialties.add(specialty);
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(90, 40),
                    backgroundColor:
                        isSelected ? Colors.green : Colors.grey[300],
                  ),
                  child: Text(
                    specialty,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, _selectedSpecialties);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.green,
              ),
              child: const Text('確認'),
            ),
          ],
        ),
      ),
    );
  }
}
