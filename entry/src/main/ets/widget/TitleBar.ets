import { Constants } from '../common/Constants'

@Component
export struct TitleBar {
  // 标题左侧图标
  leftImg: Resource | null = null
  // 左侧图标的点击事件
  onLeftImgClick?: (event: ClickEvent) => void
  // 是否启用输入栏
  isEdit: boolean = false
  // 标题（isEdit == false 可用）
  @State title: Resource | string = ''
  // 监听输入栏文本变化（isEdit == true 可用）
  onTextChange?: (value: string) => void
  // 输入栏的初始文本（isEdit == true 可用）
  editText: string = ""
  // 右侧图标
  rightImg: Resource | null = null
  // 是否使用间距代替左侧的icon
  iconSpace: boolean = false
  // 右侧图标的点击事件
  onRightImgClick?: (event: ClickEvent) => void
  private controller: TextInputController = new TextInputController()

  build() {
    Row({ space: 10 }) {
      if (this.leftImg != null) {
        Button() {
          Image(this.leftImg).width('24').height('24')
        }.onClick((event: ClickEvent) => {
          this.onLeftImgClick?.(event)
        }).backgroundColor(Color.Transparent)
      } else if (this.iconSpace) {
        Row().width('26').height('26').margin({right: 10})
      }
      if (!this.isEdit) {
        Text(this.title).fontSize($r('app.integer.title_font_size')).fontColor($r('app.color.title_font_color'))
      } else {
        TextInput({
          text: this.editText,
          placeholder: $r('app.string.please_input_keywords'),
          controller: this.controller
        }).width('240')
          .onChange((value: string) => {
            this.onTextChange?.(value)
          })
      }
      Blank()
      if (this.rightImg != null) {
        Button() {
          Image(this.rightImg).width('24').height('24')
        }.onClick((event: ClickEvent) => {
          this.onRightImgClick?.(event)
        }).backgroundColor(Color.Transparent)
      }
    }
    .width(Constants.FULL_WIDTH)
    .padding({
      left: '0',
      right: '0',
      top: '20',
      bottom: '20'
    })
    .alignItems(VerticalAlign.Center)
  }
}