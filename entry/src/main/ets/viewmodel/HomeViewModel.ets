import LazyDataSource from '@ohos/lib_common/src/main/ets/network/LazyDataSource'
import ResponseResult from '@ohos/lib_common/src/main/ets/bean/BaseResponse';
import { ApiInterface } from '@ohos/lib_common/src/main/ets/network/ApiInterface';
import { BannerBean } from '@ohos/lib_common/src/main/ets/bean/BannerBean'
import { httpRequestGet } from '@ohos/lib_common/src/main/ets/network/repository/HttpRequest';
import { ArticleBean } from '@ohos/lib_common/src/main/ets/bean/ArticleBean';
import { ArrayList } from '@kit.ArkTS';

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
      httpRequestGet(ApiInterface.banner).then((data: ResponseResult) => {
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
      httpRequestGet(ApiInterface.articleTop).then((data: ResponseResult) => {
        resolve(data.data);
      });
    });
  }

  /**
   * Get a list of articles
   * @param page Parameters for pagination
   * @returns
   */
  getArticles(page: number): Promise<ArrayList<ArticleBean>> {
    return new Promise((resolve: Function) => {
      httpRequestGet(ApiInterface.articleList.replace("{page}", page.toString())).then((data: ResponseResult) => {
        resolve(data.data);
      });
    });
  }
}

let homeViewModel = new HomeViewModel();

export default homeViewModel as HomeViewModel;