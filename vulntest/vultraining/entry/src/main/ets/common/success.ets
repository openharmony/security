import router from '@ohos.router';

PersistentStorage.PersistProp<boolean>('finish_1', true);
@CustomDialog
export struct success {
  controller: CustomDialogController

  build() {
    Column() {
      Text('成功')
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
          .onClick(()=>{
            router.pushUrl({url:'pages/menu'});
          })

      }
      .margin({ top: 22 })
      .type(ButtonType.Capsule)
      .backgroundColor(Color.Blue)
      .width('40%')
      .onClick(() => {
        this.controller.close()
      })
    }
    .height(290)
    .padding({ left: 32, right: 32, top: 13, bottom: 33 })
    .backgroundColor(Color.White)
    .border({ color: Color.White, radius: 20 })
    .justifyContent(FlexAlign.Center)
  }
}