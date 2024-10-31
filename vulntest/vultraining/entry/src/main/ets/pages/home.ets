import router from '@ohos.router';
import { fileIo as fs } from '@kit.CoreFileKit';
import { common } from '@kit.AbilityKit';

interface JsonData {
  "challenge": string;
  "flag": boolean;
}

@Entry
@Component
struct home {
  private context = getContext(this) as common.UIAbilityContext;
  private pathDir = this.context.filesDir;

  build() {
    Column() {
      Button('开始闯关')
        .fontSize(50)
        .margin(30)
        .onClick(() => {
            let filePath = this.pathDir + "/flag_information.txt";
            let file = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
            let flag_list: string = new Array(30).fill('0').join('');
            let writeLen = fs.writeSync(file.fd, flag_list);
            console.info("write data to file succeed and size is:" + writeLen);
            fs.closeSync(file);
          router.pushUrl({ url: 'pages/menu' })
        })
      Text('这是一个闯关类型的靶场应用，每关对应一个安全知识点')
        .fontSize(20)
        .backgroundColor('#dcdcdc')
        .width("80%")
      Text('所有关卡的答案类型均为flag{xxxxxx}6个字符')
        .fontSize(20)
        .backgroundColor('#dcdcdc')
        .width("80%")
    }.width('100%').height('100%').backgroundColor('#F1F3F5').justifyContent(FlexAlign.Center).backgroundImage('images/bg.jpg').backgroundImageSize(ImageSize.Cover)
  }
}

function str(index: number) {
  throw new Error('Function not implemented.');
}
