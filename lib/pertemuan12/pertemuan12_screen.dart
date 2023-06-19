import 'package:flutter/material.dart';
import 'package:flutter_application_12/pertemuan12/pertemuan12_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/src/widgets/framework.dart';

class Pertemuan12Screen extends StatefulWidget {
  const Pertemuan12Screen({Key? key}) : super(key: key);

  @override
  State<Pertemuan12Screen> createState() => _Pertemuan12ScreenState();
}

class _Pertemuan12ScreenState extends State<Pertemuan12Screen> {
  @override
  void initState() {
    Future.microtask(() {
      Provider.of<Pertemuan11Provider>(context, listen: false).initialData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Pertemuan 12'),
        actions: [
          menuList(context),
        ],
      ),
      body: body(context),
    );
  }
}

body(BuildContext context) {
  final prov = Provider.of<Pertemuan11Provider>(context);
  if (prov.data == null) {
    return const CircularProgressIndicator();
  } else {
    return ListView(
      children: List.generate(prov.data['data']!.length, (index) {
        var item = prov.data['data']![index];
        return Card(
         clipBehavior: Clip.antiAlias,
         child: Column(
          children: [
            ListTile(
              leading: 
                CircleAvatar(backgroundImage: NetworkImage(item['img'])),
              title: Text(
                item['developer'],
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                item['desc'].toString().length >= 100
                  ? item['desc'].toString().substring(0, 100) + 
                    "..read more"
                  :item['desc'],
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              ButtonBar(
                alignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Rp. ${item['price'].toString()},-',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('Rating ${item['rating'].toString()}'),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {}, icon: const Icon(Icons.thumb_up)),
                  IconButton(
                    onPressed: () {}, icon: const Icon(Icons.share))
                ],
              )
            ],
          )
              ]),
        );
      }),
    );
  }
}


menuList(BuildContext context) {
  final prov = Provider.of<Pertemuan11Provider>(context);

  return PopupMenuButton(
    icon: const Icon(Icons.more_vert),
    itemBuilder: (BuildContext context) {
      return <PopupMenuEntry>[
        PopupMenuItem(
          child: ListTile(
            onTap: () => prov.ubahList('hp'),
            leading: const Icon(Icons.phone),
            title: const Text('HP'),
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem(
          child: ListTile(
            onTap: () => prov.ubahList('laptop'),
            leading: const Icon(Icons.laptop),
            title: const Text('Laptop'),
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            onTap: () {
              prov.ubahList('clear');
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Clear'),
                    content: Text('Data tidak ditemukan.'),
                    actions: [
                      TextButton(
                        child: Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            leading: Icon(Icons.clear),
            title: Text('Clear'),
          ),
        ),
      ];
    },
  );
}
