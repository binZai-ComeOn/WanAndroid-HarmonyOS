import { TitleBar } from "../widget/TitleBar"
import { router } from "@kit.ArkUI"
import { Constants } from "../common/Constants"
import { RouterParams } from "../bean/RouterParams"
import { ArticleBean } from "@ohos/lib_common/src/main/ets/bean/ArticleBean"
import { webview } from "@kit.ArkWeb"

/**
 * 文章详情页
 */
@Entry
@Component
export struct ArticleDetailsPage {
  @State data: ArticleBean = new ArticleBean()
  controller: webview.WebviewController = new webview.WebviewController();

  aboutToAppear(): void {
    this.data = this.getParams()
  }

  build() {
    Column(){
      TitleBar({
        leftImg: $r('app.media.ic_back'),
        onLeftImgClick: (event: ClickEvent) => {
          router.back()
        },
        title: this.data.title
      })
      Web({ src: this.data.link, controller: this.controller })
        .width(Constants.FULL_WIDTH)
        .height(Constants.FULL_HEIGHT)
    }.width(Constants.FULL_WIDTH).height(Constants.FULL_HEIGHT)
    .padding({ left: Constants.PAGE_MARGIN_LEFT, right: Constants.PAGE_MARGIN_RIGHT })
  }

  getParams() : ArticleBean {
    const title = router.getParams() as RouterParams<ArticleBean>
    return title.data
  }
}