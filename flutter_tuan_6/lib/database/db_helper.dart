import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/sinh_vien/sinhvien.dart';
import '../models/todo_app/todo.dart';
import '../models/san_pham/sanpham.dart';
import '../models/chi_tieu/chi_tieu.dart';
import '../models/auth/user_account.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'sinhvien.db');
    return await openDatabase(
      path,
      version: 7, // Upgraded for user_accounts
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE sinhvien (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        email TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE todos (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        content TEXT,
        isCompleted INTEGER
      )
    ''');
    await db.execute('''
      CREATE TABLE sanphams (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        ma TEXT,
        ten TEXT,
        gia REAL,
        giamGia REAL,
        imageUrl TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE chi_tieus (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        noiDung TEXT,
        soTien REAL,
        ghiChu TEXT,
        category TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE user_accounts (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        email TEXT UNIQUE,
        password TEXT
      )
    ''');
    
    // Seed initial data
    await db.insert('sinhvien', {'name': 'Nguyen Van A', 'email': 'a@example.com'});
    await db.insert('sinhvien', {'name': 'Nguyen Van B', 'email': 'b@example.com'});
    await db.insert('sinhvien', {'name': 'An Binh Tran', 'email': 'abt@abc.com'});
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('''
        CREATE TABLE todos (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          content TEXT,
          isCompleted INTEGER
        )
      ''');
    }
    if (oldVersion < 3) {
      await db.execute('''
        CREATE TABLE sanphams (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          ma TEXT,
          ten TEXT,
          gia REAL,
          giamGia REAL
        )
      ''');
    }
    if (oldVersion < 4) {
      await db.execute('ALTER TABLE sanphams ADD COLUMN imageUrl TEXT');
    }
    if (oldVersion < 5) {
      await db.execute('''
        CREATE TABLE chi_tieus (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          noiDung TEXT,
          soTien REAL,
          ghiChu TEXT
        )
      ''');
    }
    if (oldVersion < 6) {
      await db.execute('ALTER TABLE chi_tieus ADD COLUMN category TEXT DEFAULT "Khác"');
    }
    if (oldVersion < 7) {
      await db.execute('''
        CREATE TABLE user_accounts (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          email TEXT UNIQUE,
          password TEXT
        )
      ''');
    }
  }

  // --- SinhVien Operations ---
  Future<int> insertSinhVien(SinhVien sv) async {
    Database db = await database;
    return await db.insert('sinhvien', sv.toMap());
  }

  Future<List<SinhVien>> getSinhViens() async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query('sinhvien');
    
    if (maps.isEmpty) {
      await db.insert('sinhvien', {'name': 'Nguyen Van A', 'email': 'a@example.com'});
      await db.insert('sinhvien', {'name': 'Nguyen Van B', 'email': 'b@example.com'});
      await db.insert('sinhvien', {'name': 'An Binh Tran', 'email': 'abt@abc.com'});
      maps = await db.query('sinhvien');
    }
    
    return List.generate(maps.length, (i) {
      return SinhVien.fromMap(maps[i]);
    });
  }

  Future<int> updateSinhVien(SinhVien sv) async {
    Database db = await database;
    return await db.update('sinhvien', sv.toMap(), where: 'id = ?', whereArgs: [sv.id]);
  }

  Future<int> deleteSinhVien(int id) async {
    Database db = await database;
    return await db.delete('sinhvien', where: 'id = ?', whereArgs: [id]);
  }

  // --- Todo Operations ---
  Future<List<Todo>> getTodos() async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query('todos', orderBy: 'id ASC');
    
    if (maps.isEmpty) {
      await db.insert('todos', {'title': 'Tap huan', 'content': '', 'isCompleted': 1});
      await db.insert('todos', {'title': 'De Cuong học phan', 'content': '', 'isCompleted': 0});
      await db.insert('todos', {'title': 'NCKH', 'content': '', 'isCompleted': 0});
      await db.insert('todos', {'title': 'Hop chuyen mon', 'content': '', 'isCompleted': 0});
      maps = await db.query('todos', orderBy: 'id ASC');
    }
    
    return List.generate(maps.length, (i) => Todo.fromMap(maps[i]));
  }

  Future<int> insertTodo(Todo todo) async {
    Database db = await database;
    return await db.insert('todos', todo.toMap());
  }

  Future<int> updateTodo(Todo todo) async {
    Database db = await database;
    return await db.update('todos', todo.toMap(), where: 'id = ?', whereArgs: [todo.id]);
  }

  Future<int> deleteTodo(int id) async {
    Database db = await database;
    return await db.delete('todos', where: 'id = ?', whereArgs: [id]);
  }

  // --- SanPham Operations ---
  Future<List<SanPham>> getSanPhams() async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query('sanphams', orderBy: 'id DESC');
    
    if (maps.isEmpty) {
      await db.insert('sanphams', {
        'id': 1,
        'ma': 'IP15',
        'ten': 'iPhone 15 Pro Max',
        'gia': 34990000.0,
        'giamGia': 1000000.0,
        'imageUrl': 'assets/images/ip15.png'
      });
      await db.insert('sanphams', {
        'id': 2,
        'ma': 'S24U',
        'ten': 'Samsung Galaxy S24 Ultra',
        'gia': 29990000.0,
        'giamGia': 1500000.0,
        'imageUrl': 'assets/images/samsung.png'
      });
      await db.insert('sanphams', {
        'id': 3,
        'ma': 'MBP14',
        'ten': 'MacBook Pro 14 M3',
        'gia': 39990000.0,
        'giamGia': 500000.0,
        'imageUrl': 'assets/images/mac.png'
      });
      await db.insert('sanphams', {
        'id': 4,
        'ma': 'AWU2',
        'ten': 'Apple Watch Ultra 2',
        'gia': 21990000.0,
        'giamGia': 800000.0,
        'imageUrl': 'assets/images/watch.png'
      });
      maps = await db.query('sanphams', orderBy: 'id DESC');
    } else {
      // Proactively update default IDs if they still use old paths or .jpeg
      for (var map in maps) {
        if (map['id'] != null && map['id'] <= 4) {
          String newUrl = '';
          if (map['id'] == 1) newUrl = 'assets/images/ip15.png';
          else if (map['id'] == 2) newUrl = 'assets/images/samsung.png';
          else if (map['id'] == 3) newUrl = 'assets/images/mac.png';
          else if (map['id'] == 4) newUrl = 'assets/images/watch.png';
          
          if (map['imageUrl'] != newUrl) {
            await db.update('sanphams', {'imageUrl': newUrl}, where: 'id = ?', whereArgs: [map['id']]);
          }
        }
      }
      maps = await db.query('sanphams', orderBy: 'id DESC');
    }
    
    return List.generate(maps.length, (i) => SanPham.fromMap(maps[i]));
  }

  Future<int> insertSanPham(SanPham sp) async {
    Database db = await database;
    return await db.insert('sanphams', sp.toMap());
  }

  Future<int> updateSanPham(SanPham sp) async {
    Database db = await database;
    return await db.update('sanphams', sp.toMap(), where: 'id = ?', whereArgs: [sp.id]);
  }

  Future<int> deleteSanPham(int id) async {
    Database db = await database;
    return await db.delete('sanphams', where: 'id = ?', whereArgs: [id]);
  }

  // --- ChiTieu Operations ---
  Future<List<ChiTieu>> getChiTieus() async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query('chi_tieus', orderBy: 'id DESC');
    
    if (maps.isEmpty) {
      await db.insert('chi_tieus', {
        'noiDung': 'Ăn trưa',
        'soTien': 50000.0,
        'ghiChu': 'Phở bò',
        'category': 'Ăn uống'
      });
      await db.insert('chi_tieus', {
        'noiDung': 'Đổ xăng',
        'soTien': 100000.0,
        'ghiChu': 'Đầy bình',
        'category': 'Di chuyển'
      });
      maps = await db.query('chi_tieus', orderBy: 'id DESC');
    }
    
    return List.generate(maps.length, (i) => ChiTieu.fromMap(maps[i]));
  }

  Future<int> insertChiTieu(ChiTieu ct) async {
    Database db = await database;
    return await db.insert('chi_tieus', ct.toMap());
  }

  Future<int> updateChiTieu(ChiTieu ct) async {
    Database db = await database;
    return await db.update('chi_tieus', ct.toMap(), where: 'id = ?', whereArgs: [ct.id]);
  }

  Future<int> deleteChiTieu(int id) async {
    Database db = await database;
    return await db.delete('chi_tieus', where: 'id = ?', whereArgs: [id]);
  }

  // --- Auth Operations ---
  Future<int> insertUser(UserAccount user) async {
    Database db = await database;
    return await db.insert('user_accounts', user.toMap());
  }

  Future<UserAccount?> getUser(String email, String password) async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query(
      'user_accounts',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    if (maps.isNotEmpty) {
      return UserAccount.fromMap(maps.first);
    }
    return null;
  }
}
