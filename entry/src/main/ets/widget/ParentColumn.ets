import { Constants } from '../common/Constants'

@Component
export struct ParentColumn{
  @BuilderParam
  content : () => void;

  build() {
    Column(){
      this.content()
    }.padding({ left: '20vh', right: '20vh' }).width(Constants.FULL_WIDTH).height(Constants.FULL_HEIGHT)
  }
}