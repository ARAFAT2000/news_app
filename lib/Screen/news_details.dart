import 'package:flutter/material.dart';
import 'package:news_app/Model/news_model.dart';

class NewsDetails extends StatefulWidget {
  final NewsModel newsdecs;
  const NewsDetails({
    super.key,
    required this.newsdecs
  });

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
      ),
         body: Padding(
           padding: const EdgeInsets.all(12.0),
           child: ListView(
                  children: [
                    Text(widget.newsdecs.title.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: SizedBox(
                        )),
                        Expanded(
                            child:
                            Text('_${widget.newsdecs.author.toString()}', maxLines: 1,)),
                        
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ClipRRect(child: Image.network(widget.newsdecs.urlToImage.toString())),
                    SizedBox(
                      height: 20,
                    ),
                    Text(widget.newsdecs.content.toString(), style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 17
                    ),),
                    SizedBox(
                      height: 20,
                    ),
                    Text(widget.newsdecs.description.toString(),style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16
                    )),
                  ],
           ),
         ),
    );
  }
}
