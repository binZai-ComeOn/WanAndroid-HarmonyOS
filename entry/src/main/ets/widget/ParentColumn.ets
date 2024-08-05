import { Constants } from '../common/Constants'

@Component
export struct ParentColumn {
  @BuilderParam
  content: () => void;

  build() {
    Column() {
      this.content()
    }.padding({ left: Constants.PAGE_MARGIN_LEFT, right: Constants.PAGE_MARGIN_RIGHT })
    .width(Constants.FULL_WIDTH).height(Constants.FULL_HEIGHT)
  }
}