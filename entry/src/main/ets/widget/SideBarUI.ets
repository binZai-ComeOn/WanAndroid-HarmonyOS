import { SideBarItem } from '../bean/SideBarItem'
import { Constants } from '../common/Constants'
import { FunctionsItem } from './FunctionsItem'
import { TitleBar } from './TitleBar'
import { promptAction, router } from '@kit.ArkUI'

@Preview
@Component
export struct SideBarUI {
  username: string = "去登录"
  gradle: string = "--"
  ranking: string = "--"
  @State functions: Array<SideBarItem> = Constants.SIDE_BAR_LIST

  build() {
    Column() {
      TitleBar({
        rightImg: $r('app.media.ic_ranking'),
        onRightImgClick: () => {
          router.pushUrl({ url: "pages/PointsRankPage" })
        }
      }).margin({ right: 10 })
      Column() {
        Image($r('app.media.ic_default_avatar')).border({ radius: 50 }).width(80).height(80)
        Text(this.username).fontSize(16).fontWeight(FontWeight.Bold).margin(12)
        Row() {
          Text("等级：").fontSize(12)
          Text(this.gradle).fontSize(12)
          Text("排名：").fontSize(12).margin({ left: 10 })
          Text(this.ranking).fontSize(12)
        }.margin(8)
      }.onClick(() => {
        router.pushUrl({url: "pages/LoginPage"})
      })

      ForEach(this.functions.slice(0, this.functions.length), (item: SideBarItem, index: number) => {
        FunctionsItem({
          leftImg: item.leftImage,
          text: item.text,
          subText: item.subText,
          clickEnvent: (event: ClickEvent) => {
            if (index == 0) {
              router.pushUrl({ url: "pages/PointDetailPage" })
            } else if (index == 1) {

            } else if (index == 2) {
              router.pushUrl({ url: "pages/MySharedPage" })
            } else if (index == 3) {

            } else if (index == 4) {
              router.pushUrl({ url: 'pages/SystemSettingPage' })
            } else if (index == 5) {
              showLogoutDialog()
            }
          }
        })
      })
    }.backgroundColor(Color.White).width(Constants.FULL_WIDTH).height(Constants.FULL_HEIGHT)
  }
}

function showLogoutDialog() {
  promptAction.showDialog({
    title: $r('app.string.logout'),
    message: $r('app.string.is_logout'),
    buttons: [
      {
        text: $r('app.string.cancel'),
        color: '#000000'
      },
      {
        text: $r('app.string.config'),
        color: '#000000'
      }
    ],
  })
    .then(data => {
      console.info('showDialog success, click button: ' + data.index);
    })
    .catch((err: Error) => {
      console.info('showDialog error: ' + err);
    })
}
