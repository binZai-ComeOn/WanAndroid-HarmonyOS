import { TitleBar } from '../widget/TitleBar'
import { router } from '@kit.ArkUI'
import { SideBarTitleBar } from '../widget/SideBarTitleBar'

/**
 * 项目页
 */
@Component
export struct ProjectsPage{
  build() {
    SideBarTitleBar(){
      TitleBar({
        title: $r('app.string.projects'),
        rightImg: $r('app.media.ic_search'),
        iconSpace: true,
        onRightImgClick: () => {
          router.pushUrl({ url: "pages/SearchPage" })
        }
      })
    }
  }
}