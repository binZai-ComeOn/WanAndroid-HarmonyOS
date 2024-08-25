export class BannerBean {
  desc: String;
  id: number;
  imagePath: string;
  isVisible: number;
  order: number;
  title: String;
  type: number;
  url: String;

  constructor(desc: String, id: number, imagePath: string, isVisible: number, order: number, title: String,
    type: number, url: String) {
    this.desc = desc;
    this.id = id;
    this.imagePath = imagePath;
    this.isVisible = isVisible;
    this.order = order;
    this.title = title;
    this.type = type;
    this.url = url;
  }
}