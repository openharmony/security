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
            // const KEY_TEST_STRING_ELEMENT = 'key_test_string';
            // const VALUE_TEST_STRING_ELEMENT = 'value_test_string';
            // try {
            //   kvStore.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT, (err) => {
            //     if (err !== undefined) {
            //       console.error(`Failed to put data. Code:${err.code},message:${err.message}`);
            //       return;
            //     }
            //     console.info('Succeeded in putting data.');
            //   });
            // } catch (e) {
            //   console.error(`An unexpected error occurred. Code:${e.code},message:${e.message}`);
            // }
            // PersistentStorage.PersistProp('finish_1', true);
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