import { TitleBar } from '../widget/TitleBar'
import { router } from '@kit.ArkUI'
import { SideBarTitleBar } from '../widget/SideBarTitleBar'
import { TopTabBar } from '../widget/TopTabBar'
import { Constants } from '../common/Constants'

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
          content:this.content
        })
      }
    }
  }

  @Builder
  content(tabName: Resource) {
    if (this.tabs[0] == tabName) {

    } else if (this.tabs[1] == tabName) {
      Text(tabName)
    }
  }
}