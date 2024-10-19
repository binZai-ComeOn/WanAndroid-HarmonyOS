// 该示例主要演示EditableTitleBar设置左侧图标、主标题及自定义右侧图标区的效果。
import { EditableLeftIconType, EditableTitleBar, promptAction, router } from '@kit.ArkUI';
import { RouterParams } from '../bean/RouterParams';
import { Constants } from '../common/Constants';
import SearchViewModel from '../viewmodel/SearchViewModel';
import { TitleBar } from '../widget/TitleBar';
import { ArrayList } from '@kit.ArkTS';
import { HotKeyBean } from '@ohos/lib_common/src/main/ets/bean/HotKeyBean';

@Entry
@Component
struct SearchPage {
  @State searchText: string = ""
  @State hotSerach: HotKeyBean[] = []
  historySerach: string[] = []

  aboutToAppear(): void {
    this.historySerach.push("测试", "测试", "测试", "测试", "测试", "测试", "测试")
    SearchViewModel.getHotkey().then((data: HotKeyBean[]) => {
      this.hotSerach = data
    })
  }

  build() {
    Column() {
      TitleBar({
        leftImg: $r('app.media.ic_back'),
        onLeftImgClick: () => {
          router.back()
        },
        isEdit: true,
        onTextChange: (text: string) => {
          this.searchText = text
        },
        rightImg: $r('app.media.ic_search'),
        onRightImgClick: () => {
          this.startSearch()
        }
      })

      Text($r('app.string.search_history')).width(Constants.FULL_WIDTH).margin({ bottom: 10 })
      Flex({ wrap: FlexWrap.Wrap }) {
        ForEach(this.historySerach, (item: string) => {
          this.historyText(item)
        })
      }

      Text($r('app.string.hot_search')).width(Constants.FULL_WIDTH).margin({ top: 10, bottom: 10 })
      Flex({ wrap: FlexWrap.Wrap }) {
        ForEach(this.hotSerach, (item: HotKeyBean) => {
          this.historyText(item.name)
        })
      }
    }
    .padding({ left: Constants.PAGE_MARGIN_LEFT, right: Constants.PAGE_MARGIN_RIGHT })
    .width(Constants.FULL_WIDTH).height(Constants.FULL_HEIGHT)
  }

  startSearch() {
    router.pushUrl({ url: "pages/SearchResultPage", params: new RouterParams(this.searchText) })
  }

  @Builder
  historyText(value: string) {
    Text(value)
      .padding(10)
      .margin({
        left: 5,
        right: 5,
        top: 5,
        bottom: 5
      })
      .backgroundColor($r('app.color.theme_pink_color_primary'))
      .fontColor($r('app.color.Black'))
      .onClick(() => {
        this.searchText = value
        this.startSearch()
      })
  }
}