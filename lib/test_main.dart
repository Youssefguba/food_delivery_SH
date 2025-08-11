void main() {
  final user1 = User(name: "Youssef");
  final user2 = User(name: "Youssef");

  print(user1.hashCode);
  print(user2.hashCode);

  print(user1 == user2);

}

class User {
  final String name;

  User({required this.name});
}