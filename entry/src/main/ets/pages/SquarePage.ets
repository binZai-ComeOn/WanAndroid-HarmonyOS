import { TitleBar } from '../widget/TitleBar'
import { router } from '@kit.ArkUI'
import { SideBarTitleBar } from '../widget/SideBarTitleBar'

/**
 * 广场页
 */
@Component
export struct SquarePage {
  build() {
    SideBarTitleBar() {
      TitleBar({
        title: $r('app.string.square'),
        rightImg: $r('app.media.ic_add'),
        iconSpace: true,
        onRightImgClick: () => {
          // router.pushUrl({ url: "pages/SearchPage" })
        }
      })
    }
  }
}