import 'package:flutter/material.dart';

class Sport {
  String name;
  String title;
  String imageUrl;
  String desc;

  Sport({
    required this.name,
    required this.title,
    required this.imageUrl,
    required this.desc,
  });
}

List<Sport> sportsList = [
  Sport(
    name: 'Cricket',
    title: 'How to Become a Cricket Expert Just in Time for the Cricket World Cup',
    imageUrl: 'https://foreignpolicy.com/wp-content/uploads/2023/10/pakistan-cricket-GettyImages-1704635162.jpg?resize=1000,667&quality=90',
    desc: 'This was only the second time that cricket was played at the SEA Games. The sport made its debut at the SEA Games in 2017 in Kuala Lumpur, which included T20 and 50-over tournaments for men and a women’s T20 competition.',
  ),
  Sport(
    name: 'Shane Laflin',
    title: 'New high school girls basketball player rankings',
    imageUrl: 'https://a.espncdn.com/combiner/i?img=%2Fphoto%2F2024%2F0605%2Fr1341966_1296x729_16%2D9.jpg&w=920&h=518&scale=crop&cquality=80&location=origin&format=jpg',
    desc: 'The busy recruitment season in club basketball is here. The two spring evaluation periods have taken place, the USAB U18 and U17 Trials have concluded, and summer teams will prepare this month for the various circuit championships taking place in July.',
  ),
  Sport(
    name: 'Open de Australia 2024',
    title: 'Sinner le quita la corona de Australia a un Djokovic que pierde 2.195 días después',
    imageUrl: 'https://phantom-marca.unidadeditorial.es/99a23c03ca1250ded26f981fdb0e3468/resize/660/f/webp/assets/multimedia/imagenes/2024/01/26/17062458408084.jpg',
    desc: 'Sinner, intocable al saque, volvió a distanciarse hasta el 3-1 y manejó esa renta hasta anotarse la segunda manga. Lejos de la sesión nocturna no es el mismo. El sol le afecta, tanto a nivel físico como mental. Sufría, además, dolor en el abdominal. Le delataban los gestos en la silla de cambios.',
  ),
];