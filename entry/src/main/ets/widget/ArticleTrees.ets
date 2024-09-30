import KnowledgeSystemBean from '@ohos/lib_common/src/main/ets/bean/KnowledgeSystemBean'
import { Constants } from '../common/Constants'

@Preview
@Component
export struct ArticleTrees {
  @Prop data: KnowledgeSystemBean[] = []

  build() {
    Column() {
      List() {
        ForEach(this.data, (bean: KnowledgeSystemBean, index?: number) => {
          ListItem() {
            RelativeContainer() {
              Text(bean.name)
                .fontSize(16)
                .margin({ top: 5})
                .fontColor($r('app.color.item_title'))
                .alignRules({
                  top: { anchor: "__container__", align: VerticalAlign.Top },
                  left: { anchor: "__container__", align: HorizontalAlign.Start },
                })
                .id("item_title")

              Row() {
                ForEach(bean.children, (item: KnowledgeSystemBean, index?: number) => {
                  Text(item.name)
                    .fontSize(10)
                    .margin({ right: 6})
                    .fontColor($r("app.color.item_desc"))
                })
              }.alignRules({
                bottom: { anchor: "list_divider", align: VerticalAlign.Top },
                left: { anchor: "__container__", align: HorizontalAlign.Start },
                right: { anchor: "ic_arrow_right", align: HorizontalAlign.End }
              })
              .id("item_desc")
              .margin({ bottom: 10, top: 10 })

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
                  top: { anchor: "ic_arrow_right", align: VerticalAlign.Bottom },
                  left: { anchor: "__container__", align: HorizontalAlign.Start },
                  right: { anchor: "__container__", align: HorizontalAlign.End }
                })
                .id("list_divider")
                .margin({ top: 10 })
            }.backgroundColor($r('app.color.viewBackground'))
          }
        }, (item: string) => item)
      }
      .scrollBar(BarState.Auto)
    }
  }
}