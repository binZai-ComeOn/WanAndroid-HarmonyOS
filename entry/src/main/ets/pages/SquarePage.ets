import { TitleBar } from '../widget/TitleBar'
import { ParentColumn } from '../widget/ParentColumn'
import { router } from '@kit.ArkUI'

/**
 * 广场页
 */
@Component
export struct SquarePage {

  aboutToAppear(): void {

  }

  build() {
    ParentColumn() {
      TitleBar({
        title: $r('app.string.square'),
        rightImg: $r('app.media.ic_add'),
        iconSpace: true,
        onRightImgClick: () => {
          router.pushUrl({ url: "pages/ShareArticlePage" })
        }
      })
    }
  }
}