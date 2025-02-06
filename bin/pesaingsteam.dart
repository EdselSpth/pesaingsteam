import 'dart:io';

void main() {
  int pilihan = 9999;

  List<Game> gameList = [
    new console('Astro Bot', 'playstation ent', 'Console', 2025, 'Family',
        'Home Console', 'Playstation 5', 300),
    new console('Super Mario Odyssey', 'Nintendo', 'Console', 1990, 'Adventure',
        'Handheld', 'Nintendo 64', 400),
    new console('Sonic the Hedgehog', 'Sega', 'Console', 1991, 'Action', 'Home',
        'Sega Genesis', 250),
    new PC('Black Myth Wukong', 'Game Science', 'PC', 2025, 'Action',
        '4 Core CPU', '8 Gb Vram', 4, 600),
    new PC('The Last of Us Part II', 'Naughty Dog', 'PC', 2018, 'Action',
        '12 Core CPU', '16 Gb Vram', 4, 600),
    new PC('The Witcher 3: Wild Hunt', 'CD Projekt RED', 'PC', 2015,
        'Adventure', '12 Core CPU', '16 Gb Vram', 4, 600),
    new mobile('Genshin Impact', 'Hoyoverse', 'Mobile', 2021, 'Open World',
        'Multi', 0),
    new mobile('Red Dead Redemption II', 'Rockstar Games', 'Mobile', 2018,
        'Open World', 'IOS', 1000),
    new mobile('The Elder Scrolls V: Skyrim', 'Bethesda Softworks', 'Mobile',
        2015, 'Open World', 'Android', 600),
  ];

  print('-' * 205);
  print('Fried');
  print('Shiota Company');
  while (pilihan != 0) {
    try {
      print('-' * 205);
      print('MENU');
      menu();
      print('-' * 205);
      print('Masukkan Pilihan : ');
      String? input = stdin.readLineSync();
      pilihan = int.parse(input!);
      switch (pilihan) {
        case 1:
          mainHeader();
          for (Game games in gameList) {
            print(games.getLineGames());
          }
        case 2:
          headerPC();
          for (PC Computer in gameList.whereType<PC>()) {
            print(Computer.getLineGamesLibary());
          }
        case 3:
          headerConsole();
          for (console Console in gameList.whereType<console>()) {
            print(Console.getLineGamesLibary());
          }
        case 4:
          headerMobile();
          for (mobile Mobile in gameList.whereType<mobile>()) {
            print(Mobile.getLineGamesLibary());
          }
        case 5:
          gameTermurah(gameList);
        case 6:
          searchGame(gameList);
        case 0:
      }
    } catch (e) {
      print('Input Masukkan Salah!!!, Coba Lagi!!');
    }
  }
}

void gameTermurah(List<Game> games) {
  int indextermurah = 0;
  double hargatermurah = games[0].price;
  for (int i = 0; i < games.length; i++) {
    if (hargatermurah > games[i].price) {
      indextermurah = i;
      hargatermurah = games[i].price;
    }
  }
  print(
      'Game termurah berjudul ${games[indextermurah].gameTitle}, dengan harga ${games[indextermurah].price}');
}

void searchGame(List<Game> games) {
  print('Masukkan judul game yang ingin dicari : ');
  String? title = stdin.readLineSync();
  bool ketemu = false;
  for (Game game in games) {
    if (game.gameTitle == title) {
      print(game.toString());
      ketemu = true;
      break;
    }
  }
  if (!ketemu) {
    print('Judul game tidak ditemukan');
  }
}

void menu() {
  print('1. Tampilkan Seluruh Game');
  print('2. Tampilkan Seluruh Game PC');
  print('3. Tampilkan Seluruh Game Console');
  print('4. Tampilkan Seluruh Game Mobile');
  print('5. Tampilkan Game Harga Termurah');
  print('6. Cari Game Berdasarkan Nama');
  print('0. Keluar');
}

void mainHeader() {
  print('-' * 205);
  print('Game Library');
  print('-' * 205);
  print('${"Game Title".padRight(60)} | '
      '${"Developer".padRight(20)} | '
      '${"Platform".padRight(15)} | '
      '${"Genre".padRight(15)} | '
      '${"Year".padRight(7)} | '
      '${"Price".padRight(10)}');
  print('-' * 140);
}

void headerMobile() {
  print('-' * 205);
  print('Mobile Games');
  print('-' * 205);
  print('${"Game Title".padRight(60)} | '
      '${"Developer".padRight(20)} | '
      '${"Platform".padRight(15)} | '
      '${"Genre".padRight(15)} | '
      '${"Year".padRight(7)} | '
      '${"Platform".padRight(16)} | '
      '${"OS".padRight(15)} | '
      '${"Price".padRight(10)}');
  print('-' * 205);
}

void headerPC() {
  print('-' * 205);
  print('PC Games');
  print('-' * 205);
  print('${"Game Title".padRight(60)} | '
      '${"Developer".padRight(20)} | '
      '${"Platform".padRight(15)} | '
      '${"Genre".padRight(15)} | '
      '${"Year".padRight(7)} | '
      '${"Platform".padRight(15)} | '
      '${"CPU Minimum".padRight(15)} | '
      '${"GPU Minimum".padRight(15)} | '
      '${"RAM".padRight(7)} | '
      '${"Price".padRight(10)}');
  print('-' * 205);
}

void headerConsole() {
  print('-' * 205);
  print('Console Games');
  print('-' * 205);
  print('${"Game Title".padRight(60)} | '
      '${"Developer".padRight(20)} | '
      '${"Platform".padRight(15)} | '
      '${"Genre".padRight(15)} | '
      '${"Year".padRight(7)} | '
      '${"Platform".padRight(15)} | '
      '${"Type".padRight(15)} | '
      '${"Brand".padRight(15)} | '
      '${"Price".padRight(10)}');
  print('-' * 205);
}

abstract class Game {
  String _gametitle;
  String _developer;
  double _price;
  String _gamePlatform;
  String _gameGenre;
  int _releasedYear;

  Game(this._gametitle, this._developer, this._gamePlatform, this._releasedYear,
      this._gameGenre, this._price);

  String getLineGamesLibary();

  String getLineGames() {
    return '${_gametitle.padRight(60)} | ${_developer.padRight(20)} | ${_gamePlatform.padRight(15)} | ${_gameGenre.padRight(15)} | ${_releasedYear.toStringAsFixed(0).padRight(7)} | ${_price.toStringAsFixed(0)}';
  }

  String get gameTitle => _gametitle;
  String get developer => _developer;
  double get price => _price;
  String get gamePlatform => _gamePlatform;
  String get gameGenre => _gameGenre;
  int get releasedYear => _releasedYear;
}

class console extends Game {
  String _consoleType;
  String _consoleBrand;
  int discountRate = 20;

  console(
    super.gametitle,
    super.developer,
    super.gamePlatform,
    super.releasedYear,
    super.gameGenre,
    this._consoleType,
    this._consoleBrand,
    super.price,
  );

  String toString() {
    return 'Game: ${super.gameTitle}\n'
        'Developer: ${super.developer}\n'
        'Game Platform: ${super.gamePlatform}\n'
        'Genre : ${super.gameGenre}\n'
        'Released Year: $_releasedYear\n'
        'Console Type: $_consoleType\n'
        'Console Brand: $_consoleBrand\n'
        'Price: ${finalPrice()}\n';
  }

  double finalPrice() {
    return super.price - (super.price * 0.20);
  }

  @override
  String getLineGamesLibary() {
    return '${super.gameTitle.padRight(60)} | ${super.developer.padRight(20)} | ${super.gamePlatform.padRight(15)} | ${super.gameGenre.padRight(15)} | ${super.releasedYear.toStringAsFixed(0).padRight(7)} | ${super.gamePlatform.padRight(15)} | ${_consoleType.padRight(15)} | ${_consoleBrand.padRight(15)} | ${finalPrice()}';
  }
}

class PC extends Game {
  String _minumumCpu;
  String _minimumGpu;
  int _minimumRam;

  PC(
    super.gametitle,
    super.developer,
    super.gamePlatform,
    super.releasedYear,
    super.gameGenre,
    this._minumumCpu,
    this._minimumGpu,
    this._minimumRam,
    super.price,
  );

  String toString() {
    return 'Game: ${super.gameTitle}\n'
        'Developer: ${super.developer}\n'
        'Game Platform: $gamePlatform\n'
        'Genre : ${super.gameGenre}\n'
        'Released Year: $_releasedYear\n'
        'Minimum CPU: $_minumumCpu\n'
        'Minimum GPU: $_minimumGpu\n'
        'Minimum RAM: $_minimumRam\n'
        'Price: $price\n';
  }

  @override
  String getLineGamesLibary() {
    return '${super.gameTitle.padRight(60)} | ${super.developer.padRight(20)} | ${super.gamePlatform.padRight(15)} | ${super.gameGenre.padRight(15)} | ${super.releasedYear.toStringAsFixed(0).padRight(7)} | ${super.gamePlatform.padRight(15)} | ${_minumumCpu.padRight(15)} | ${_minimumGpu.padRight(15)} | ${_minimumRam.toStringAsFixed(0).padRight(7)} | ${super.price}';
  }
}

class mobile extends Game {
  String _operatingSystem;

  mobile(
    super.gametitle,
    super.developer,
    super.gamePlatform,
    super.releasedYear,
    super.gameGenre,
    this._operatingSystem,
    super.price,
  );

  String toString() {
    return 'Game: ${super.gameTitle}\n'
        'Developer: ${super.developer}\n'
        'Game Platform: ${super.gamePlatform}\n'
        'Genre : ${super.gameGenre}\n'
        'Released Year: ${super.releasedYear}\n'
        'Operating System: $_operatingSystem\n'
        'Price: ${super.price}\n';
  }

  @override
  String getLineGamesLibary() {
    return '${super.gameTitle.padRight(60)} | ${super.developer.padRight(20)} | ${super.gamePlatform.padRight(15)} | ${super.gameGenre.padRight(15)} | ${super.releasedYear.toStringAsFixed(0).padRight(7)} | ${super.gamePlatform.padRight(15)}  | ${_operatingSystem.padRight(15)} | ${super.price}';
  }
}
