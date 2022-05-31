@Entry
@Component
struct FilterPage {
  @State message: string = 'Hello World'
  @State prce: number = 500
  private clist : SelectOption[] = [
    {value : "Select Category"},
    {value: "Phones"},
    {value: "Tablets"},
    {value: "Clothes"},
    {value: "Shoes"},
    {value: "Laptops"},
  ];
  private blist : SelectOption[] = [
    {value : "Select Brand"},
    {value: "Brand 1"},
    {value: "Brand 2"},
    {value: "Brand 3"},
    {value: "Brand 4"},
    {value: "Brand 5"},
  ];
  build() {
    Column()
    {
      Column(){
        // navigate the back button the home page
        Flex({justifyContent : FlexAlign.SpaceBetween}){
          Navigator({target : 'pages/mainPage',type : NavigationType.Back}) {
            Image($r("app.media.back")).width(40).height(40)
          }
          Text('Filter').fontSize(23).fontWeight(FontWeight.Bolder)

          // navigate to the home page using the menu icon
          Navigator({target : 'pages/mainPage',type : NavigationType.Back}) {
            Image($r("app.media.icon")).width(40).height(40)
          }
        }.padding({bottom :10})
      }

      // apply filter on the gender
      Column(){
        Text("Gender").fontSize(19).fontWeight(FontWeight.Bolder).padding({bottom : 20})
      }
      Flex(){
        Row({space : 10}){
          Button('Male',{type: ButtonType.Normal,stateEffect : true}).backgroundColor(0xAFEEEE).fontColor(Color.Black).borderRadius(8).height(50)
          Button('Female',{type: ButtonType.Normal,stateEffect : true}).backgroundColor(0xAFEEEE).fontColor(Color.Black).borderRadius(8).height(50)
          Button('Both',{type: ButtonType.Normal,stateEffect : true}).backgroundColor(0xAFEEEE).fontColor(Color.Black).borderRadius(8).height(50)
        }
      }.padding({bottom : 20})

      // apply the filter on the categories avialable
      Text("Category").fontSize(19).fontWeight(FontWeight.Bolder).padding({bottom : 20})
      Flex({justifyContent : FlexAlign.SpaceBetween}){
        Select(this.clist).selected(0).width(320).height(45).backgroundColor(0xAFEEEE).borderRadius(20);
      }.padding({bottom : 20})

      // apply the filter on the different brands available in the mart
      Text("Brand").fontSize(19).fontWeight(FontWeight.Bolder).padding({bottom : 20})
      Flex({justifyContent : FlexAlign.SpaceBetween}){
        Select(this.blist).selected(0).width(320).height(45).backgroundColor(0xAFEEEE).borderRadius(20);
      }.padding({bottom : 20})

      // apply the filter on the basis of price
      Text("Price").fontSize(19).fontWeight(FontWeight.Bolder).padding({bottom : 20})
      Column() {
        Text(`₹ ${this.prce}`).fontSize(18).fontWeight(FontWeight.Bolder);
        Slider({
          value: 500,
          min: 500,
          max: 10000,
          step: 500,
          style: SliderStyle.InSet
        }).onChange((value : number,mode: SliderChangeMode) => {
            this.prce = value
        })
      }
      .alignItems(HorizontalAlign.Start).padding({bottom:20})

      // apply the filters on the sizes
      Text("Sizes").fontSize(19).fontWeight(FontWeight.Bolder).padding({bottom : 20})
      Row({space: 15}){
          Button('6 inches',{type: ButtonType.Normal,stateEffect : true}).backgroundColor(0xAFEEEE).fontColor(Color.Black).borderRadius(8).width(92).height(50)
          Button('7 inches',{type: ButtonType.Normal,stateEffect : true}).backgroundColor(0xAFEEEE).fontColor(Color.Black).borderRadius(8).width(92).height(50)
          Button('8 inches',{type: ButtonType.Normal,stateEffect : true}).backgroundColor(0xAFEEEE).fontColor(Color.Black).borderRadius(8).width(92).height(50)
      }.padding({bottom : 20})

      Row({space : 20})
      {
        Button('Clear all',{type: ButtonType.Normal,stateEffect : true}).backgroundColor(0xAFEEEE).fontColor(Color.Black).borderRadius(10).width(140).height(60)
        Button('Add',{type: ButtonType.Normal,stateEffect : true}).backgroundColor(0xAFEEEE).fontColor(Color.Black).borderRadius(10).width(140).height(60)
      }
    }.margin({top :25,left :25,right :25})
  }
}