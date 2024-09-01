// 该示例主要演示EditableTitleBar设置左侧图标、主标题及自定义右侧图标区的效果。
import { EditableLeftIconType, EditableTitleBar, promptAction, router } from '@kit.ArkUI';
import { SearchParams } from '../bean/SearchParams';
import { Constants } from '../common/Constants';
import { TitleBar } from '../widget/TitleBar';

@Entry
@Component
struct SearchPage {
  searchText: string = ""

  aboutToAppear(): void {

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
          router.pushUrl({ url: "pages/SearchResultPage", params: new SearchParams(this.searchText) })
        }
      })
      Text($r('app.string.hot_search')).width(Constants.FULL_WIDTH)
      Text($r('app.string.search_history')).width(Constants.FULL_WIDTH)
    }
    .padding({ left: Constants.PAGE_MARGIN_LEFT, right: Constants.PAGE_MARGIN_RIGHT })
    .width(Constants.FULL_WIDTH).height(Constants.FULL_HEIGHT)
  }

  @Builder
  SearchKeyWord(text: string) {
    Text(text)
  }
}