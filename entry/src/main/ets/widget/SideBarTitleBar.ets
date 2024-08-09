import { ParentColumn } from './ParentColumn';
import { SideBarUI } from './SideBarUI'

@ComponentV2
export struct SideBarTitleBar {
  @Local isShowSideBar: boolean = false
  @BuilderParam
  content: () => void;

  build() {
    SideBarContainer(SideBarContainerType.AUTO) {
      // 侧边栏的 ui
      SideBarUI()
      ParentColumn() {
        // 这里传入其它的ui
        this.content()
      }
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
    }).showSideBar(this.isShowSideBar)
    .onChange((event: boolean) => {
      this.isShowSideBar = event
    })
  }
}