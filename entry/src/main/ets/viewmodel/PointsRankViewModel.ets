import BaseResponseList from '@ohos/lib_common/src/main/ets/bean/BaseResponseList';
import { ApiInterface } from '@ohos/lib_common/src/main/ets/network/ApiInterface';
import { httpRequestGet } from '@ohos/lib_common/src/main/ets/network/repository/HttpRequest';
import { ArrayList } from '@kit.ArkTS';
import ResponseResult from '@ohos/lib_common/src/main/ets/bean/BaseResponse';
import RankingListBean from '@ohos/lib_common/src/main/ets/bean/RankingListBean';

@Observed
export class PointsRankViewModel {
  getRankingListBean(): Promise<BaseResponseList<ArrayList<RankingListBean>>> {
    return new Promise((resolve: Function) => {
      httpRequestGet<BaseResponseList<ArrayList<RankingListBean>>>(ApiInterface.banner)
        .then((data: ResponseResult<BaseResponseList<ArrayList<RankingListBean>>>) => {
          resolve(data.data);
        });
    });
  }
}

let pointsRankViewModel = new PointsRankViewModel();

export default pointsRankViewModel as PointsRankViewModel;