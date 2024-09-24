import router from '@ohos.router';

@Entry
@Component

struct challenge_1_submit{
  @State answer: string = ''
  @State TextError: string = ''
  controller: TextInputController = new TextAreaController()

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
          if (this.answer === flag) {
            AlertDialog.show({
              message:"flag信息获得正确"
            })
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