import { ArticleBean } from '@ohos/lib_common/src/main/ets/bean/ArticleBean';
import BaseResponseList from '@ohos/lib_common/src/main/ets/bean/BaseResponseList';
import { ArrayList } from '@kit.ArkTS';
import ResponseResult from '@ohos/lib_common/src/main/ets/bean/BaseResponse';
import { ApiInterface } from '@ohos/lib_common/src/main/ets/network/ApiInterface';
import { httpRequestGet, httpRequestPost } from '@ohos/lib_common/src/main/ets/network/repository/HttpRequest';

@Observed
export class SearchViewModel {
  queryArticle(keyWord: string, page: number): Promise<BaseResponseList<ArrayList<ArticleBean>>> {
    return new Promise((resolve: Function) => {
      httpRequestPost<BaseResponseList<ArrayList<ArticleBean>>>(ApiInterface.articleQuery
        .replace("{page}", page.toString())+`?k=${keyWord}`, "")
        .then((data: ResponseResult<BaseResponseList<ArrayList<ArticleBean>>>) => {
          resolve(data.data);
        });
    });
  }
}

let searchViewModel = new SearchViewModel();

export default searchViewModel as SearchViewModel;