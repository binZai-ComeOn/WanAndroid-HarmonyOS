import { TitleBar } from '../widget/TitleBar'
import { ParentColumn } from '../widget/ParentColumn'
import { router } from '@kit.ArkUI'
import { Constants } from '../common/Constants'

/**
 * 广场页
 */
@Component
export struct SquarePage {
  aboutToAppear(): void {

  }

  build() {
    ParentColumn() {
      TitleBar({
        title: $r('app.string.square'),
        rightImg: $r('app.media.ic_add'),
        iconSpace: true,
        onRightImgClick: () => {
          router.pushUrl({ url: "pages/ShareArticlePage" })
        }
      })
      this.test()
    }
  }

  @Builder
  test() {
    Column() {
      Row() {
        Text("作者").fontSize(10).fontColor($r("app.color.item_author"))
        Text("2024-09-22 10:00:00").fontSize(10).fontColor($r("app.color.item_date"))
      }.width(Constants.FULL_WIDTH)
      .justifyContent(FlexAlign.SpaceBetween)

      Text("文章标题")
        .fontSize(14)
        .fontColor($r("app.color.item_title"))
        .padding({
          top: 10,
          bottom: 10
        })
        .width(Constants.FULL_WIDTH)
      Text("项目章节").fontSize(10).fontColor($r("app.color.item_chapter")).width(Constants.FULL_WIDTH)

      Blank().padding({ top: 8 })
      Blank().height(0.5).width(Constants.FULL_WIDTH).backgroundColor($r("app.color.list_divider"))
    }.padding(8)
    .width(Constants.FULL_WIDTH)
    .backgroundColor($r("app.color.White"))
  }
}