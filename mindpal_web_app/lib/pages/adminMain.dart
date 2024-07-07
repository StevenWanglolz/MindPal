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
      home: const AdminMain(),
    );
  }
}

class AdminMain extends StatefulWidget {
  const AdminMain({super.key});

  @override
  AdminMainState createState() => AdminMainState();
}

class AdminMainState extends State<AdminMain>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _showChangePasswordDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Center(
          child: ChangePasswordModal(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // No back button
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
            const Text(
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
          labelColor: Colors.black,
          indicatorColor: Colors.green,
          tabs: const [
            Tab(text: '諮商師與業主管理'),
            Tab(text: '諮商師管理'),
            Tab(text: '會員管理'),
            Tab(text: '個人資訊維護'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height -
              AppBar().preferredSize.height,
          child: TabBarView(
            controller: _tabController,
            children: const [
              CounselorAndOwnerManagement(),
              CounselorManagement(),
              MemberManagement(),
              PersonalInformation(),
            ],
          ),
        ),
      ),
    );
  }
}

class CounselorAndOwnerManagement extends StatelessWidget {
  const CounselorAndOwnerManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('諮商師與業主管理 Content'));
  }
}

class CounselorManagement extends StatefulWidget {
  const CounselorManagement({super.key});

  @override
  _CounselorManagementState createState() => _CounselorManagementState();
}

class _CounselorManagementState extends State<CounselorManagement> {
  String searchQueryVerification = '';
  String searchQueryList = '';

  List<Map<String, String>> counselorsForVerification = [
    {
      '諮商師編號': 'C101',
      '姓名': '張心理',
      'Email': 'zhang.xinli@example.com',
      '電話號碼': '0923-456-789',
      '所屬單位': '陽光心理診所',
      '執業執照': 'PSY789012',
      '加入MindPal日期': '2024/03/15',
      '服務案主人數': '20',
      '諮商專長': '人際關係管理',
      '諮商服務啟動日期': '2017/04/17',
      '自我介紹': '這是一段自我介紹...這是一段自我介紹...這是一段自我介紹...這是一段自我介紹...這是一段自我介紹...',
    },
    {
      '諮商師編號': 'C102',
      '姓名': '林輔導',
      'Email': 'lin.fudao@example.com',
      '電話號碼': '0934-567-890',
      '所屬單位': '青山諮商中心',
      '執業執照': 'PSY890123',
      '加入MindPal日期': '2024/03/16',
      '服務案主人數': '15',
      '諮商專長': '壓力管理',
      '諮商服務啟動日期': '2018/04/18',
      '自我介紹': '這是一段自我介紹...這是一段自我介紹...這是一段自我介紹...這是一段自我介紹...這是一段自我介紹...',
    },
    {
      '諮商師編號': 'C103',
      '姓名': '王治療',
      'Email': 'wang.zhiliao@example.com',
      '電話號碼': '0945-678-901',
      '所屬單位': '和平心理診所',
      '執業執照': 'PSY901234',
      '加入MindPal日期': '2024/03/17',
      '服務案主人數': '10',
      '諮商專長': '情感困擾',
      '諮商服務啟動日期': '2019/04/19',
      '自我介紹': '這是一段自我介紹...這是一段自我介紹...這是一段自我介紹...這是一段自我介紹...這是一段自我介紹...',
    },
  ];

  List<Map<String, String>> counselors = [
    {
      '諮商師編號': 'C001',
      '姓名': '李諮商',
      'Email': 'li.counselor@example.com',
      '電話號碼': '0912-345-678',
      '服務單位': '心理諮商中心A',
      '執業執照': 'PSY123456',
      '加入MindPal日期': '2024/01/01'
    },
    {
      '諮商師編號': 'C002',
      '姓名': '陳心理',
      'Email': 'chen.xinli@example.com',
      '電話號碼': '0923-456-789',
      '服務單位': '陽光心理診所',
      '執業執照': 'PSY234567',
      '加入MindPal日期': '2024/01/15'
    },
    {
      '諮商師編號': 'C003',
      '姓名': '王輔導',
      'Email': 'wang.fudao@example.com',
      '電話號碼': '0934-567-890',
      '服務單位': '青山諮商中心',
      '執業執照': 'PSY345678',
      '加入MindPal日期': '2024/02/01'
    },
    {
      '諮商師編號': 'C004',
      '姓名': '林治療',
      'Email': 'lin.zhiliao@example.com',
      '電話號碼': '0945-678-901',
      '服務單位': '和平心理診所',
      '執業執照': 'PSY456789',
      '加入MindPal日期': '2024/02/15'
    },
    {
      '諮商師編號': 'C005',
      '姓名': '張諮詢',
      'Email': 'zhang.zixun@example.com',
      '電話號碼': '0956-789-012',
      '服務單位': '希望諮商所',
      '執業執照': 'PSY567890',
      '加入MindPal日期': '2024/03/01'
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  void _showCounselorDetailsDialog(Map<String, String> counselor) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('諮商師個人資訊'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('諮商師編號: ${counselor['諮商師編號']}'),
                Text('姓名: ${counselor['姓名']}'),
                Text('Email: ${counselor['Email']}'),
                Text('電話: ${counselor['電話號碼']}'),
                Text('執業執照: ${counselor['執業執照']}'), // Add more fields as needed
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('關閉'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showVerificationDialog(Map<String, String> counselor) {
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
                '諮商師個人資訊',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text('Therapist ID: ${counselor['諮商師編號']}'),
              Text('諮商師暱稱: ${counselor['姓名']} 諮商師'),
              Text('Email: ${counselor['Email']}'),
              Text('電話: ${counselor['電話號碼']}'),
              const SizedBox(height: 16),
              Text('諮商師專長領域: ${counselor['諮商專長']}'),
              Text('諮商服務啟動日期: ${counselor['諮商服務啟動日期']}'),
              Text('服務案主人數: ${counselor['服務案主人數']}'),
              const SizedBox(height: 16),
              Text('自我介紹: ${counselor['自我介紹']}'),
              const SizedBox(height: 16),
              Text('加入MindPal日期: ${counselor['加入MindPal日期']}'),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text('驗證失敗'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text('驗證通過'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                    child: const Text('取消'),
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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '諮商師驗證',
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
                    DataColumn(label: Text('諮商師編號')),
                    DataColumn(label: Text('姓名')),
                    DataColumn(label: Text('Email')),
                    DataColumn(label: Text('電話號碼')),
                    DataColumn(label: Text('所屬單位')),
                    DataColumn(label: Text('執業執照')),
                    DataColumn(label: Text('加入MindPal日期')),
                    DataColumn(label: Text('')),
                  ],
                  rows: counselorsForVerification
                      .map((counselor) => DataRow(cells: [
                            DataCell(Text(counselor['諮商師編號']!)),
                            DataCell(Text(counselor['姓名']!)),
                            DataCell(Text(counselor['Email']!)),
                            DataCell(Text(counselor['電話號碼']!)),
                            DataCell(Text(counselor['所屬單位']!)),
                            DataCell(Text(counselor['執業執照']!)),
                            DataCell(Text(counselor['加入MindPal日期']!)),
                            DataCell(
                              ElevatedButton(
                                onPressed: () {
                                  _showVerificationDialog(counselor);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                ),
                                child: const Text('審核'),
                              ),
                            ),
                          ]))
                      .toList(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            '諮商師資訊列表',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          TextField(
            onChanged: (value) {
              setState(() {
                searchQueryList = value;
              });
            },
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
                    DataColumn(label: Text('諮商師編號')),
                    DataColumn(label: Text('姓名')),
                    DataColumn(label: Text('Email')),
                    DataColumn(label: Text('電話號碼')),
                    DataColumn(label: Text('服務單位')),
                    DataColumn(label: Text('執業執照')),
                    DataColumn(label: Text('加入MindPal日期')),
                    DataColumn(label: Text('')),
                  ],
                  rows: counselors
                      .where((counselor) =>
                          counselor['姓名']!
                              .toLowerCase()
                              .contains(searchQueryList.toLowerCase()) ||
                          counselor['Email']!
                              .toLowerCase()
                              .contains(searchQueryList.toLowerCase()) ||
                          counselor['電話號碼']!
                              .toLowerCase()
                              .contains(searchQueryList.toLowerCase()))
                      .map((counselor) => DataRow(cells: [
                            DataCell(Text(counselor['諮商師編號']!)),
                            DataCell(Text(counselor['姓名']!)),
                            DataCell(Text(counselor['Email']!)),
                            DataCell(Text(counselor['電話號碼']!)),
                            DataCell(Text(counselor['服務單位']!)),
                            DataCell(Text(counselor['執業執照']!)),
                            DataCell(Text(counselor['加入MindPal日期']!)),
                            DataCell(Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.grey),
                                  child: const Text('刪除',
                                      style: TextStyle(color: Colors.black)),
                                ),
                                const SizedBox(width: 8),
                                ElevatedButton(
                                  onPressed: () =>
                                      _showCounselorDetailsDialog(counselor),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                  ),
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
    );
  }
}

class MemberManagement extends StatefulWidget {
  const MemberManagement({super.key});

  @override
  _MemberManagementState createState() => _MemberManagementState();
}

class _MemberManagementState extends State<MemberManagement> {
  String searchQuery = '';
  List<Map<String, String>> members = [
    {
      '會員編號': 'M001',
      '姓名': '張三',
      'Email': 'zhang.san@example.com',
      '電話號碼': '0912-345-678',
      '所屬諮商師': '李諮商',
      '緊急聯絡人': '張母',
      '緊急聯絡人電話': '0923-456-789'
    },
    {
      '會員編號': 'M002',
      '姓名': '李四',
      'Email': 'li.si@example.com',
      '電話號碼': '0934-567-890',
      '所屬諮商師': '王諮商',
      '緊急聯絡人': '李父',
      '緊急聯絡人電話': '0945-678-901'
    },
    {
      '會員編號': 'M003',
      '姓名': '王五',
      'Email': 'wang.wu@example.com',
      '電話號碼': '0956-789-012',
      '所屬諮商師': '陳諮商',
      '緊急聯絡人': '王兄',
      '緊急聯絡人電話': '0967-890-123'
    },
    {
      '會員編號': 'M001',
      '姓名': '張三',
      'Email': 'zhang.san@example.com',
      '電話號碼': '0912-345-678',
      '所屬諮商師': '李諮商',
      '緊急聯絡人': '張母',
      '緊急聯絡人電話': '0923-456-789'
    },
    {
      '會員編號': 'M002',
      '姓名': '李四',
      'Email': 'li.si@example.com',
      '電話號碼': '0934-567-890',
      '所屬諮商師': '王諮商',
      '緊急聯絡人': '李父',
      '緊急聯絡人電話': '0945-678-901'
    },
    {
      '會員編號': 'M003',
      '姓名': '王五',
      'Email': 'wang.wu@example.com',
      '電話號碼': '0956-789-012',
      '所屬諮商師': '陳諮商',
      '緊急聯絡人': '王兄',
      '緊急聯絡人電話': '0967-890-123'
    },
    {
      '會員編號': 'M001',
      '姓名': '張三',
      'Email': 'zhang.san@example.com',
      '電話號碼': '0912-345-678',
      '所屬諮商師': '李諮商',
      '緊急聯絡人': '張母',
      '緊急聯絡人電話': '0923-456-789'
    },
    {
      '會員編號': 'M002',
      '姓名': '李四',
      'Email': 'li.si@example.com',
      '電話號碼': '0934-567-890',
      '所屬諮商師': '王諮商',
      '緊急聯絡人': '李父',
      '緊急聯絡人電話': '0945-678-901'
    },
    {
      '會員編號': 'M003',
      '姓名': '王五',
      'Email': 'wang.wu@example.com',
      '電話號碼': '0956-789-012',
      '所屬諮商師': '陳諮商',
      '緊急聯絡人': '王兄',
      '緊急聯絡人電話': '0967-890-123'
    },
    // Add more member data as needed
  ];

  void _showMemberDetailsDialog(Map<String, String> member) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('會員個人資訊'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('會員編號: ${member['會員編號']}'),
                Text('姓名: ${member['姓名']}'),
                Text('Email: ${member['Email']}'),
                Text('電話: ${member['電話號碼']}'),
                Text('緊急聯絡人: ${member['緊急聯絡人']}'),
                Text('緊急聯絡人電話: ${member['緊急聯絡人電話']}'),
                // Add more fields as needed
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('關閉'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showEditMemberDialog(Map<String, String> member) {
    final nameController = TextEditingController(text: member['姓名']);
    final emailController = TextEditingController(text: member['Email']);
    final phoneController = TextEditingController(text: member['電話號碼']);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('編輯會員資訊'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: '管理員姓名'),
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  controller: phoneController,
                  decoration: const InputDecoration(labelText: '電話'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('取消'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                // Update member information
                setState(() {
                  member['姓名'] = nameController.text;
                  member['Email'] = emailController.text;
                  member['電話號碼'] = phoneController.text;
                });
                Navigator.of(context).pop();
              },
              child: const Text('完成個人資訊編輯'),
            ),
          ],
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
              '會員資訊列表',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Search',
                border: const OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 450,
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
                      DataColumn(label: Text('會員編號')),
                      DataColumn(label: Text('姓名')),
                      DataColumn(label: Text('Email')),
                      DataColumn(label: Text('電話號碼')),
                      DataColumn(label: Text('所屬諮商師')),
                      DataColumn(label: Text('緊急聯絡人')),
                      DataColumn(label: Text('緊急聯絡人電話')),
                      DataColumn(label: Text('')),
                    ],
                    rows: members
                        .where((member) =>
                            member['姓名']!
                                .toLowerCase()
                                .contains(searchQuery.toLowerCase()) ||
                            member['Email']!
                                .toLowerCase()
                                .contains(searchQuery.toLowerCase()) ||
                            member['電話號碼']!
                                .toLowerCase()
                                .contains(searchQuery.toLowerCase()))
                        .map((member) => DataRow(cells: [
                              DataCell(Text(member['會員編號']!)),
                              DataCell(Text(member['姓名']!)),
                              DataCell(Text(member['Email']!)),
                              DataCell(Text(member['電話號碼']!)),
                              DataCell(Text(member['所屬諮商師']!)),
                              DataCell(Text(member['緊急聯絡人']!)),
                              DataCell(Text(member['緊急聯絡人電話']!)),
                              DataCell(Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () =>
                                        _showEditMemberDialog(member),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.grey,
                                    ),
                                    child: const Text('編輯',
                                        style: TextStyle(color: Colors.black)),
                                  ),
                                  const SizedBox(width: 8),
                                  ElevatedButton(
                                    onPressed: () =>
                                        _showMemberDetailsDialog(member),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                    ),
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

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key});

  @override
  _PersonalInformationState createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  bool isEditing = false;
  String name = 'John Doe';
  String email = 'john.doe@example.com';
  String phone = '123-456-7890';

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  void toggleEditing() {
    setState(() {
      isEditing = !isEditing;
      if (isEditing) {
        _nameController.text = name;
        _emailController.text = email;
        _phoneController.text = phone;
      } else {
        name = _nameController.text;
        email = _emailController.text;
        phone = _phoneController.text;
      }
    });
  }

  void _showChangePasswordDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Center(
          child: ChangePasswordModal(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    '管理員編號 A000001',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: toggleEditing,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.grey[300],
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('更改個人資訊'),
                Icon(Icons.arrow_forward),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _showChangePasswordDialog,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.grey[300],
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('更改密碼'),
                Icon(Icons.arrow_forward),
              ],
            ),
          ),
          const SizedBox(height: 16),
          if (isEditing) ...[
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: '管理員姓名',
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
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: toggleEditing,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text('完成個人資訊編輯'),
            ),
          ] else ...[
            Text('管理員姓名: $name'),
            const SizedBox(height: 16),
            Text('Email: $email'),
            const SizedBox(height: 16),
            Text('電話: $phone'),
          ],
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
