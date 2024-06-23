import 'package:flutter/material.dart';
import 'package:news_app/Model/news_model.dart';
import 'package:news_app/Screen/catagory_screen.dart';
import 'package:news_app/Screen/news_details.dart';
import 'package:news_app/Services/services.dart';
import 'package:news_app/uri/text_design.dart';

import '../Model/catagory_model.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   List<NewsModel> articles =[];
//   List<CatagoryModel> catagory=[];
//   bool isLoading = true;
//   getNewsApi()async{
//     NewsApi newsApi = NewsApi();
//     await newsApi.getNews();
//     articles =newsApi.newsStore;
//     setState(() {
//       isLoading = false;
//     });
//   }
//
//   @override
//   void initState() {
//     catagory=getCategories();
//     getNewsApi();
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Column(
//             children: [
//                  SizedBox(
//                    height: 15,
//                  ),
//               Container(
//                 height: 55,
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 15,
//                 ),
//                 child: ListView.builder(
//                   shrinkWrap: true,
//                 scrollDirection: Axis.horizontal,
//                   itemCount: catagory.length,
//                     itemBuilder: (context,index){
//                       return Padding(
//                         padding:EdgeInsets.only(right: 15),
//                         child: GestureDetector(
//                           onTap: (){
//                             Navigator.push(context,
//                                 MaterialPageRoute(builder: (context)=>
//                                    SelectedCategoryNews(category: catagory[index].categoryName!)
//                                 ));
//                           },
//                           child: Container(
//                             alignment: Alignment.center,
//                               padding: const EdgeInsets.all(15),
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20),
//                                   color: Colors.green),
//                               child: Center(
//                                   child: Text(catagory[index].categoryName.toString(),
//                                     style: const TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 18,
//                                       color: Colors.white,
//                                     ),
//                                   ))),
//                         ),
//                       );
//                     }),
//               ),
//               //news_home
//               ListView.builder(
//                 itemCount: articles.length,
//                   shrinkWrap: true,
//                  physics: ClampingScrollPhysics(),
//                   itemBuilder: (context,index){
//                   return Container(
//                     child: Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: GestureDetector(
//                         onTap: (){
//                           Navigator.push(context,
//                               MaterialPageRoute(builder: (context)=>
//                                   NewsDetails(newsdecs: articles[index])));
//                         },
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             ModiFyText(text: articles[index].author.toString(),
//                                 size: 11),
//                             ClipRRect(child:
//                             Image.network(articles[index].urlToImage.toString(),
//                                 height: 250,
//                                 width: 400,
//                             )),
//
//                             ModiFyText(text: articles[index].title.toString(),
//                                 size: 15),
//                             Divider(thickness: 4,),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                   }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
