import ResponseResult from '@ohos/lib_common/src/main/ets/bean/BaseResponse';
import { ApiInterface } from '@ohos/lib_common/src/main/ets/network/ApiInterface';
import { httpRequestGet } from '@ohos/lib_common/src/main/ets/network/repository/HttpRequest';
import ScoreBean from "@ohos/lib_common/src/main/ets/bean/ScoreBean"
import { ArrayList } from '@kit.ArkTS';
import BaseResponseList from '@ohos/lib_common/src/main/ets/bean/BaseResponseList';

@Observed
export class PointDetailViewModel {
  getUserScoreList(): Promise<BaseResponseList<ArrayList<ScoreBean>>> {
    return new Promise((resolve: Function) => {
      httpRequestGet<BaseResponseList<ArrayList<ScoreBean>>>(ApiInterface.coinList)
        .then((data: ResponseResult<BaseResponseList<ArrayList<ScoreBean>>>) => {
          resolve(data);
        });
    });
  }
}


let pointDetailViewModel = new PointDetailViewModel();

export default pointDetailViewModel as PointDetailViewModel;