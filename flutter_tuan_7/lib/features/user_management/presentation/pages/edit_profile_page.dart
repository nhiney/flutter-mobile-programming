import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../domain/models/user_model.dart';
import '../../data/database_helper.dart';
import '../../../../core/config/app_config.dart';

class EditProfilePage extends StatefulWidget {
  final User? user;
  const EditProfilePage({super.key, this.user});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _dobController;
  late TextEditingController _countryController;
  String? _avatarPath;

  late final List<String> _countries;

  bool get _isEditMode => widget.user != null;

  @override
  void initState() {
    super.initState();
    final config = AppConfig.instance;
    _countries = config.getStringList('user_management.countries').isNotEmpty
        ? config.getStringList('user_management.countries')
        : ['Vietnam', 'United States', 'Japan'];

    final defaultCountry = config.get<String>('user_management.default_country', 'Vietnam');

    _nameController = TextEditingController(text: widget.user?.name ?? '');
    _emailController = TextEditingController(text: widget.user?.email ?? '');
    _passwordController = TextEditingController(text: widget.user?.password ?? '');
    _dobController = TextEditingController(text: widget.user?.dob ?? '');
    _countryController = TextEditingController(
      text: widget.user?.country ?? defaultCountry,
    );
    _avatarPath = widget.user?.avatarPath;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _dobController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    DateTime initialDate;
    try {
      initialDate = DateFormat('dd/MM/yyyy').parse(_dobController.text);
    } catch (_) {
      initialDate = DateTime(1990, 1, 1);
    }

    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: Color(0xFF3F4E7A),
            onPrimary: Colors.white,
            onSurface: Colors.black,
          ),
        ),
        child: child!,
      ),
    );

    if (picked != null) {
      setState(() {
        _dobController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  Future<void> _pickAvatar() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => _avatarPath = picked.path);
    }
  }

  Future<void> _saveChanges() async {
    if (!_formKey.currentState!.validate()) return;

    final user = User(
      id: widget.user?.id,
      name: _nameController.text.trim(),
      email: _emailController.text.trim(),
      password: _passwordController.text,
      dob: _dobController.text.trim(),
      country: _countryController.text,
      avatarPath: _avatarPath,
    );

    if (_isEditMode) {
      await DatabaseHelper.instance.updateUser(user);
    } else {
      await DatabaseHelper.instance.createUser(user);
    }

    if (mounted) Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          _isEditMode ? 'Edit Profile' : 'New User',
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAvatarSection(),
              const SizedBox(height: 32),
              _buildLabel('Name'),
              _buildTextField(_nameController, hint: 'Enter full name'),
              const SizedBox(height: 16),
              _buildLabel('Email'),
              _buildTextField(
                _emailController,
                hint: 'Enter email address',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              _buildLabel('Password'),
              _buildTextField(
                _passwordController,
                hint: 'Enter password',
                obscureText: true,
              ),
              const SizedBox(height: 16),
              _buildLabel('Date of Birth'),
              _buildTextField(
                _dobController,
                hint: 'Select date of birth',
                readOnly: true,
                onTap: _selectDate,
                suffixIcon: Icons.calendar_today_outlined,
              ),
              const SizedBox(height: 16),
              _buildLabel('Country / Region'),
              _buildDropdownField(),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF262F56),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: _saveChanges,
                  child: const Text(
                    'Save Changes',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatarSection() {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.blue.withValues(alpha: 0.2), width: 2),
              image: _avatarPath != null
                  ? DecorationImage(
                      image: FileImage(File(_avatarPath!)),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: _avatarPath == null
                ? Icon(Icons.person, size: 80, color: Colors.grey[300])
                : null,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: _pickAvatar,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Color(0xFF3F4E7A),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.camera_alt, color: Colors.white, size: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller, {
    String hint = '',
    bool obscureText = false,
    TextInputType? keyboardType,
    bool readOnly = false,
    VoidCallback? onTap,
    IconData? suffixIcon,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      readOnly: readOnly,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.withValues(alpha: 0.3)),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        suffixIcon: suffixIcon != null
            ? Icon(suffixIcon, color: Colors.grey, size: 20)
            : null,
      ),
      validator: (value) =>
          value == null || value.trim().isEmpty ? 'This field is required.' : null,
    );
  }

  Widget _buildDropdownField() {
    String currentValue = _countries.contains(_countryController.text)
        ? _countryController.text
        : _countries.first;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: currentValue,
          items: _countries
              .map((v) => DropdownMenuItem<String>(value: v, child: Text(v)))
              .toList(),
          onChanged: (v) {
            if (v != null) {
              setState(() => _countryController.text = v);
            }
          },
        ),
      ),
    );
  }
}
