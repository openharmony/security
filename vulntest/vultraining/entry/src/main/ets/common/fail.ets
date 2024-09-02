@CustomDialog
export struct fail {
  controller: CustomDialogController

  build() {
    Column() {
      Text('答案错误')
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