import LazyDataSource from '@ohos/lib_common/src/main/ets/network/LazyDataSource'
import ResponseResult from '@ohos/lib_common/src/main/ets/bean/BaseResponse';
import { ApiInterface } from '@ohos/lib_common/src/main/ets/network/ApiInterface';
import { BannerBean } from '@ohos/lib_common/src/main/ets/bean/BannerBean'
import { httpRequestGet } from '@ohos/lib_common/src/main/ets/network/repository/HttpRequest';

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
  getBanners() :Promise<BannerBean[]>{
    return new Promise((resolve: Function) => {
      httpRequestGet(ApiInterface.banner).then((data: ResponseResult) => {
        resolve(data.data);
      });
    });
	}
}

let homeViewModel = new HomeViewModel();

export default homeViewModel as HomeViewModel;