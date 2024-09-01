/**
 * 系统设置页
 */
import { SystemSettingBean } from '../bean/SystemSettingBean'
import { Constants } from '../common/Constants'
import { TitleBar } from '../widget/TitleBar'
import { router } from '@kit.ArkUI'

@Entry
@Component
export struct SystemSettingPage {
  settingList = [new SystemSettingBean($r('app.string.clear_cache'), "120kb"),
    new SystemSettingBean($r('app.string.sourse_code'), "https://github.com/binZai-ComeOn/WanAndroid-HarmonyOS")]

  aboutToAppear(): void {

  }

  build() {
    Column() {
      TitleBar({
        leftImg: $r('app.media.ic_back'),
        onLeftImgClick: () => {
          router.back()
        },
        title: $r('app.string.setting')
      })
      ForEach(this.settingList, (item: SystemSettingBean, index: number) => {
        this.SettingItem(item)
      })
    }.padding({ left: Constants.PAGE_MARGIN_LEFT, right: Constants.PAGE_MARGIN_RIGHT })
    .width(Constants.FULL_WIDTH).height(Constants.FULL_HEIGHT)
  }

  @Builder
  SettingItem(item: SystemSettingBean) {
    Column() {
      Text(item.title)
        .fontSize(16)
        .padding({
          left: 15,
          right: 15,
          top: 10,
          bottom: 4
        })
        .width(Constants.FULL_WIDTH)
      Text(item.subTitle).fontSize(10).padding({ left: 15, bottom: 10 }).width(Constants.FULL_WIDTH)
      Divider()
    }.width(Constants.FULL_WIDTH).align(Alignment.Start)
  }
}