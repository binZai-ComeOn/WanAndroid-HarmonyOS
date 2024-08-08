/**
 * 侧边栏的功能列表Item
 */
@Preview
@Component
export struct FunctionsItem {
  leftImg: Resource | null = null
  text: string | Resource = ""
  subText: string | Resource = ""
  clickEnvent?: (event: ClickEvent) => void

  build() {
    Row() {
      if (this.leftImg != null) {
        Image(this.leftImg).width(14).height(14).margin({ left: 20 })
      }
      Text(this.text).margin({ left: 20 }).fontSize(14)
      Blank()
      Text(this.subText).margin({ right: 20 }).fontSize(12)
    }.height(50).width('100%').onClick((event: ClickEvent) => {
      this.clickEnvent?.(event)
    })
  }
}