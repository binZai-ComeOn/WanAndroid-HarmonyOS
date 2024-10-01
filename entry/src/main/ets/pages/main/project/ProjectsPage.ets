import { TitleBar } from '../../../widget/TitleBar'
import { router } from '@kit.ArkUI'
import { ParentColumn } from '../../../widget/ParentColumn'
import { Constants } from '../../../common/Constants'
import HomeViewModel from '../../../viewmodel/HomeViewModel'
import BaseResponseList from '@ohos/lib_common/src/main/ets/bean/BaseResponseList'
import { ArticleBean } from '@ohos/lib_common/src/main/ets/bean/ArticleBean'

/**
 * 项目页
 */
@Preview
@Component
export struct ProjectsPage {
  @State currentIndex: number = 0;
  tabs: Resource[] = [$r('app.string.system'), $r('app.string.system'), $r('app.string.system')];


  aboutToAppear(): void {
  }

  build() {
    ParentColumn() {
      TitleBar({
        title: $r('app.string.projects'),
        rightImg: $r('app.media.ic_search'),
        iconSpace: true,
        onRightImgClick: () => {
          router.pushUrl({ url: "pages/SearchPage" })
        }
      })
      Tabs({ barPosition: BarPosition.Start }) {
        ForEach(this.tabs, (tabName: Resource, index: number) => {
          TabContent() {
            Column() {
              RelativeContainer() {
                Image("https://www.wanandroid.com/blogimgs/2f859d26-e80a-4f08-a62a-f1c8236333cf.png")
                  .width(110)
                  .backgroundColor($r('app.color.Yellow'))
                  .alignRules({
                    top: { anchor: "__container__", align: VerticalAlign.Top },
                    left: { anchor: "__container__", align: HorizontalAlign.Start },
                  })
                  .id("image")
                Text("标题").fontSize(16).fontColor($r("app.color.item_title"))
                  .margin({left: 10})
                  .alignRules({
                    top: { anchor: "image", align: VerticalAlign.Top },
                    left: { anchor: "image", align: HorizontalAlign.End },
                  }).id("item_title")
                Text("描述").fontSize(10).fontColor($r("app.color.item_desc"))
                  .margin({top: 10})
                  .alignRules({
                    top: { anchor: "item_title", align: VerticalAlign.Bottom },
                    left: { anchor: "item_title", align: HorizontalAlign.Start },
                    right: { anchor: "item_title", align: HorizontalAlign.End },
                  }).id("item_desc")
                Text("作者").fontSize(12).fontColor($r("app.color.item_author"))
                  .margin({left: 10})
                  .alignRules({
                    bottom: { anchor: "image", align: VerticalAlign.Bottom },
                    left: { anchor: "image", align: HorizontalAlign.End },
                  }).id("item_author")
                Text("2024-02-03 10:00:00").fontSize(12).fontColor($r("app.color.item_date"))
                  .alignRules({
                    bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
                    right: { anchor: "__container__", align: HorizontalAlign.End },
                  }).id("item_date")
                Row()
                  .height(0.5)
                  .width(Constants.FULL_WIDTH)
                  .backgroundColor($r("app.color.list_divider"))
                  .margin({top: 10})
                  .alignRules({
                    top: { anchor: "image", align: VerticalAlign.Bottom },
                    left: { anchor: "__container__", align: HorizontalAlign.Start },
                    right: { anchor: "__container__", align: HorizontalAlign.End },
                  })

              }.width(Constants.FULL_WIDTH)
            }.height(Constants.FULL_HEIGHT).width(Constants.FULL_WIDTH)
          }
          .tabBar(tabName)
        })
      }.barMode(BarMode.Scrollable)
    }
  }

  @Builder
  private TabBuilder(index: number) {
    Column() {
      Text(this.tabs[index])
        .margin({
          top: 12,
          bottom: 12
        })
        .fontSize(this.currentIndex === index ? '12fp' : '10fp')
        .fontWeight(this.currentIndex === index ?
        Constants.TAB_BARS_SELECT_TEXT_FONT_WEIGHT : Constants.TAB_BARS_UN_SELECT_TEXT_FONT_WEIGHT)
        .fontColor($r('app.color.tab_selected_color'))
    }
    .alignItems(HorizontalAlign.Start)
  }
}