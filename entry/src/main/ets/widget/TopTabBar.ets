/*
* Copyright (c) 2024 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { Constants } from '../common/Constants';

@Preview
@Component
export struct TopTabBar {
  tabs: Resource[] = Array();
  @State currentIndex: number = 0;
  @BuilderParam
  content: ((tabName: Resource) => void) = this.doNothingBuilder;

  build() {
    Tabs({ barPosition: BarPosition.Start }) {
      ForEach(this.tabs, (tabName: Resource, index: number) => {
        TabContent() {
          Column() {
            this.content(tabName)
          }
        }.tabBar(this.TabBuilder(index))
      }, (item: string) => JSON.stringify(item));
    }
    .barHeight(Constants.TAB_BARS_BAR_HEIGHT)
    .barMode(BarMode.Scrollable)
    .barWidth(Constants.TAB_BARS_BAR_WIDTH)
    .vertical(false)
    .onAnimationStart((_index: number, targetIndex: number, _event: TabsAnimationEvent) => {
      this.currentIndex = targetIndex;
    })
  }

  @Builder
  private TabBuilder(index: number) {
    Column() {
      Text(this.tabs[index])
        .height(Constants.FULL_HEIGHT)
        .padding({ left: '2.2%', right: '2.2%' })
        .fontSize(this.currentIndex === index ? '16fp' : '14fp')
        .fontWeight(this.currentIndex === index ?
        Constants.TAB_BARS_SELECT_TEXT_FONT_WEIGHT : Constants.TAB_BARS_UN_SELECT_TEXT_FONT_WEIGHT)
        .fontColor($r('app.color.tab_selected_color'))
    }
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  private doNothingBuilder(tabName: Resource) {};
}