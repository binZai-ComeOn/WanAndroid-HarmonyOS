@Component
export struct TitleBar {
  leftImg: Resource | null = null
  @State title: Resource | string = ''
  rightImg: Resource | null = null

  build() {
    Row({ space: 10 }) {
      if (this.leftImg != null) {
        Image(this.leftImg).width('24').height('24')
      }
      Text(this.title).fontSize($r('app.integer.title_font_size')).fontColor($r('app.color.title_font_color'))
      Blank()
      if (this.rightImg != null) {
        Image(this.rightImg).width('24').height('24').alignRules({})
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