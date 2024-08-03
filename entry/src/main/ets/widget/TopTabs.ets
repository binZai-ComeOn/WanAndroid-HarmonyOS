import { TopTabItem } from '../bean/TopTabItem';

/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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

@Component
export struct TopTabs {
  currentIndex: number = 0;
  tabs?: TopTabItem[];
  tabsController: TabsController = new TabsController();

  // @BuilderParam
  // content: (item: TopTabItem, index: number) => void;

  build() {
    Tabs({ barPosition: BarPosition.Start, controller: this.tabsController, index: this.currentIndex }) {
      ForEach(this.tabs, (item: TopTabItem, index: number) => {
        TabContent() {
          Column() {
            if (index == 0) {
              Text("参数")
            } else if (index == 1) {
              Text("测试")
            }
          }
        }
      }, (item: TopTabItem) => JSON.stringify(item))
    }.scrollable(false).barHeight(0).height(28).backgroundColor(Color.Black).width('100%').onChange((index: number) => {
      this.currentIndex = index;
    })
  }
}