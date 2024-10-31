import router from '@ohos.router';
import flag_generate from '../pages/randomFlag'
import process from '@ohos.process';

let flag: string = AppStorage.Get('challenge1_random_flag') as string

@Entry
@Component
struct flagDialog {

  onPageShow(){
    console.log("flagDialog is action")
  }
  onBackPress() {
    router.pushUrl({
      url:'pages/challenge1'
    })
  }

  build() {
    Column() {
      Text(flag)
        .fontSize(30)
        .width('100%')
        .fontColor(Color.Black)
        .textAlign(TextAlign.Center)
        .fontWeight(FontWeight.Bold)

      Button() {
        Text('确定')
          .fontSize(30)
          .fontColor(Color.White)
          .textAlign(TextAlign.Center)
      }
      .margin({ top: 22 })
      .type(ButtonType.Capsule)
      .backgroundColor(Color.Blue)
      .width('40%')
      .onClick(() => {
        const already_get_flag1: boolean = true
        AppStorage.setOrCreate('already_get_flag1', already_get_flag1)
        router.pushUrl({
          url:'pages/challenge_1_submit'
        })
      })
    }
    .height(290)
    .padding({ left: 32, right: 32, top: 13, bottom: 33 })
    .backgroundColor(Color.White)
    .border({ color: Color.White, radius: 20 })
    .justifyContent(FlexAlign.Center)
  }
}