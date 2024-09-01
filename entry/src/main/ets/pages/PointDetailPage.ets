import { Constants } from '../common/Constants'
import { ParentColumn } from '../widget/ParentColumn'
import { TitleBar } from '../widget/TitleBar'
import { router } from '@kit.ArkUI'

/**
 * 我的积分明细页
 */
@Entry
@Component
export struct PointDetailPage {

  aboutToAppear(): void {

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
      this.PointItem()
    }.width(Constants.FULL_WIDTH).height(Constants.FULL_HEIGHT)
    .padding({ left: Constants.PAGE_MARGIN_LEFT, right: Constants.PAGE_MARGIN_RIGHT })
  }

  @Builder
  PointItem() {
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