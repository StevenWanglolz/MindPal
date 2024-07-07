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
      home: const CounselorMainWithCerti(),
    );
  }
}

class CounselorMainWithCerti extends StatefulWidget {
  const CounselorMainWithCerti({super.key});

  @override
  _CounselorMainWithCertiState createState() => _CounselorMainWithCertiState();
}

class _CounselorMainWithCertiState extends State<CounselorMainWithCerti>
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
          const CaseManagementTab(),
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/counselorLogin');
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
                          Text('登出'),
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

class CaseManagementTab extends StatefulWidget {
  const CaseManagementTab({super.key});

  @override
  _CaseManagementTabState createState() => _CaseManagementTabState();
}

class _CaseManagementTabState extends State<CaseManagementTab> {
  String searchQuery = '';
  List<Map<String, String>> caseRequests = [
    {
      '案主編號': 'C001',
      '姓名': '張三',
      'Email': 'zhang.san@example.com',
      '諮商主題': '壓力管理',
      '困擾程度': '中',
      '時間': '2024-07-15'
    },
    {
      '案主編號': 'C002',
      '姓名': '李四',
      'Email': 'li.si@example.com',
      '諮商主題': '人際關係',
      '困擾程度': '高',
      '時間': '2024-07-16'
    },
    {
      '案主編號': 'C003',
      '姓名': '王五',
      'Email': 'wang.wu@example.com',
      '諮商主題': '職業發展',
      '困擾程度': '低',
      '時間': '2024-07-17'
    },
    {
      '案主編號': 'C004',
      '姓名': '趙六',
      'Email': 'zhao.liu@example.com',
      '諮商主題': '家庭問題',
      '困擾程度': '中',
      '時間': '2024-07-18'
    },
    {
      '案主編號': 'C005',
      '姓名': '孫七',
      'Email': 'sun.qi@example.com',
      '諮商主題': '學業壓力',
      '困擾程度': '高',
      '時間': '2024-07-19'
    },
    {
      '案主編號': 'C006',
      '姓名': '周八',
      'Email': 'zhou.ba@example.com',
      '諮商主題': '情感困擾',
      '困擾程度': '中',
      '時間': '2024-07-20'
    },
    {
      '案主編號': 'C007',
      '姓名': '吳九',
      'Email': 'wu.jiu@example.com',
      '諮商主題': '自我認同',
      '困擾程度': '低',
      '時間': '2024-07-21'
    },
    {
      '案主編號': 'C008',
      '姓名': '鄭十',
      'Email': 'zheng.shi@example.com',
      '諮商主題': '焦慮症狀',
      '困擾程度': '高',
      '時間': '2024-07-22'
    },
  ];

  List<Map<String, String>> clientInfo = [
    {
      '案主編號': 'C001',
      '姓名': '張三',
      'Email': 'zhang.san@example.com',
      '電話號碼': '0912-345-678',
      '緊急聯絡人': '張母',
      '緊急聯絡人電話': '0923-456-789',
      '合作開始日期': '2024-01-01'
    },
    {
      '案主編號': 'C002',
      '姓名': '李四',
      'Email': 'li.si@example.com',
      '電話號碼': '0934-567-890',
      '緊急聯絡人': '李父',
      '緊急聯絡人電話': '0945-678-901',
      '合作開始日期': '2024-02-15'
    },
    {
      '案主編號': 'C003',
      '姓名': '王五',
      'Email': 'wang.wu@example.com',
      '電話號碼': '0956-789-012',
      '緊急聯絡人': '王兄',
      '緊急聯絡人電話': '0967-890-123',
      '合作開始日期': '2024-03-20'
    },
    {
      '案主編號': 'C004',
      '姓名': '趙六',
      'Email': 'zhao.liu@example.com',
      '電話號碼': '0978-901-234',
      '緊急聯絡人': '趙姐',
      '緊急聯絡人電話': '0989-012-345',
      '合作開始日期': '2024-04-10'
    },
    {
      '案主編號': 'C005',
      '姓名': '孫七',
      'Email': 'sun.qi@example.com',
      '電話號碼': '0990-123-456',
      '緊急聯絡人': '孫母',
      '緊急聯絡人電話': '0901-234-567',
      '合作開始日期': '2024-05-05'
    },
    {
      '案主編號': 'C006',
      '姓名': '周八',
      'Email': 'zhou.ba@example.com',
      '電話號碼': '0912-345-678',
      '緊急聯絡人': '周父',
      '緊急聯絡人電話': '0923-456-789',
      '合作開始日期': '2024-06-20'
    },
    {
      '案主編號': 'C007',
      '姓名': '吳九',
      'Email': 'wu.jiu@example.com',
      '電話號碼': '0934-567-890',
      '緊急聯絡人': '吳姐',
      '緊急聯絡人電話': '0945-678-901',
      '合作開始日期': '2024-07-15'
    },
    {
      '案主編號': 'C008',
      '姓名': '鄭十',
      'Email': 'zheng.shi@example.com',
      '電話號碼': '0956-789-012',
      '緊急聯絡人': '鄭兄',
      '緊急聯絡人電話': '0967-890-123',
      '合作開始日期': '2024-08-01'
    },
  ];

  List<Map<String, String>> filteredClientInfo = [];

  @override
  void initState() {
    super.initState();
    filteredClientInfo = clientInfo;
  }

  void _filterClients(String query) {
    setState(() {
      searchQuery = query;
      filteredClientInfo = clientInfo
          .where((client) =>
              client['姓名']!.toLowerCase().contains(query.toLowerCase()) ||
              client['Email']!.toLowerCase().contains(query.toLowerCase()) ||
              client['電話號碼']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _showClientDetails(Map<String, String> client) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(16),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              const Text(
                '案主個人資訊',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text('User ID: ${client['案主編號']}'),
              Text('案主: ${client['姓名']}'),
              Text('Email: ${client['Email']}'),
              Text('電話: ${client['電話號碼']}'),
              Text('緊急聯絡人: ${client['緊急聯絡人']}'),
              Text('緊急聯絡人電話: ${client['緊急聯絡人電話']}'),
              Text('合作開始日期: ${client['合作開始日期']}'),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text('結束諮商合作'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text('案主儀表板'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                    child: const Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '新案主請求',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: DataTable(
                    columnSpacing: 20,
                    columns: const [
                      DataColumn(label: Text('案主編號')),
                      DataColumn(label: Text('姓名')),
                      DataColumn(label: Text('Email')),
                      DataColumn(label: Text('諮商主題')),
                      DataColumn(label: Text('困擾程度')),
                      DataColumn(label: Text('回應處理時間')),
                      DataColumn(label: Text('')),
                    ],
                    rows: caseRequests
                        .map((request) => DataRow(cells: [
                              DataCell(Text(request['案主編號']!)),
                              DataCell(Text(request['姓名']!)),
                              DataCell(Text(request['Email']!)),
                              DataCell(Text(request['諮商主題']!)),
                              DataCell(Text(request['困擾程度']!)),
                              DataCell(Text(request['時間']!)),
                              DataCell(Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.grey),
                                    child: const Text('拒絕',
                                        style: TextStyle(color: Colors.black)),
                                  ),
                                  const SizedBox(width: 8),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green),
                                    child: const Text('接受',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                ],
                              )),
                            ]))
                        .toList(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              '案主資訊列表',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              onChanged: _filterClients,
              decoration: InputDecoration(
                labelText: 'Search',
                border: const OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: DataTable(
                    columnSpacing: 20,
                    columns: const [
                      DataColumn(label: Text('案主編號')),
                      DataColumn(label: Text('姓名')),
                      DataColumn(label: Text('Email')),
                      DataColumn(label: Text('電話號碼')),
                      DataColumn(label: Text('緊急聯絡人')),
                      DataColumn(label: Text('緊急聯絡人電話')),
                      DataColumn(label: Text('合作開始日期')),
                      DataColumn(label: Text('')),
                    ],
                    rows: filteredClientInfo
                        .map((client) => DataRow(cells: [
                              DataCell(Text(client['案主編號']!)),
                              DataCell(Text(client['姓名']!)),
                              DataCell(Text(client['Email']!)),
                              DataCell(Text(client['電話號碼']!)),
                              DataCell(Text(client['緊急聯絡人']!)),
                              DataCell(Text(client['緊急聯絡人電話']!)),
                              DataCell(Text(client['合作開始日期']!)),
                              DataCell(Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.grey),
                                    child: const Text('編輯資料',
                                        style: TextStyle(color: Colors.black)),
                                  ),
                                  const SizedBox(width: 8),
                                  ElevatedButton(
                                    onPressed: () {
                                      _showClientDetails(client);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green),
                                    child: const Text('詳細資料',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                ],
                              )),
                            ]))
                        .toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
