export function initTabBottomData(): BottomTabModel[] {
  let tabTuDataArray: BottomTabModel[] = [];
  TabBottomData.forEach((item: BottomTabModel) => {
    tabTuDataArray.push(new BottomTabModel(item.defaultImage, item.selectImage, item.title, item.middleMode));
  })
  return tabTuDataArray;
}

export class BottomTabModel {
  selectImage: Resource;
  defaultImage: Resource;
  middleMode: boolean;
  title: Resource;
  isSelected: boolean = false;

  constructor(selectImage: Resource, defaultImage: Resource, title: Resource, middleMode = false) {
    this.selectImage = selectImage;
    this.defaultImage = defaultImage;
    this.title = title;
    this.middleMode = middleMode;
  }
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