import BaseResponseList from "@ohos/lib_common/src/main/ets/bean/BaseResponseList";
import { ArrayList } from "@kit.ArkTS";
import { ArticleBean } from "@ohos/lib_common/src/main/ets/bean/ArticleBean";
import { ApiInterface } from "@ohos/lib_common/src/main/ets/network/ApiInterface";
import { httpRequestGet } from "@ohos/lib_common/src/main/ets/network/repository/HttpRequest";
import ResponseResult from "@ohos/lib_common/src/main/ets/bean/BaseResponse";

@Observed
export class MyCollectViewModel {
  /**
   * Get a list of collected articles
   * @param page Parameters for pagination
   * @returns
   */
  getCollectedArticles(page: number): Promise<BaseResponseList<ArrayList<ArticleBean>>> {
    return new Promise((resolve: Function) => {
      httpRequestGet<BaseResponseList<ArrayList<ArticleBean>>>(ApiInterface.collectList.replace("{page}",
        page.toString()))
        .then((data: ResponseResult<BaseResponseList<ArrayList<ArticleBean>>>) => {
          resolve(data.data);
        });
    });
  }
}

let myCollectViewModel = new MyCollectViewModel();

export default myCollectViewModel as MyCollectViewModel;