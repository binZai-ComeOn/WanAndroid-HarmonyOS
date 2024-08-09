import { Constants } from '../common/Constants'
import { TitleBar } from '../widget/TitleBar'
import { router } from '@kit.ArkUI'

/**
 * 分享文章页
 */
@Entry
@Component
export struct ShareArticlePage {
  build() {
    Column() {
      TitleBar({
        leftImg: $r('app.media.ic_back'),
        onLeftImgClick: () => {
          router.back()
        },
        title: $r('app.string.share_article'),
        rightImg: $r('app.media.ic_upload'),
        onRightImgClick: (event : ClickEvent) => {

        }
      })
    }.width(Constants.FULL_WIDTH).height(Constants.FULL_HEIGHT)
    .padding({ left: Constants.PAGE_MARGIN_LEFT, right: Constants.PAGE_MARGIN_RIGHT })
  }
}