import { Constants } from '../common/Constants'
import { TitleBar } from '../widget/TitleBar'
import { router } from '@kit.ArkUI'
import { ToastUtil } from '@pura/harmony-utils'
import ShareArticleViewModel from '../viewmodel/ShareArticleViewModel'

/**
 * 分享文章页
 */
@Entry
@Component
export struct ShareArticlePage {
  @State articleTitle: string = ""
  @State articleLink: string = ""

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
          this.uploadArticle()
        }
      })
      Text($r('app.string.share_article_title'))
        .fontSize(14)
        .padding({ bottom: 10 })
        .width(Constants.FULL_WIDTH)
      TextInput({text: this.articleTitle, placeholder: $r('app.string.share_article_title_tip_null') })
      Text($r('app.string.share_article_link'))
        .fontSize(14)
        .padding({ bottom: 10, top: 10 })
        .width(Constants.FULL_WIDTH)
      TextArea({text: this.articleLink, placeholder: $r('app.string.share_article_link_tip') })
      Text($r('app.string.share_article_tip')).fontSize(12).padding({ top: 10 })
    }.width(Constants.FULL_WIDTH).height(Constants.FULL_HEIGHT)
    .padding({ left: Constants.PAGE_MARGIN_LEFT, right: Constants.PAGE_MARGIN_RIGHT })
  }

  uploadArticle() {
    if (this.articleTitle == "") {
      ToastUtil.showLong($r('app.string.share_article_title_tip_null'))
      return
    } else if (this.articleLink == "") {
      ToastUtil.showLong($r('app.string.share_article_link_tip_null'))
      return
    } else if (!this.articleLink.startsWith("http")) {
      ToastUtil.showLong($r('app.string.the_link_must_start_with_http'))
      return
    }
    ShareArticleViewModel.addArticle(this.articleTitle, this.articleLink)
  }
}
