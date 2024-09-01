/**
 * 积分排行榜
 */
import { TitleBar } from '../widget/TitleBar'
import { router } from '@kit.ArkUI'
import { Constants } from '../common/Constants'
import { ParentColumn } from '../widget/ParentColumn'

@Entry
@Component
export struct PointsRankPage {

  aboutToAppear(): void {

  }

  build() {
    Column() {
      TitleBar({
        leftImg: $r('app.media.ic_back'),
        title: $r('app.string.points_ranking'),
        onLeftImgClick: () => {
          router.back()
        }
      })
      Row() {
        Text("1").fontSize(12).width("40").textAlign(TextAlign.Center)
        Text("果岭").fontSize(14).margin({ left: 5 })
        Blank()
        Text("151744").fontSize(12).fontColor(Color.Blue)
      }.width(Constants.FULL_WIDTH).height('40').alignItems(VerticalAlign.Center)
    }.padding({ left: Constants.PAGE_MARGIN_LEFT, right: Constants.PAGE_MARGIN_RIGHT })
    .width(Constants.FULL_WIDTH).height(Constants.FULL_HEIGHT)
  }
}