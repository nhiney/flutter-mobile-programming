import 'package:flutter/material.dart';
import '../models/group.dart';
import '../models/member.dart';

class GroupScreen extends StatelessWidget {
  GroupScreen({super.key});

  final Group group = Group(
    code: 'N01',
    name: 'Nhóm Flutter',
    totalMembers: 3,
    members: [
      Member(id: '200122001', name: 'Nguyễn Văn A', role: 'Nhóm trưởng'),
      Member(id: '200122002', name: 'Trần Thị B', role: 'Thành viên'),
      Member(id: '200122003', name: 'Lê Văn C', role: 'Thành viên'),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông tin nhóm'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===== THÔNG TIN NHÓM =====
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _infoRow('Mã nhóm', group.code),
                    _infoRow('Tên nhóm', group.name),
                    _infoRow(
                        'Số thành viên', group.totalMembers.toString()),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Danh sách thành viên',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // ===== DANH SÁCH THÀNH VIÊN =====
            Expanded(
              child: ListView.builder(
                itemCount: group.members.length,
                itemBuilder: (context, index) {
                  final member = group.members[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          member.name[0],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: Text(member.name),
                      subtitle: Text('MSSV: ${member.id}'),
                      trailing: Text(
                        member.role,
                        style: TextStyle(
                          color: member.role == 'Nhóm trưởng'
                              ? Colors.blue
                              : Colors.black54,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              label,
              style: const TextStyle(color: Colors.black54),
            ),
          ),
          Expanded(
            flex: 6,
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
