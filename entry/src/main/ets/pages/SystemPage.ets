import { TitleBar } from '../widget/TitleBar'
import { router } from '@kit.ArkUI'
import { SideBarTitleBar } from '../widget/SideBarTitleBar'
import { TopTabBar } from '../widget/TopTabBar'
import { Constants } from '../common/Constants'
import { NavigationPage } from './NavigationPage'
import { ParentColumn } from '../widget/ParentColumn'

/**
 * 体系页
 */
@Preview
@Component
export struct SystemPage {
  tabs: Resource[] = Constants.SYSTEM_PAGE_TABBARS;

  aboutToAppear(): void {

  }

  build() {
    ParentColumn() {
      TitleBar({
        title: $r('app.string.system'),
        rightImg: $r('app.media.ic_search'),
        iconSpace: true,
        onRightImgClick: () => {
          router.pushUrl({ url: "pages/SearchPage" })
        }
      })
      TopTabBar({
        tabs: this.tabs,
        content: this.TopTabBarContent
      })
    }
  }

  @Builder
  TopTabBarContent(tabName: Resource) {
    if (this.tabs[0] == tabName) {
      Column() {
        Column() {
          RelativeContainer() {
            Text("测试")
              .fontSize(16)
              .margin({ top: 10, bottom: 10 })
              .fontColor($r('app.color.item_title'))
              .alignRules({
                top: { anchor: "__container__", align: VerticalAlign.Top },
                left: { anchor: "__container__", align: HorizontalAlign.Start },
                right: { anchor: "ic_arrow_right", align: HorizontalAlign.Start }
              })
              .id("item_title")

            Text("Android studio 相关").fontSize(10).fontColor($r("app.color.item_desc"))
              .margin({bottom: 10})
              .alignRules({
                bottom: { anchor: "list_divider", align: VerticalAlign.Top },
                left: { anchor: "__container__", align: HorizontalAlign.Start },
                right: { anchor: "ic_arrow_right", align: HorizontalAlign.Start }
              }).id("item_desc")

            Image($r('app.media.ic_arrow_right')).width(20).height(20).alignRules({
              top: { anchor: "__container__", align: VerticalAlign.Top },
              bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
              right: { anchor: "__container__", align: HorizontalAlign.End }
            }).id("ic_arrow_right")

            Row()
              .height(0.5)
              .width(Constants.FULL_WIDTH)
              .backgroundColor($r('app.color.list_divider'))
              .alignRules({
                top: { anchor: "__container__", align: VerticalAlign.Bottom },
                left: { anchor: "__container__", align: HorizontalAlign.Start },
                right: { anchor: "__container__", align: HorizontalAlign.End }
              })
              .id("list_divider")
          }.backgroundColor($r('app.color.viewBackground')).height(70)
        }
      }.height(Constants.FULL_HEIGHT)
    } else if (this.tabs[1] == tabName) {
      NavigationPage()
    }
  }

  @Builder
  SideTabBarContent(tabName: Resource) {
    Text("tabName")
  }
}