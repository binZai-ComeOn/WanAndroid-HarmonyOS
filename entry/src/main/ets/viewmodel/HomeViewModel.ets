import LazyDataSource from '@ohos/lib_common/src/main/ets/network/LazyDataSource'
import ResponseResult from '@ohos/lib_common/src/main/ets/bean/BaseResponse';
import BaseResponseList from '@ohos/lib_common/src/main/ets/bean/BaseResponseList';
import { ApiInterface } from '@ohos/lib_common/src/main/ets/network/ApiInterface';
import { BannerBean } from '@ohos/lib_common/src/main/ets/bean/BannerBean'
import { httpRequestGet } from '@ohos/lib_common/src/main/ets/network/repository/HttpRequest';
import { ArticleBean } from '@ohos/lib_common/src/main/ets/bean/ArticleBean';
import { ArrayList } from '@kit.ArkTS';
import TimeUtil from '@ohos/lib_common/src/main/ets/utils/TimeUtil';
import { Tag } from '@ohos/lib_common/src/main/ets/bean/Tag';

@Observed
export class HomeViewModel {
  /**
   * Homepage carousel image
   */
  banners: LazyDataSource<BannerBean> = new LazyDataSource();

  /**
   * Get banner
   * @returns
   */
  getBanners(): Promise<BannerBean[]> {
    return new Promise((resolve: Function) => {
      httpRequestGet<BannerBean[]>(ApiInterface.banner).then((data: ResponseResult<BannerBean[]>) => {
        resolve(data.data);
      });
    });
  }

  /**
   * Get Top Articles
   * @returns
   */
  getArticleTop(): Promise<ArrayList<ArticleBean>> {
    return new Promise((resolve: Function) => {
      httpRequestGet<BaseResponseList<ArrayList<ArticleBean>>>(ApiInterface.articleTop)
        .then((data: ResponseResult<BaseResponseList<ArrayList<ArticleBean>>>) => {
        resolve(data.data);
      });
    });
  }

  /**
   * Get a list of articles
   * @param page Parameters for pagination
   * @returns
   */
  getArticles(page: number): Promise<BaseResponseList<ArrayList<ArticleBean>>> {
    return new Promise((resolve: Function) => {
      httpRequestGet<BaseResponseList<ArrayList<ArticleBean>>>(ApiInterface.articleList.replace("{page}",
        page.toString()))
        .then((data: ResponseResult<BaseResponseList<ArrayList<ArticleBean>>>) => {
          resolve(data.data);
        });
    });
  }

  /**
   * Obtain square list data
   * @param page Parameters for pagination
   * @returns
   */
  getSquareList(page: number): Promise<BaseResponseList<ArrayList<ArticleBean>>> {
    return new Promise((resolve: Function) => {
      httpRequestGet<BaseResponseList<ArrayList<ArticleBean>>>(ApiInterface.userArticleList.replace("{page}",
        page.toString()))
        .then((data: ResponseResult<BaseResponseList<ArrayList<ArticleBean>>>) => {
          resolve(data.data);
        });
    });
  }




  handleData(datas: ArrayList<ArticleBean>) {
    let list: ArticleBean[] = []
    datas.forEach((item: ArticleBean) => {
      if (item.author == "") {
        item.author = item.shareUser
      }
      item.releaseTime = TimeUtil.millisecond2Time(item.publishTime)
      if (item.tags.length > 0) {
        item.tags.forEach((tag: Tag, index: number) => {
          item.tag = tag.name
          if (item.tags.length != index) {
            item.tag += " / "
          }
        })
      } else {
        if (item.superChapterName != null && item.superChapterName != "" && item.chapterName != null &&
          item.chapterName != "") {
          item.tag = item.superChapterName + " / " + item.chapterName
        } else if (item.superChapterName != null && item.superChapterName != "") {
          item.tag = item.superChapterName
        } else if (item.chapterName != null && item.chapterName != "") {
          item.tag = item.chapterName
        }
      }
      list.push(item)
    })
    return list
  }
}

let homeViewModel = new HomeViewModel();

export default homeViewModel as HomeViewModel;