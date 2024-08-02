import { TitleBar } from '../widget/TitleBar'
import { router } from '@kit.ArkUI'
import { SideBarTitleBar } from '../widget/SideBarTitleBar'

/**
 * 公众号页
 */
@Component
export struct OfficialAccountPage {
  build() {
    SideBarTitleBar() {
      TitleBar({
        title: $r('app.string.official_account'),
        rightImg: $r('app.media.ic_search'),
        iconSpace: true,
        onRightImgClick: () => {
          router.pushUrl({ url: "pages/SearchPage" })
        }
      })
    }
  }
}