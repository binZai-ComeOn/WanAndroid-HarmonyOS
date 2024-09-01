import { Constants } from '../common/Constants'
import { TitleBar } from '../widget/TitleBar'
import { router } from '@kit.ArkUI'

/**
 * 分享文章页
 */
@Entry
@Component
export struct ShareArticlePage {

  aboutToAppear(): void {

  }

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
      Text($r('app.string.share_article_title'))
        .fontSize(14)
        .padding({ bottom: 10 })
        .width(Constants.FULL_WIDTH)
      TextInput({ placeholder: $r('app.string.share_article_title_tip_null') })
      Text($r('app.string.share_article_link'))
        .fontSize(14)
        .padding({ bottom: 10, top: 10 })
        .width(Constants.FULL_WIDTH)
      TextArea({ placeholder: $r('app.string.share_article_link_tip') })
      Text($r('app.string.share_article_tip')).fontSize(12).padding({ top: 10 })
    }.width(Constants.FULL_WIDTH).height(Constants.FULL_HEIGHT)
    .padding({ left: Constants.PAGE_MARGIN_LEFT, right: Constants.PAGE_MARGIN_RIGHT })
  }
}