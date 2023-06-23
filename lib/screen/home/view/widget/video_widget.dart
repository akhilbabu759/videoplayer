import 'package:flutter/material.dart';
import 'package:videoplayer/core/style/styles.dart';

class ViedoWidget extends StatelessWidget {
  const ViedoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              'https://165225.fs1.hubspotusercontent-na1.net/hub/165225/hubfs/Imported_Blog_Media/Thumbnail_6-300x169-1-3.jpg?width=600&height=338&name=Thumbnail_6-300x169-1-3.jpg',
              fit: BoxFit.fill,
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text('title of video can search on this device happy to sahre alhadin alba anmabanode hrgujnn',style: TextStyle(color: AppStyle().tilleColor,fontSize: 21),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,),),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Duration: 2 min',style: TextStyle(color: AppStyle().grayCol),),Text('Size: 2 mb',style: TextStyle(color: AppStyle().grayCol),)],),
            )
      ],
    );
  }
}
