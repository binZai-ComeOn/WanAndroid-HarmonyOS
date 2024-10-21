import { ArticleBean } from '@ohos/lib_common/src/main/ets/bean/ArticleBean'
import { Constants } from '../common/Constants'

@Component
export struct ArticleItem {
  item: ArticleBean = new ArticleBean()
  clickEnvent?: (event: ClickEvent) => void

  build() {
    Column() {
      Row() {
        Row() {
          if (this.item.top == "1") {
            Text($r('app.string.topping'))
              .fontSize(10)
              .padding({
                left: 4,
                right: 4,
                top: 2,
                bottom: 2
              })
              .fontColor($r('app.color.Red'))
              .border({ width: 0.5, radius: 2, color: $r('app.color.Red') })
            Blank().width(5)
          }
          if (this.item.fresh) {
            Text($r('app.string.xin'))
              .fontSize(10)
              .padding({
                left: 4,
                right: 4,
                top: 2,
                bottom: 2
              })
              .fontColor($r('app.color.Red'))
              .border({ width: 0.5, radius: 2, color: $r('app.color.Red') })
            Blank().width(5)
          }
          if (this.item.tags != undefined && this.item.tags.length > 0) {
            Text(this.item.tags[0].name)
              .border({ width: 0.5, radius: 2, color: $r('app.color.colorAccent') })
              .padding({
                left: 4,
                right: 4,
                top: 2,
                bottom: 2
              })
              .fontColor($r('app.color.colorAccent'))
              .fontSize(10)
            Blank().width(5)
          }
          Text(this.item.author).fontSize(12).fontColor($r('app.color.item_author'))
        }.layoutWeight(1)

        Text(this.item.releaseTime)
          .layoutWeight(1)
          .textAlign(TextAlign.End)
          .fontColor($r('app.color.item_date'))
          .fontSize(12)
      }

      Text(this.item.title)
        .width(Constants.FULL_WIDTH)
        .fontSize(14)
        .padding({ top: 8 })
        .textAlign(TextAlign.Start)
        .fontColor($r('app.color.item_title'))
      Text(this.item.tag)
        .width(Constants.FULL_WIDTH)
        .textAlign(TextAlign.Start)
        .fontSize(10)
        .padding({ top: 8 })
        .fontColor($r('app.color.item_chapter'))
      Blank().height(8)
      Row().width(Constants.FULL_WIDTH).height(0.5).backgroundColor($r('app.color.list_divider'))
    }.padding({ top: 8, bottom: 8 }).width(Constants.FULL_WIDTH).onClick((event: ClickEvent) => {
      this.clickEnvent?.(event)
    })
  }
}