// 该示例主要演示EditableTitleBar设置左侧图标、主标题及自定义右侧图标区的效果。
import { EditableLeftIconType, EditableTitleBar, promptAction, router } from '@kit.ArkUI';
import { TitleBar } from '../widget/TitleBar';

@Entry
@Component
struct SearchPage {
  build() {
    Column() {
      TitleBar({
        leftImg: $r('app.media.ic_back'),
        onLeftImgClick: () => {
          router.back()
        },
        isEdit: true,
        onTextChange: (text: String) => {
          console.log("文本改变了：" + text)
        },
        rightImg: $r('app.media.ic_search'),
        onRightImgClick: () => {
          console.log("搜索")
        }
      })
    }
    .padding({ left: '20vh', right: '20vh' }).width('100%').height('100%')
  }
}