import { ArticleBean } from '@ohos/lib_common/src/main/ets/bean/ArticleBean';
import { HotKeyBean } from '@ohos/lib_common/src/main/ets/bean/HotKeyBean';
import BaseResponseList from '@ohos/lib_common/src/main/ets/bean/BaseResponseList';
import { ArrayList } from '@kit.ArkTS';
import ResponseResult from '@ohos/lib_common/src/main/ets/bean/BaseResponse';
import { ApiInterface } from '@ohos/lib_common/src/main/ets/network/ApiInterface';
import { httpRequestGet, httpRequestPost } from '@ohos/lib_common/src/main/ets/network/repository/HttpRequest';
import { JSONUtil } from '@pura/harmony-utils';
import BaseResponse from '@ohos/lib_common/src/main/ets/bean/BaseResponse';

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

  getHotkey(): Promise<HotKeyBean[]> {
    return new Promise((resolve: Function) => {
      httpRequestGet<HotKeyBean[]>(ApiInterface.hotkey)
        .then((data: BaseResponse<HotKeyBean[]>) => {
          resolve(data.data);
        });
    });
  }
}

let searchViewModel = new SearchViewModel();

export default searchViewModel as SearchViewModel;