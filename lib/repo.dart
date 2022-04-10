
  //   try {
  //     var header = {
  //       'x-mal-client-id': '5b15facf8d87c78750e38493150b484e',
  //     };

  //     await http
  //         .get(
  //             Uri.parse(
  //                 'https://api.myanimelist.net/v2/anime/25?fields=id,title,main_picture,start_date,end_date,synopsis,mean,rank,popularity,status,genres,num_episodes,source,pictures'),
  //             headers: header)
  //         .then((http.Response response) {
  //       if (response.statusCode == 200) {
  //         setState(() {
  //           anime = AnimeDetail.fromJson(jsonDecode(response.body));
  //           isLoading = false;
  //         });
  //       }
  //     });
  //   } catch (e) {
  //     null;
  //   }
  // }
