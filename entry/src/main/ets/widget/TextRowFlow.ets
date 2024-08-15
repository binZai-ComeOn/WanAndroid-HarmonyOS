@Preview
@Component
export struct TextRowFlow {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  private textPadding: number = 10
  @State
  private itemWidth: number = 10;
  @State
  private itemHeight: number = 10;

  build() {
    Row(){
      this.FlowRow()
      // this.FlowRow()
    }.backgroundColor(Color.Green)
  }

  @Builder
  FlowRow() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Canvas(this.context)
        .width(this.itemWidth)
        .height(this.itemHeight)
        .onReady(() => {
          this.context.beginPath()
          // 设置文本大小
          this.context.font = '50px sans-serif';
          this.context.beginPath()
          // 绘制填充类文本
          let text = "为什么"
          let tx = this.context.measureText(text)
          this.context.fillStyle = '#0097D4';
          this.itemWidth = tx.width + this.textPadding
          this.itemHeight = tx.height + this.textPadding
          console.log("测试："+this.itemHeight+",,,"+this.itemWidth)
          this.context.fillRect(0, 0, this.itemWidth, this.itemHeight)
          this.context.stroke()
          this.context.beginPath()
          this.context.fillStyle = '#000000';
          this.context.fillText(text, 5, 22);
        })
    }
  }
}