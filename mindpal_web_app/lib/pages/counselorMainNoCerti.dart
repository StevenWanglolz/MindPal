import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MindPal',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const CounselorMainNoCerti(),
    );
  }
}

class CounselorMainNoCerti extends StatefulWidget {
  const CounselorMainNoCerti({super.key});

  @override
  _CounselorMainNoCertiState createState() => _CounselorMainNoCertiState();
}

class _CounselorMainNoCertiState extends State<CounselorMainNoCerti>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String name = 'John Doe';
  String email = 'john.doe@example.com';
  String phone = '123-456-7890';
  String specialty = '心理治療';
  String bio = '這裡是一段自我介紹...';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  void updateProfile(String updatedName, String updatedEmail,
      String updatedPhone, String updatedSpecialty, String updatedBio) {
    setState(() {
      name = updatedName;
      email = updatedEmail;
      phone = updatedPhone;
      specialty = updatedSpecialty;
      bio = updatedBio;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 20,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                SizedBox(width: 10),
                Text(
                  'MindPal',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              'Good Morning, 邦美麗',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: '案主儀表板'),
            Tab(text: '案主管理'),
            Tab(text: '個人資訊維護'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          const Center(child: Text('案主儀表板 Content')),
          const Center(child: Text('案主管理 Content')),
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '您尚未通過MindPal諮商師驗證，待驗證通過後您便能開始MindPal功能權限！',
                  style: TextStyle(color: Colors.red),
                ),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 30,
                      child: Icon(Icons.person, size: 50, color: Colors.white),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '諮商師編號 A000001',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.grey[300],
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('查看諮商師證照'),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.grey[300],
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('更改大頭貼'),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const Center(
                              child: ChangePasswordModal(),
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.grey[300],
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('更改密碼'),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfilePage(
                              name: name,
                              email: email,
                              phone: phone,
                              specialty: specialty,
                              bio: bio,
                              onSave: updateProfile,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.grey[300],
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('更改個人資料'),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text('諮商師姓名: $name'),
                const SizedBox(height: 16),
                Text('Email: $email'),
                const SizedBox(height: 16),
                Text('電話: $phone'),
                const SizedBox(height: 16),
                Text('諮商專長: $specialty'),
                const SizedBox(height: 16),
                Text('自我介紹: $bio'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChangePasswordModal extends StatefulWidget {
  const ChangePasswordModal({super.key});

  @override
  _ChangePasswordModalState createState() => _ChangePasswordModalState();
}

class _ChangePasswordModalState extends State<ChangePasswordModal> {
  bool isTimerRunning = false;
  int countdown = 60;
  Timer? timer;

  void _startTimer() {
    setState(() {
      isTimerRunning = true;
      countdown = 60;
    });

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (countdown > 0) {
          countdown--;
        } else {
          timer.cancel();
          isTimerRunning = false;
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.6,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
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
              const SizedBox(height: 16),
              const Text(
                '更改密碼',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  labelText: '輸入驗證碼',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: isTimerRunning
                    ? null
                    : () {
                        _startTimer();
                      },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: isTimerRunning ? Colors.grey : Colors.green,
                ),
                child: isTimerRunning
                    ? Text("$countdown 後可重新送出")
                    : const Text('發送驗證碼'),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.green,
                ),
                child: const Text('確認'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  final String name;
  final String email;
  final String phone;
  final String specialty;
  final String bio;
  final Function(String, String, String, String, String) onSave;

  const EditProfilePage({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.specialty,
    required this.bio,
    required this.onSave,
  });

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _specialtyController;
  late TextEditingController _bioController;

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

  Set<String> _selectedSpecialties = {};

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _emailController = TextEditingController(text: widget.email);
    _phoneController = TextEditingController(text: widget.phone);
    _specialtyController = TextEditingController(text: widget.specialty);
    _bioController = TextEditingController(text: widget.bio);
  }

  void _save() {
    widget.onSave(
      _nameController.text,
      _emailController.text,
      _phoneController.text,
      _specialtyController.text,
      _bioController.text,
    );
    Navigator.pop(context);
  }

  Future<void> _selectSpecialty() async {
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
        _specialtyController.text = _selectedSpecialties.join(', ');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: true,
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
                const SizedBox(width: 10),
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
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: '諮商師姓名',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: '電話',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _specialtyController,
                    decoration: const InputDecoration(
                      labelText: '諮商專長',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _selectSpecialty,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  ),
                  child: const Text('編輯專長'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _bioController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: '自我介紹',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _save,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text('保存'),
            ),
          ],
        ),
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
