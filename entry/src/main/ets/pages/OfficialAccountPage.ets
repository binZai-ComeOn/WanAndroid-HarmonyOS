import { TitleBar } from '../widget/TitleBar'
import { router } from '@kit.ArkUI'
import { ParentColumn } from '../widget/ParentColumn'

/**
 * 公众号页
 */
@Component
export struct OfficialAccountPage {

  aboutToAppear(): void {

  }

  build() {
    ParentColumn() {
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