import { Constants } from '../common/Constants'
import { ParentColumn } from '../widget/ParentColumn'
import { TitleBar } from '../widget/TitleBar'
import { router } from '@kit.ArkUI'
import PointDetailViewModel from '../viewmodel/PointDetailViewModel'
import { ArrayList } from '@kit.ArkTS'
import ScoreBean from '@ohos/lib_common/src/main/ets/bean/ScoreBean'
import BaseResponseList from '@ohos/lib_common/src/main/ets/bean/BaseResponseList'

/**
 * 我的积分明细页
 */
@Entry
@Component
export struct PointDetailPage {
  @State scores: ScoreBean[] = []

  aboutToAppear(): void {
    PointDetailViewModel.getUserScoreList().then((data: BaseResponseList<ArrayList<ScoreBean>>) => {
      this.scores = data.datas.convertToArray()
    })
  }

  build() {
    Column() {
      TitleBar({
        leftImg: $r('app.media.ic_back'),
        onLeftImgClick: (event: ClickEvent) => {
          router.back()
        },
        title: $r('app.string.points_details'),
        rightImg: $r('app.media.ic_question_mark'),
        onRightImgClick: (event: ClickEvent) => {

        }
      })
      List() {
        ForEach(this.scores, (item: ScoreBean) => {
          ListItem() {
            this.PointItem(item)
          }
        })
      }
    }.width(Constants.FULL_WIDTH).height(Constants.FULL_HEIGHT)
    .padding({ left: Constants.PAGE_MARGIN_LEFT, right: Constants.PAGE_MARGIN_RIGHT })
  }

  @Builder
  PointItem(bean: ScoreBean) {
    Column({ space: 10 }) {
      Row() {
        Column({ space: 5 }) {
          Text("签到")
            .fontSize(12)
            .align(Alignment.Start)
          Text("2024-08-05 19:45:22 签到，积分：14 + 11")
            .fontSize(10)
            .fontColor(Color.Gray)
        }.alignItems(HorizontalAlign.Start)

        Blank()
        Text("+26").fontSize(10)
      }.width(Constants.FULL_WIDTH)

      Divider()
    }
  }
}