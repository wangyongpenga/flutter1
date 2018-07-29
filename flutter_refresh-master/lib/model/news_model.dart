
import 'dart:async';

class NewsModel{

  final String  artUrl;
  final String  articleId;
  final String  audioUrl;
  final String  bodyUrl;
  final int  contentType;
  final String  describe;
  final String  editor;
  final List  images;
  final int  menuId;
  final String  menuImage;
  final String  menuUrl;
  final int  newsType;
  final int  picNumber;
  final int  pubTime;
  final String  shareContent;
  final String  shareImgUrl;
  final String  shareTitle;
  final String  shareUrl;
  final String  sourceName;
  final String  tagcolor;
  final String  title;
  final String  videoUrl;
  final int  wxId;

  const NewsModel({this.artUrl,this.articleId,this.audioUrl,this.bodyUrl,this.contentType,this.describe,this.editor,this.images,this.menuId,this.menuImage,this.menuUrl,this.newsType,this.picNumber,this.pubTime,this.shareContent,this.shareImgUrl,this.shareTitle,this.shareUrl,this.sourceName,this.tagcolor,this.title,this.videoUrl,this.wxId});

  NewsModel.fromJson(Map<String, dynamic> json)
      :
        artUrl = json['artUrl'],
       articleId = json['articleId'],
       audioUrl = json['audioUrl'],
        bodyUrl = json['bodyUrl'],
        contentType = json['contentType'],
        describe = json['describe'],
        editor = json['editor'],
        images = json['images'],
        menuId = json['menuId'],
        menuImage = json['menuImage'],
        menuUrl = json['menuUrl'],
        newsType = json['newsType'],
        picNumber = json['picNumber'],
        pubTime = json['pubTime'],
        shareContent = json['shareContent'],
        shareImgUrl = json['shareImgUrl'],
        shareTitle = json['shareTitle'],
        shareUrl = json['shareUrl'],
        sourceName = json['sourceName'],
        tagcolor = json['tagcolor'],
        title = json['title'],
        videoUrl = json['videoUrl'],
        wxId = json['wxId']
  ;

  /*Map<String, dynamic> toJson() =>
      {
        'artUrl': artUrl,
      };*/
}

