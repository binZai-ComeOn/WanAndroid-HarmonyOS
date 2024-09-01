import { router } from '@kit.ArkUI'
import { SearchParams } from '../bean/SearchParams'
import { Constants } from '../common/Constants'
import { TitleBar } from '../widget/TitleBar'

/**
 * 搜索结果页面
 */
@Entry
@Component
export struct SearchResultPage {
  title: string = ""

  aboutToAppear(): void {

  }

  build() {

    Column() {
      TitleBar({
        leftImg: $r('app.media.ic_back'),
        onLeftImgClick: () => {
          router.back()
        },
        title: this.getParams()
      })
    }.width(Constants.FULL_WIDTH).height(Constants.FULL_HEIGHT)
    .padding({ left: Constants.PAGE_MARGIN_LEFT, right: Constants.PAGE_MARGIN_RIGHT })
  }

  getParams() {
    const title = router.getParams() as SearchParams
    return title.data
  }
}