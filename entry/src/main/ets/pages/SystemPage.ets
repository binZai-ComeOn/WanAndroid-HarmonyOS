import { TitleBar } from '../widget/TitleBar'
import { router } from '@kit.ArkUI'
import { SideBarTitleBar } from '../widget/SideBarTitleBar'
import { TopTabBar } from '../widget/TopTabBar'
import { Constants } from '../common/Constants'
import { SideTabBar } from '../widget/SideTabBar'

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
      SideTabBar({
        tabs: [$r('app.string.user_login'),$r('app.string.theme')],
        content: this.SideTabBarContent
      })
    } else if (this.tabs[1] == tabName) {
      Text(tabName)
    }
  }

  @Builder
  private SideTabBarContent(tabName: Resource) {
    Column(){
      Text("测试")
    }.width(Constants.FULL_WIDTH).height(Constants.DIVIDER_HEIGHT).backgroundColor(Color.Gray)
  };
}