class User {
  final String username;
  final int rank;
  final int score;
  final int balance;
  final String email;

  User(
      {required this.username,
      required this.rank,
      required this.score,
      required this.balance,
      required this.email});
}

List<User> users = [
  User(
      username: 'Mouaad Sadik',
      rank: 1,
      score: 2500,
      balance: 250,
      email: 'mouaadsadik@exmaple.com'),
  User(
      username: 'Youssef Chajia',
      rank: 2,
      score: 2450,
      balance: 150,
      email: 'youssefchajia@exmaple.com'),
  User(
      username: 'Mouaad Sadik',
      rank: 3,
      score: 2300,
      balance: 150,
      email: 'mouaadsadik@exmaple.com'),
  User(
      username: 'Youssef Chajia',
      rank: 4,
      score: 1900,
      balance: 250,
      email: 'youssefchajia@exmaple.com'),
  User(
      username: 'Mouaad Sadik',
      rank: 5,
      score: 1750,
      balance: 550,
      email: 'mouaadsadik@exmaple.com'),
  User(
      username: 'Youssef Chajia',
      rank: 6,
      score: 1600,
      balance: 250,
      email: 'youssefchajia@exmaple.com'),
  User(
      username: 'Mouaad Sadik',
      rank: 7,
      score: 1450,
      balance: 250,
      email: 'mouaadsadik@exmaple.com'),
  User(
      username: 'Youssef Chajia',
      rank: 8,
      score: 1200,
      balance: 450,
      email: 'youssefchajia@exmaple.com'),
  User(
      username: 'Mouaad Sadik',
      rank: 9,
      score: 1150,
      balance: 250,
      email: 'mouaadsadik@exmaple.com'),
  User(
      username: 'Youssef Chajia',
      rank: 10,
      score: 1000,
      balance: 350,
      email: 'youssefchajia@exmaple.com'),
];
