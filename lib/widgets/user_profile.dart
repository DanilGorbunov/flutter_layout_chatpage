import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  List<MenuRowData> firstMenuRow = [
    MenuRowData(Icons.favorite, 'Favorite'),
    MenuRowData(Icons.call, 'Call'),
    MenuRowData(Icons.computer, 'Devices'),
    MenuRowData(Icons.folder, 'Chats'),
  ];
  List<MenuRowData> secondMenuRow = [
    MenuRowData(Icons.notifications, 'Sounds'),
    MenuRowData(Icons.privacy_tip, 'Privacy'),
    MenuRowData(Icons.date_range, 'Data'),
    MenuRowData(Icons.brush, 'Design'),
    MenuRowData(Icons.language, 'Language'),
  ];
  List<MenuRowData> thirdMenuRow = [
    MenuRowData(Icons.notifications, 'Sounds'),
    MenuRowData(Icons.privacy_tip, 'Privacy'),
    MenuRowData(Icons.date_range, 'Data'),
    MenuRowData(Icons.brush, 'Design'),
    MenuRowData(Icons.language, 'Language'),
  ];
  UserProfile();

  @override
  Widget build(BuildContext context) {
    // виджет позиционирования
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Container(
        width: double.infinity,
        child: ListView(
          // по центру, но не так как надо
          // нужно обернуть его в контейнер
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            // SizedBox(height: 30), // промежуток - виджет - у него
            //только высота и ширина
            _UserInfo(),
            SizedBox(height: 30),
            _MenuWidget(menuRow: firstMenuRow),
            SizedBox(height: 30),
            _MenuWidget(menuRow: secondMenuRow),
            SizedBox(height: 30),
            _MenuWidget(menuRow: thirdMenuRow),
          ],
        ),
      ),
    );
  }
}

//создаю датакласс - обычный класс для работы с данными
// и говорю классу, что у него должны быть свойства класса
class MenuRowData {
  final IconData icon;
  final String text;

  MenuRowData(this.icon, this.text);
}

class _MenuWidgetRow extends StatelessWidget {
  final MenuRowData data;

  const _MenuWidgetRow({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Icon(data.icon),
          SizedBox(width: 15),
          Expanded(child: Text(data.text)),
          //Expanded - занимает все пространство
          Icon(Icons.chevron_right_sharp),
        ],
      ),
    );
  }
}

class _MenuWidget extends StatelessWidget {
  final List<MenuRowData> menuRow;
  const _MenuWidget({
    Key? key,
    required this.menuRow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        //передаем этот menuRow в основной класс UserProfile  _MenuWidget(menuRow: menuRow),  -
        children: menuRow
            .map((data) => _MenuWidgetRow(
                  data: data,
                ))
            .toList(),
        //рефакторинг кода - создаем class _MenuWidgetRow и две переменные
        // вызываем тут функцию _MenuWidgetRow()
      ),
    );
  }
}

class _UserInfo extends StatelessWidget {
  const _UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          width: double.infinity, // расширяет на всю ширину экрана
          child: Column(
            children: [
              SizedBox(height: 30),
              _AvatarWidget(),
              SizedBox(height: 10),
              _UserNameWidget(),
              SizedBox(height: 10),
              _UserPhoneWidget(),
              SizedBox(height: 7),
              _UserNickNameWidget()
            ],
          ),
        ),
        Positioned(
          top: 25,
          right: 25,
          child: Text(
            'Edit',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 17,
            ),
          ),
        )
      ],
    );
  }
}

class _UserNickNameWidget extends StatelessWidget {
  const _UserNickNameWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'danilgorbunov@gmail.com',
      style: TextStyle(
        color: Colors.grey,
        fontSize: 15,
        //fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _UserPhoneWidget extends StatelessWidget {
  const _UserPhoneWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '+38 093 448 65 90 ',
      style: TextStyle(
        color: Colors.grey,
        fontSize: 15,
        //fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _UserNameWidget extends StatelessWidget {
  const _UserNameWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Dan Gorbunov',
      style: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _AvatarWidget extends StatelessWidget {
  const _AvatarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Placeholder(),
    );
  }
}

// appBar: AppBar(
//       title: Text('Настройки'),
//     ),
//     body: Container(
//       color: Colors.white,
//       child: Center(
//         child: Text('ok'),
//       ),
//     ),
//   );

// return MaterialApp(  главный виджет
//     home: Text('ddd');
//   );
// }
