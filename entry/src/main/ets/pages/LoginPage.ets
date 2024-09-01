import { Constants } from '../common/Constants'
import { TitleBar } from '../widget/TitleBar'
import { router } from '@kit.ArkUI'

/**
 * 登录页面
 */
@Entry
@Component
export struct LoginPage {
  @State isLogin: boolean = true
  @State title: Resource = $r('app.string.login')

  aboutToAppear(): void {

  }

  build() {
    Column() {
      if (this.isLogin) {
        this.Login()
      } else {
        this.Register()
      }
    }
    .padding({ left: Constants.PAGE_MARGIN_LEFT, right: Constants.PAGE_MARGIN_RIGHT })
    .width(Constants.FULL_WIDTH).height(Constants.FULL_HEIGHT)
  }

  @Builder
  Register() {
    TitleBar({
      leftImg: $r('app.media.ic_back'),
      onLeftImgClick: () => {
        router.back()
      },
      title: $r('app.string.register')
    })
    Text($r('app.string.register'))
      .fontSize(18)
      .width(Constants.FULL_WIDTH)
    Text($r('app.string.register_tip'))
      .padding({ top: 6, bottom: 30 })
      .width(Constants.FULL_WIDTH)
      .fontSize(14)
    TextInput({ placeholder: $r('app.string.please_input_account') })
    Blank().height(6)
    TextInput({ placeholder: $r('app.string.please_input_password') }).type(InputType.Password)
    Blank().height(6)
    TextInput({ placeholder: $r('app.string.enter_password_again') }).type(InputType.Password)
    Blank().height(24)
    Button($r('app.string.register'), { type: ButtonType.Normal, stateEffect: true })
      .borderRadius(8)
      .width(Constants.FULL_WIDTH)
      .onClick(() => {
        console.log('ButtonType.Normal')
      })
    Blank().height(6)
    Text($r('app.string.have_account'))
      .width(Constants.FULL_WIDTH)
      .fontSize(16)
      .textAlign(TextAlign.End)
      .align(Alignment.End)
      .onClick(() => {
        this.isLogin = true
      })
  }

  @Builder
  Login() {
    TitleBar({
      leftImg: $r('app.media.ic_back'),
      onLeftImgClick: () => {
        router.back()
      },
      title: $r('app.string.login')
    })
    Text($r('app.string.user_login'))
      .fontSize(18)
      .width(Constants.FULL_WIDTH)
    Text($r('app.string.login_tip'))
      .padding({ top: 6, bottom: 30 })
      .width(Constants.FULL_WIDTH)
      .fontSize(14)
    TextInput({ placeholder: $r('app.string.please_input_account') })
    Blank().height(6)
    TextInput({ placeholder: $r('app.string.please_input_password') }).type(InputType.Password)
    Blank().height(24)
    Button($r('app.string.login'), { type: ButtonType.Normal, stateEffect: true })
      .borderRadius(8)
      .width(Constants.FULL_WIDTH)
      .onClick(() => {
        console.log('ButtonType.Normal')
      })
    Blank().height(6)
    Text($r('app.string.no_account'))
      .width(Constants.FULL_WIDTH)
      .fontSize(16)
      .textAlign(TextAlign.End)
      .align(Alignment.End)
      .onClick(() => {
        this.isLogin = false
      })
  }
}
