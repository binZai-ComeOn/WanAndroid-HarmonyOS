import { TitleBar } from '../widget/TitleBar'
import { router } from '@kit.ArkUI'
import { ParentColumn } from '../widget/ParentColumn'

/**
 * 项目页
 */
@Component
export struct ProjectsPage{

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
    }
  }
}