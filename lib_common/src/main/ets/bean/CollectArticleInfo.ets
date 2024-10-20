export class  CollectArticleInfo{
  private _count: number = 0;

  public set count(value: number) {
    this._count = value;
  }

  public get count(): number {
    return this._count;
  }


}