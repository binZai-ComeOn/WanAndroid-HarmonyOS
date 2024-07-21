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

export class TabItem {
  id: number;
  name: string;

  constructor(id: number, name: string) {
    this.id = id;
    this.name = name;
  }
}