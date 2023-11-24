import 'dart:convert';

class CommentsModels {
  final String id;
  final String name;
  final String email;
  final String body;
  CommentsModels({
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  CommentsModels copyWith({
    String? id,
    String? name,
    String? email,
    String? body,
  }) {
    return CommentsModels(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'body': body,
    };
  }

  factory CommentsModels.fromMap(Map<String, dynamic> map) {
    return CommentsModels(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      body: map['body'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentsModels.fromJson(String source) =>
      CommentsModels.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CommentsModels(id: $id, name: $name, email: $email, body: $body)';
  }

  @override
  bool operator ==(covariant CommentsModels other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.email == email &&
        other.body == body;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ email.hashCode ^ body.hashCode;
  }
}
