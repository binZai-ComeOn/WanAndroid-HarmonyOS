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
      this.SystemItem()
      // RelativeContainer() {
      //   Text("测试").fontSize(16).padding({ left:10,top: 10 }).fontColor($r('app.color.item_title'))
      // }
      // .backgroundColor($r('app.color.viewBackground'))
    } else if (this.tabs[1] == tabName) {
      //NavigationPage()
    }
  }

  @Builder
  public SystemItem() {
    RelativeContainer() {
      Text("测试").fontSize(16).padding({ left:10,top: 10 }).fontColor($r('app.color.item_title'))
    }
    .backgroundColor($r('app.color.viewBackground'))
  }

  @Builder
  SideTabBarContent(tabName: Resource) {
    Text("tabName")
  }
}