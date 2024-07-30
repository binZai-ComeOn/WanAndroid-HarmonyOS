import { SideBarItem } from '../bean/SideBarItem'
import { Constants } from '../common/Constants'
import { FunctionsItem } from './FunctionsItem'
import { TitleBar } from './TitleBar'

@Preview
@Component
export struct SideBarUI {
  username: string = "去登录"
  gradle: string = "--"
  ranking: string = "--"
  @State functions : Array<SideBarItem> = Constants.SIDE_BAR_LIST

  build() {
    Column() {
      TitleBar({
        rightImg: $r('app.media.ic_ranking')
      }).margin({ right: 10 })
      Image($r('app.media.ic_default_avatar')).border({ radius: 50 }).width(80).height(80)
      Text(this.username).fontSize(16).fontWeight(FontWeight.Bold).margin(12)
      Row() {
        Text("等级：").fontSize(12)
        Text(this.gradle).fontSize(12)
        Text("排名：").fontSize(12).margin({ left: 10 })
        Text(this.ranking).fontSize(12)
      }.margin(8)

      ForEach(this.functions.slice(0,this.functions.length),(item : SideBarItem) => {
        FunctionsItem({ leftImg: item.leftImage, text: item.text, subText: item.subText })
      })
    }.backgroundColor(Color.White).width('100%').height('100%')
  }
}