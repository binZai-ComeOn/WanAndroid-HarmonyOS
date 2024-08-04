import { TitleBar } from '../widget/TitleBar'
import { router } from '@kit.ArkUI'
import { SideBarTitleBar } from '../widget/SideBarTitleBar'
import { TopTabBar } from '../widget/TopTabBar'
import { Constants } from '../common/Constants'
import { NavigationPage } from './NavigationPage'

/**
 * 体系页
 */
@Component
export struct SystemPage {
  tabs: Resource[] = Constants.SYSTEM_PAGE_TABBARS;

  build() {
    SideBarTitleBar() {
      Column() {
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
          content:this.TopTabBarContent
        })
      }
    }
  }

  @Builder
  private TopTabBarContent(tabName: Resource) {
    if (this.tabs[0] == tabName) {
      Text(tabName)
    } else if (this.tabs[1] == tabName) {
      NavigationPage()
    }
  }

  @Builder
  SideTabBarContent(tabName: Resource) {
        Text("tabName")
  }
}