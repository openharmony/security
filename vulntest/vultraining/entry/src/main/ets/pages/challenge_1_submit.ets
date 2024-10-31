import router from '@ohos.router';
import { common } from '@kit.AbilityKit';
import fs,{Options} from '@ohos.file.fs';

@Entry
@Component

struct challenge_1_submit{
  @State answer: string = ''
  @State TextError: string = ''
  @State flag_information: string = ''
  controller: TextInputController = new TextAreaController()
  private context = getContext(this) as common.UIAbilityContext;
  private pathDir = this.context.filesDir;
  onPageShow() {
    let filePath = this.pathDir + "/flag_information.txt";
    let options: Options = {
      encoding: 'utf-8'
    };
    let readerIterator = fs.readLinesSync(filePath, options);
    for (let it = readerIterator.next(); !it.done; it = readerIterator.next()) {
      console.info("content: " + it.value);
      this.flag_information = it.value
    }
  }

  onBackPress(){
    router.pushUrl({
      url: 'pages/menu'
    })
  }
  build(){
    Column(){
      Text('请输入答案')
        .fontSize(30)
        .margin(15)
      TextInput({
        placeholder: 'flag{xxxxxx}',
        controller: this.controller
      })
        .placeholderFont({ size: 16, weight: 400 })
        .width(336)
        .height(56)
        .margin(20)
        .fontSize(16)
        .fontColor('#182431')
        .backgroundColor('#FFFFFF')
        .onChange((value: string) => {
          this.answer = value
        })
      Button('提交')
        .fontSize(30)
        .margin(20)
        .onClick(()=>{
          let flag: string = AppStorage.Get('challenge1_random_flag') as string;
          console.log('challenge1_flag: ', flag);
          if (this.answer == flag) {
            AlertDialog.show({
              message:"flag信息获得正确"
            })
            this.flag_information ='1' + this.flag_information.substring(1)
            let filePath = this.pathDir + "/flag_information.txt";
            let file = fs.openSync(filePath, fs.OpenMode.READ_WRITE);
            let writeLen = fs.writeSync(file.fd, this.flag_information);
            console.info("write data to file succeed and size is:" + writeLen);
            fs.closeSync(file);
            router.pushUrl({url:'pages/menu'})
          }
          else {
            AlertDialog.show({
              message:"flag错误"
            })
          }
        })
    }.width('100%').height('100%').backgroundColor('#F1F3F5').justifyContent(FlexAlign.Center)
  }
}