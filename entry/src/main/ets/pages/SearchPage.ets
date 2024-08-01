// 该示例主要演示EditableTitleBar设置左侧图标、主标题及自定义右侧图标区的效果。
import { EditableLeftIconType, EditableTitleBar, promptAction } from '@kit.ArkUI';
import { TitleBar } from '../widget/TitleBar';

@Entry
@Component
struct SearchPage {
  build() {
    Column() {
      TitleBar()
    }.width('100%').height('100%')
  }
}