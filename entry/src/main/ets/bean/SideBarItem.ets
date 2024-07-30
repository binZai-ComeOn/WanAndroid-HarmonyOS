/**
 * SideBarItem
 */
export class SideBarItem {
  leftImage: Resource;
  text: string | Resource;
  subText: string | Resource;

  constructor(leftImage: Resource, text: string | Resource,subText: string | Resource) {
    this.leftImage = leftImage
    this.text = text
    this.subText = subText
  }
}