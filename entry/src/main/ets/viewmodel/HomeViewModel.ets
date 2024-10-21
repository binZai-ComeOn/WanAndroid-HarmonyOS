import LazyDataSource from '@ohos/lib_common/src/main/ets/network/LazyDataSource'
import ResponseResult from '@ohos/lib_common/src/main/ets/bean/BaseResponse';
import BaseResponseList from '@ohos/lib_common/src/main/ets/bean/BaseResponseList';
import { ApiInterface } from '@ohos/lib_common/src/main/ets/network/ApiInterface';
import { BannerBean } from '@ohos/lib_common/src/main/ets/bean/BannerBean'
import KnowledgeSystemBean from '@ohos/lib_common/src/main/ets/bean/KnowledgeSystemBean'
import { httpRequestGet } from '@ohos/lib_common/src/main/ets/network/repository/HttpRequest';
import { ArticleBean } from '@ohos/lib_common/src/main/ets/bean/ArticleBean';
import { UserInfoBean } from '@ohos/lib_common/src/main/ets/bean/UserInfoBean';
import { NavigationBean } from '@ohos/lib_common/src/main/ets/bean/NavigationBean';
import { ArrayList } from '@kit.ArkTS';
import TabBean from '@ohos/lib_common/src/main/ets/bean/TabBean'

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

  /**
   * Obtain square list data
   * @param page Parameters for pagination
   * @returns
   */
  getArticleTree(): Promise<KnowledgeSystemBean[]> {
    return new Promise((resolve: Function) => {
      httpRequestGet<KnowledgeSystemBean[]>(ApiInterface.articleTree)
        .then((data: ResponseResult<KnowledgeSystemBean[]>) => {
          resolve(data.data);
        });
    });
  }

  /**
   * Get the list of official account
   * @returns
   */
  getWxarticleChapters(): Promise<TabBean[]> {
    return new Promise((resolve: Function) => {
      httpRequestGet<TabBean[]>(ApiInterface.wxarticleChapters)
        .then((data: ResponseResult<TabBean[]>) => {
          resolve(data.data);
        });
    });
  }

  /**
   * Get the official account article list
   * @id page Parameters for pagination
   * @param page Parameters for pagination, Starting from 1
   * @returns
   */
  getWxarticleList(id: number, page: number): Promise<BaseResponseList<ArrayList<ArticleBean>>> {
    return new Promise((resolve: Function) => {
      httpRequestGet<BaseResponseList<ArrayList<ArticleBean>>>(ApiInterface.wxarticleList
        .replace("{id}", id.toString())
        .replace("{page}", page.toString()))
        .then((data: ResponseResult<BaseResponseList<ArrayList<ArticleBean>>>) => {
          resolve(data.data);
        });
    });
  }

  /**
   * Get the list of projects
   * @returns
   */
  getProjectTree(): Promise<TabBean[]> {
    return new Promise((resolve: Function) => {
      httpRequestGet<TabBean[]>(ApiInterface.projectTree)
        .then((data: ResponseResult<TabBean[]>) => {
          resolve(data.data);
        });
    });
  }

  /**
   * Get the official account article list
   * @id page Parameters for pagination
   * @param page Parameters for pagination, Starting from 1
   * @returns
   */
  getProjectList(page: number, cid: number): Promise<BaseResponseList<ArrayList<ArticleBean>>> {
    return new Promise((resolve: Function) => {
      httpRequestGet<BaseResponseList<ArrayList<ArticleBean>>>(ApiInterface.projectList
        .replace("{page}", page.toString()) + cid)
        .then((data: ResponseResult<BaseResponseList<ArrayList<ArticleBean>>>) => {
          resolve(data.data);
        });
    });
  }

  getNaviJson(): Promise<NavigationBean[]> {
    return new Promise((resolve: Function) => {
      httpRequestGet<ResponseResult<NavigationBean[]>>(ApiInterface.navi)
        .then((data: ResponseResult<ResponseResult<NavigationBean[]>>) => {
          resolve(data.data);
        });
    });
  }

  /**
   * Get a list of articles
   * @param page Parameters for pagination
   * @returns
   */
  getKnowledgeList(page: number, cid: number): Promise<BaseResponseList<ArrayList<ArticleBean>>> {
    return new Promise((resolve: Function) => {
      httpRequestGet<BaseResponseList<ArrayList<ArticleBean>>>(ApiInterface.knowledgeList
        .replace("{page}", page.toString())
        .replace("{cid}", cid.toString()))
        .then((data: ResponseResult<BaseResponseList<ArrayList<ArticleBean>>>) => {
          resolve(data.data);
        });
    });
  }

  /**
   * Get a user info
   * @returns
   */
  getUserInfo(): Promise<UserInfoBean> {
    return new Promise((resolve: Function) => {
      httpRequestGet<UserInfoBean>(ApiInterface.userinfo)
        .then((data: ResponseResult<UserInfoBean>) => {
          resolve(data.data);
        });
    });
  }

}

let homeViewModel = new HomeViewModel();

export default homeViewModel as HomeViewModel;