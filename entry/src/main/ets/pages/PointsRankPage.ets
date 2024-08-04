/**
 * 积分排行榜
 */
import { TitleBar } from '../widget/TitleBar'
import { router } from '@kit.ArkUI'
import { Constants } from '../common/Constants'
import { ParentColumn } from '../widget/ParentColumn'

@Entry
@Component
export struct PointsRankPage {
  build() {
    ParentColumn() {
      TitleBar({
        leftImg: $r('app.media.ic_back'),
        title: $r('app.string.points_ranking'),
        onLeftImgClick: () => {
          router.back()
        }
      })
    }
  }
}