@Component
export struct TitleBar {
  // 标题左侧图标
  leftImg: Resource | null = null
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
  onRightImgClick?: () => void
  private controller: TextInputController = new TextInputController()

  build() {
    Row({ space: 10 }) {
      if (this.leftImg != null) {
        Image(this.leftImg).width('24').height('24')
      } else if (this.iconSpace) {
        Row().width('26').height('26')
      }
      if (!this.isEdit) {
        Text(this.title).fontSize($r('app.integer.title_font_size')).fontColor($r('app.color.title_font_color'))
      } else {
        TextInput({
          text: this.editText,
          placeholder: $r('app.string.please_input_keywords'),
          controller: this.controller
        })
          .onChange((value: string) => {
            this.onTextChange?.(value)
          })
      }
      Blank()
      if (this.rightImg != null) {
        Image(this.rightImg).width('24').height('24').onClick(() => {
          this.onRightImgClick?.()
        })
      }
    }
    .width('100%')
    .padding({
      left: '10',
      right: '10',
      top: '20',
      bottom: '20'
    })
    .alignItems(VerticalAlign.Center)
  }
}