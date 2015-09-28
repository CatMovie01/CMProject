//
//  NetInterface.h
//  CatMovie
//
//  Created by qianfeng on 15/9/22.
//  Copyright (c) 2015年 wangli. All rights reserved.
//

#ifndef CatMovie_NetInterface_h
#define CatMovie_NetInterface_h
///时光网




//首页
//上面的横向滑动
//1.http://api.m.mtime.cn/PageSubArea/HotPlayMovies.api?locationId=290
//今日热点、电影商城 、每日佳片
//1. http://api.m.mtime.cn/PageSubArea/GetFirstPageAdvAndNews.api?subFifthParam=18159583%231%230&subFistParam=17728960%231%230&subSecondParam=17304115%231%230&subThirdParam=17304116%231%230

//购票

//电影
//正在热映
//1.http://api.m.mtime.cn/Showtime/LocationMovies.api?locationId=290

//即将上映
//1. http://api.m.mtime.cn/Movie/MovieComingNew.api?locationId=290
//
//影院
//全部
//1.http://api.m.mtime.cn/Movie/MovieComingNew.api?locationId=290
//附近
//1.http://api.m.mtime.cn/OnlineLocationCinema/OnlineCinemasByCity.api?locationId=489
//
//
//
//商城
//1.http://mall.wv.mtime.cn/Service/callback.mi/PageSubArea/MarketFirstPageNew.api?t=2015923930192574
//下面的collectionView
//
//2.http://mall.wv.mtime.cn/Service/callback.mi/ECommerce/RecommendProducts.api?t=2015923930216943&goodsIds=101229&pageIndex=1（可刷新）
//
//
//(发现类似新闻页面)
//1.新闻
////上面的图
#define FURL  @"http://api.m.mtime.cn/PageSubArea/GetRecommendationIndexInfo.api"
////下面的列表
#define NewsURL @"http://api.m.mtime.cn/News/NewsList.api?pageIndex=1"
//
//
//2.预告片
//1. http://api.m.mtime.cn/PageSubArea/GetRecommendationIndexInfo.api
//
#define PreURL @"http://api.m.mtime.cn/PageSubArea/TrailerList.api"
//
//
//排行榜
//1.http://api.m.mtime.cn/TopList/TopListFixedNew.api
//
#define RankURL @"http://api.m.mtime.cn/TopList/TopListOfAll.api?pageIndex=1"
//
//影评
//
#define FilmURL @"http://api.m.mtime.cn/MobileMovie/Review.api?needTop=false"
#define KNews   @"news"
#define KPrevue @"KPrevue"
#define KFilm   @"KFilm"
#define KRanking @"Ranking"
#endif
