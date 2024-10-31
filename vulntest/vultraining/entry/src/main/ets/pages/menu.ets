import router from '@ohos.router';
import flag_generate from './randomFlag'
import { fileIo as fs ,Options} from '@kit.CoreFileKit';
import { common } from '@kit.AbilityKit';

@Entry
@Component
struct menu{
  scroller: Scroller = new Scroller()
  private context = getContext(this) as common.UIAbilityContext;
  private pathDir = this.context.filesDir;
  @State flag_information:string = ''

  onPageShow() {
    let filePath = this.pathDir + "/flag_information.txt";
    let options: Options = {
      encoding: 'utf-8'
    };
    let readerIterator = fs.readLinesSync(filePath, options);
    for (let it = readerIterator.next(); !it.done; it = readerIterator.next()) {
      console.info("menu_flag: " + it.value);
      this.flag_information = it.value
    }
  }

  build() {
    Scroll(this.scroller) {
      Column() {
        Text('通关点亮对应图标')
          .fontSize(30)
          .margin(15)
          .backgroundColor('#dcdcdc')
        Row(){
          Button('关卡1:', {type: ButtonType.Capsule})
            .fontSize(50)
            .margin(15)
            .onClick((event: ClickEvent) => {
              router.pushUrl({url: 'pages/challenge1'});
              const flag1: string = flag_generate();
              AppStorage.setOrCreate('challenge1_random_flag', flag1);
            });
          if (this.flag_information.charAt(0)==='1') {
            Image('images/finish.png')
              .width(70)
              .align(Alignment.Center);
          }
          else {
            Image('images/unfinish.png')
              .width(70)
              .align(Alignment.Center);
          }
        }
      }.width('100%').height('100%').backgroundColor('#F1F3F5').justifyContent(FlexAlign.Center).backgroundImage('images/menu.jpg').backgroundImageSize(ImageSize.Cover)
    }
    .scrollable(ScrollDirection.Vertical)
    .scrollBar(BarState.On)
    .scrollBarColor(Color.Gray)
    .scrollBarWidth(10)
    .align(Alignment.Center);
  }
}