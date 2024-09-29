import KnowledgeSystemBean from '@ohos/lib_common/src/main/ets/bean/KnowledgeSystemBean'
import { Constants } from '../common/Constants'

@Preview
@Component
export struct ArticleTrees {
  item: KnowledgeSystemBean = new KnowledgeSystemBean()

  build() {
    Column() {
      RelativeContainer() {
        Text(this.item.name)
          .fontSize(16)
          .margin({ top: 10, bottom: 10 })
          .fontColor($r('app.color.item_title'))
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Top },
            left: { anchor: "__container__", align: HorizontalAlign.Start },
            right: { anchor: "ic_arrow_right", align: HorizontalAlign.Start }
          })
          .id("item_title")


        List({ space: 0, initialIndex: 0 }) {
          ForEach(this.item.children, (item: KnowledgeSystemBean, index?: number) => {
            ListItem() {
              Text(item.name)
                .fontSize(10)
                .fontColor($r("app.color.item_desc"))
                .margin({ bottom: 10 })
                .alignRules({
                  bottom: { anchor: "list_divider", align: VerticalAlign.Top },
                  left: { anchor: "__container__", align: HorizontalAlign.Start },
                  right: { anchor: "ic_arrow_right", align: HorizontalAlign.Start }
                })
                .id("item_desc")

            }
          }, (item: string) => item)
        }
        .scrollBar(BarState.Auto)

        Image($r('app.media.ic_arrow_right')).width(20).height(20).alignRules({
          top: { anchor: "__container__", align: VerticalAlign.Top },
          bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
          right: { anchor: "__container__", align: HorizontalAlign.End }
        }).id("ic_arrow_right")

        Row()
          .height(0.5)
          .width(Constants.FULL_WIDTH)
          .backgroundColor($r('app.color.list_divider'))
          .alignRules({
            top: { anchor: "__container__", align: VerticalAlign.Bottom },
            left: { anchor: "__container__", align: HorizontalAlign.Start },
            right: { anchor: "__container__", align: HorizontalAlign.End }
          })
          .id("list_divider")
      }.backgroundColor($r('app.color.viewBackground')).height(70)
    }
  }
}