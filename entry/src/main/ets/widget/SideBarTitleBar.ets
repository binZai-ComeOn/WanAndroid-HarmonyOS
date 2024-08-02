import { SideBarUI } from './SideBarUI'

@Component
export struct SideBarTitleBar {
  @BuilderParam
  content: () => void;
  build() {
    SideBarContainer(SideBarContainerType.Embed) {
      // 侧边栏的 ui
      SideBarUI()
      Column() {
        // 这里传入其它的ui
        this.content()
      }.padding({ left: '20vh', right: '20vh' }).width('100%').height('100%')
    }.controlButton({
      left: 30,
      top: 21,
      height: 24,
      width: 24,
      icons: {
        shown: $r("app.media.ic_menu"),
        hidden: $r("app.media.ic_menu"),
        switching: $r("app.media.ic_menu")
      }
    })
  }
}