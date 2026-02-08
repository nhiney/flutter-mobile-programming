import 'member.dart';

class Group {
  final String code;
  final String name;
  final int totalMembers;
  final List<Member> members;

  Group({
    required this.code,
    required this.name,
    required this.totalMembers,
    required this.members,
  });
}
