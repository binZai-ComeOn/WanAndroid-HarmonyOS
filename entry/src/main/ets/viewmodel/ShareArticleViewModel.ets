import { httpRequestPost } from "@ohos/lib_common/src/main/ets/network/repository/HttpRequest";
import { ApiInterface } from "@ohos/lib_common/src/main/ets/network/ApiInterface";
import ResponseResult from "@ohos/lib_common/src/main/ets/bean/BaseResponse";

@Observed
export class ShareArticleViewModel {
  addArticle(title: string, link: string): Promise<string> {
    return new Promise((resolve: Function) => {
      httpRequestPost<string>(ApiInterface.addArticle
        .replace("{title}", title)
        .replace("{link}", link))
        .then((data: ResponseResult<string>) => {
          resolve(data.data);
        });
    });
  }
}

let shareArticleViewModel = new ShareArticleViewModel();

export default shareArticleViewModel as ShareArticleViewModel;