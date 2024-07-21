import { BottomTabModel, TabItem } from './TabItem'

export function initTabBottomData(): BottomTabModel[] {
  let tabTuDataArray: BottomTabModel[] = [];
  TabBottomData.forEach((item: BottomTabModel) => {
    tabTuDataArray.push(new BottomTabModel(item.defaultImage, item.selectImage, item.title, item.middleMode));
  })
  return tabTuDataArray;
}

/**
 * 首页底部栏Item数据
 */
const TabBottomData: BottomTabModel[] = [
  new BottomTabModel($r("app.media.ic_tab_home"), $r('app.media.ic_tab_home_action'), $r('app.string.home'), true),
  new BottomTabModel($r('app.media.ic_tab_square'), $r('app.media.ic_tab_square_action'), $r('app.string.square')),
  new BottomTabModel($r('app.media.ic_tab_system'), $r('app.media.ic_tab_system_action'), $r('app.string.system')),
  new BottomTabModel($r('app.media.ic_tab_official_account'), $r('app.media.ic_tab_official_account_action'),
    $r('app.string.official_account')),
  new BottomTabModel($r('app.media.ic_tab_projects'), $r('app.media.ic_tab_projects_action'), $r('app.string.projects'))
]

const TabItemData: TabItem[] = [
  new TabItem(0, '关注'),
  new TabItem(1, '推荐'),
  new TabItem(2, '图书'),
  new TabItem(3, '小说'),
  new TabItem(4, '漫画'),
  new TabItem(5, '听书'),
  new TabItem(6, '交友'),
  new TabItem(7, '直播'),
  new TabItem(8, '视频')
];