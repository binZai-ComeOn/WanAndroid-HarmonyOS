/**
 * 体系页
 */
import { TitleBar } from '../widget/TitleBar'
import { router } from '@kit.ArkUI'
import { SideBarTitleBar } from '../widget/SideBarTitleBar'
import { TopTabs } from '../widget/TopTabs'
import { TopTabItem } from '../bean/TopTabItem'

@Component
export struct SystemPage {
  private tabs: TopTabItem[] = [{ name: $r('app.string.system') }, { name: $r('app.string.navigation') }];

  build() {
    SideBarTitleBar() {
      Column(){
        TitleBar({
          title: $r('app.string.system'),
          rightImg: $r('app.media.ic_search'),
          iconSpace: true,
          onRightImgClick: () => {
            router.pushUrl({ url: "pages/SearchPage" })
          }
        })
        TopTabs({
          currentIndex: 1,
          tabs: this.tabs
        })
      }
    }
  }
}