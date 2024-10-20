import { Constants } from '../common/Constants'
import { TitleBar } from '../widget/TitleBar'
import { router } from '@kit.ArkUI'
import { AppCache } from '@ohos/lib_common/src/main/ets/utils/AppCache'
import { ToastUtil } from '@pura/harmony-utils'

/**
 * 我的分享页
 */
@Entry
@Component
export struct MySharedPage {

  aboutToAppear(): void {

  }

  build() {
    Column() {
      TitleBar({
        leftImg: $r('app.media.ic_back'),
        onLeftImgClick: () => {
          router.back()
        },
        title: $r('app.string.my_share'),
        rightImg: $r('app.media.ic_add'),
        onRightImgClick: (event: ClickEvent) => {
          if (AppCache.get().getUserPublicName() == "") {
            ToastUtil.showLong($r('app.string.please_log_in_and_try_again'))
            return
          }
          router.pushUrl({ url: "pages/ShareArticlePage" })
        }
      })
    }.width(Constants.FULL_WIDTH).height(Constants.FULL_HEIGHT)
    .padding({ left: Constants.PAGE_MARGIN_LEFT, right: Constants.PAGE_MARGIN_RIGHT })
  }
}