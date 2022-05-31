import router from '@system.router'

@Entry
@Component
struct DetailsPage {
  @State message: string = 'Hello World'
  @State typ: string = router.getParams().typ.toString()
  @State name: string = router.getParams().name.toString()
  @State price: string = router.getParams().price.toString()
  scroller: Scroller = new Scroller()
  @State value : number = 1;
  build() {
    Column()
    {
      Column(){
        //navigate to the home page using the back button
        Flex({justifyContent : FlexAlign.SpaceBetween}){
          Navigator({target : 'pages/mainPage',type : NavigationType.Back}) {
            Image($r("app.media.back")).width(40).height(40)
          }
          //navigate to the home page using the main menu icon
          Text('Details').fontSize(23).fontWeight(FontWeight.Bolder)
          Navigator({target : 'pages/mainPage',type : NavigationType.Back}) {
            Image($r("app.media.icon")).width(40).height(40)
          }

        }.padding({bottom :10})
        Stack({alignContent: Alignment.BottomEnd}) {
          // showing the details of the selected item
          if(this.typ=='shoe_3'){
            Image($r("app.media.shoe_3")).width(300).height(300);
          }
          if(this.typ=='shoe_4'){
            Image($r("app.media.shoe_4")).width(300).height(300);
          }
          if(this.typ=='tab_1'){
            Image($r("app.media.tab_1")).width(300).height(300);
          }
          if(this.typ=='tab_2'){
            Image($r("app.media.tab_2")).width(300).height(300);
          }
          if(this.typ=='cloth_1'){
            Image($r("app.media.cloth_1")).width(300).height(300);
          }
          if(this.typ=='cloth_2'){
            Image($r("app.media.cloth_2")).width(300).height(300);
          }
          if(this.typ=='cloth_3'){
            Image($r("app.media.cloth_3")).width(300).height(300);
          }
          if(this.typ=='cloth_4'){
            Image($r("app.media.cloth_4")).width(300).height(300);
          }
          if(this.typ=='phone'){
            Image($r("app.media.phone")).width(300).height(300);
          }
          if(this.typ=='phone_2'){
            Image($r("app.media.phone_2")).width(300).height(300);
          }
          if(this.typ=='lapi_1'){
            Image($r("app.media.lapi_1")).width(300).height(300);
          }
          if(this.typ=='lapi_2'){
            Image($r("app.media.lapi_2")).width(300).height(300);
          }
          // review & rating of the item
          Column({space: 5}) {
            Row({space: 5}) {
              Image($r("app.media.star")).width(30).height(30);
              Text("4.5").fontWeight(FontWeight.Bolder).fontSize(20).fontColor(Color.White)
            }
            Text("200 reviews").fontColor(Color.White).fontWeight(FontWeight.Bold);
          }
          .backgroundColor(Color.Black)
          .borderRadius(10)
          .borderWidth(5)
          .borderColor(Color.White);
        }
        .width(320)
        .borderWidth(3)
        .borderRadius(20);
        Column(){
          Text(`${this.name}`).fontWeight(FontWeight.Bolder).fontSize(25).width('100%').textAlign(TextAlign.Start);
          Text(`${this.price}`).fontWeight(FontWeight.Bolder).fontSize(18).width('100%').textAlign(TextAlign.Start);
        }.padding({bottom : 20})
        Scroll(this.scroller) {
          Text("Lorem ipsum dolor sit amet. Est rerum internos sed totam consequuntur ea vero asperiores et fuga numquam. Sed animi quis et quia fuga et maxime facere sed voluptatem dolor. Aut sapiente totam aut quod atque est neque adipisci ut error reprehenderit. Ut maiores dolores aut voluptate  non enim odit eum quis consequatur ut beatae voluptasEt earum velit ut omnis beatae et dolorem quae qui dolor accusantium et minima tenetur eos rerum facere. Sit deleniti reiciendis sed culpa dolor ut dolorem quia aut atque rerum ut eius placeat. Et quasi rerum ad neque necessitatibus et ullam galisum et sunt commodi aut quia ullam. Non odio obcaecati vel cumque obcaecati id modi illum et rerum galisum est reprehenderit quibusdam qui deleniti totam. Qui laborum quos et sequi eligendi et explicabo molestiae ea dolor similique! Et amet natus id explicabo omnis in quae molestiae et sint quas quo quasi tenetur sit consectetur adipisci")
            .fontColor(0XAFEEEE)
            .fontSize(15);
        }
        .scrollable(ScrollDirection.Vertical)
        .scrollBar(BarState.On)
        .height(100).padding({bottom : 10});

        //colors available for the item
        Flex({justifyContent: FlexAlign.SpaceAround, alignItems: ItemAlign.Center}) {
          Text("Color: ").fontSize(15).fontWeight(FontWeight.Bold);
          Column() {
            Radio({group: "Color", value: "gray"}).backgroundColor(Color.Gray).width(15).height(15).borderRadius(28);
          }
          Column() {
            Radio({group: "Color", value: "Yellow"}).backgroundColor(Color.Yellow).width(15).height(15).borderRadius(28);
          }
          Column() {
            Radio({group: "Color", value: "Red"}).backgroundColor(Color.Red).width(15).height(15).borderRadius(28);
          }
          Counter(){
            Text(this.value.toString())
          }.onInc(() => {
            this.value++;
          }).onDec(() => {
            this.value--;
          })
        }

        // available sizes for the item
        Text("Sizes").fontSize(19).fontWeight(FontWeight.Bolder).padding({bottom : 10})
        Row({space: 15}){
          Button('6 inches',{type: ButtonType.Normal,stateEffect : true}).backgroundColor(0xAFEEEE).fontColor(Color.Black).borderRadius(8).width(92).height(50)
          Button('7 inches',{type: ButtonType.Normal,stateEffect : true}).backgroundColor(0xAFEEEE).fontColor(Color.Black).borderRadius(8).width(92).height(50)
          Button('8 inches',{type: ButtonType.Normal,stateEffect : true}).backgroundColor(0xAFEEEE).fontColor(Color.Black).borderRadius(8).width(92).height(50)
        }.padding({bottom : 10})

        // add to cart option and add to favs option
        Row({space : 20})
        {
          Button({type:ButtonType.Circle,stateEffect: true}){
            Image($r("app.media.favs")).width(40).height(40)
          }.borderRadius(20)
          Button("Add to Cart",{type: ButtonType.Circle,stateEffect : true}){
            Text("Add to Cart").fontSize(15)
            Image($r("app.media.mycart")).width(30).height(30).backgroundColor(Color.White)
           }.width(250)
        }
      }
    }.margin({top :25,left :25,right :25})
  }
}