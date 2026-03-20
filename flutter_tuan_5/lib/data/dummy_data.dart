import '../models/topic_model.dart';
import '../models/category_model.dart';

List<Topic> topics = [
  Topic(name: 'Đồ án'),
  Topic(name: 'KLKS'),
  Topic(name: 'Luận văn'),
  Topic(name: 'Khác'),
];

List<Category> categories = [
  Category(
    title: 'Công nghệ phần mềm',
    description: 'Phát triển các ứng dụng giải quyết các vấn đề thực tế',
  ),
  Category(
    title: 'Hệ thống thông tin',
    description: 'Xử lý thông tin trong tổ chức',
  ),
  Category(
    title: 'Mạng máy tính',
    description: 'Các vấn đề liên quan đến mạng',
  ),
  Category(title: 'An toàn thông tin', description: 'Bảo mật hệ thống'),
];
