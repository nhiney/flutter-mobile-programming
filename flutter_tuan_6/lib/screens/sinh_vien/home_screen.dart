import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_tuan_6/providers/sinh_vien/sinhvien_provider.dart';
import 'package:flutter_tuan_6/widgets/sinh_vien/add_sinhvien_dialog.dart';
import 'package:flutter_tuan_6/widgets/sinh_vien/edit_sinhvien_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<SinhVienProvider>(context, listen: false).loadSinhViens());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xFF1E293B), size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFFFFF), // White at top
              Color(0xFFFAE8FF), // Light Purple middle
              Color(0xFFFCE7F3), // Pink bottom
            ],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 100), // Spacing to account for AppBar and Status Bar
            // Graceful Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9), 
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  controller: searchController,
                  onChanged: (value) {
                    Provider.of<SinhVienProvider>(context, listen: false).setSearchQuery(value);
                    setState(() {});
                  },
                  style: const TextStyle(fontSize: 14, color: Color(0xFF1E293B), fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    hintText: "Tìm kiếm sinh viên...",
                    hintStyle: const TextStyle(color: Colors.black45, fontSize: 14, fontWeight: FontWeight.w500),
                    prefixIcon: const Icon(Icons.search_rounded, color: Colors.black26, size: 20),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.close_rounded, color: Colors.black26, size: 18),
                      onPressed: () {
                        searchController.clear();
                        Provider.of<SinhVienProvider>(context, listen: false).setSearchQuery("");
                        setState(() {});
                      },
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                  ),
                ),
              ),
            ),
            
            Expanded(
              child: Consumer<SinhVienProvider>(
                builder: (context, provider, child) {
                  if (provider.sinhViens.isEmpty) {
                    return Center(
                      child: Text(
                        "Không tìm thấy sinh viên",
                        style: TextStyle(color: Colors.black.withOpacity(0.1), fontWeight: FontWeight.w300),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: provider.sinhViens.length,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    itemBuilder: (context, index) {
                      final sv = provider.sinhViens[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xFF94A3B8).withOpacity(0.7), // Precise muted-grey with reveal
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          leading: Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: ClipOval(
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Image.asset('assets/images/school_logo.png', fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          title: Text(
                            sv.name,
                            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Color(0xFF1E3A8A)),
                          ),
                          subtitle: Text(
                            sv.email,
                            style: const TextStyle(color: Color(0xFF52525B), fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red, size: 24),
                            onPressed: () => provider.deleteSinhVien(sv.id!),
                          ),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => EditSinhVienDialog(sinhVien: sv),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16, right: 8),
        child: GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => const AddSinhVienDialog(),
            );
          },
          child: Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              color: const Color(0xFFEDE9FE),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(Icons.add_rounded, color: Color(0xFF4338CA), size: 30),
          ),
        ),
      ),
    );
  }
}
