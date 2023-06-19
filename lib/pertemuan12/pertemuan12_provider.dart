import 'package:flutter/material.dart';
import 'dart:convert';

class Pertemuan11Provider extends ChangeNotifier {
  initialData() async {
    setData = hp;
  }

  final hp = {
    "data": [
      {
        "model": "Samsung Galaxy",
        "img":
            "https://ss7.vzw.com/is/image/VerizonWireless/samsung-galaxy-s22-ultra-green?wid=465&hei=465&fmt=webp",
        "desc":
            "Samsung Galaxy adalah seri perangkat telepon pintar berbasis Android yang dirancang, diproduksi dan dipasarkan oleh Samsung Electronics.",
        "developer": "Samsung Electronics",
        "price": '2500000',
        "rating": '4.5'
      },
      {
        "model": "Sony Xperia Z",
        "img":
            "https://ae01.alicdn.com/kf/S6fbf8b241b9a4a98a37734052bdadd54E/Sony-Xperia-Z-Ultra-LTE-C6833-Refurbished-Asli-Dibuka-16GB-2GB-Quad-Core-8MP-6-4.jpg",
        "desc":
            "Sony Xperia Z merupakan handphone HP dengan kapasitas 2330mAh dan layar 5 yang dilengkapi dengan kamera belakang 13.1MP dengan tingkat densitas piksel sebesar 441ppi dan tampilan resolusi sebesar 1080 x 1920pixels. Dengan berat sebesar 146g, handphone HP ini memiliki prosesor Quad Core. Tanggal rilis untuk Sony Xperia Z: September 2013",
        "developer": "Sony Mobile",
        "price": '1500000',
        "rating": '4.1'
      },
    ]
  };

  final laptop = {
    "data": [
      {
        "model": "Lenovo Legion",
        "img":
            "https://static.lenovo.com/ww/campaigns/2022/legion-brand/lenovo-campaign-legion-brand-intel-feature-2-7-series-mobile.jpg",
        "desc":
            "Conquer the eSports arena with Legion 5 Pro devices, complete with the world’s first 16 WQXGA displays on gaming laptops. Slay in style with the newly designed Legion 5 devices, featuring alluring aluminum and magnesium blended bodies",
        "developer": "Lenovo",
        "price": '12500000',
        "rating": '4'
      },
      {
        "model": "HP EliteBook",
        "img":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhRf0QdcXn8DiMhkhIjZ_JnwWjbPpbctL-fg&usqp=CAU",
        "desc":
            "HP EliteBook is a line of business-oriented high-end notebooks and mobile workstations made by Hewlett-Packard (HP Inc.). The EliteBook series, which fits above the lower-end ProBook series, was introduced in August 2008 as a replacement of the HP Compaq high end line of notebooks.",
        "developer": "HP",
        "price": '2500000',
        "rating": '4.8'
      },
    ]
  };

  dynamic _data;
  dynamic get data => _data;
  set setData(val) {
    var tmp = json.encode(val);
    _data = json.decode(tmp);

    notifyListeners();
  }

  ubahList(val) {
    if (val == 'hp') {
      setData = hp;
    } else {
      setData = laptop;
    }
  }
}
