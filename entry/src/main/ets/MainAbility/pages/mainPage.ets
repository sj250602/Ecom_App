@Entry
@Component
struct MainPage {
  @State message: string = 'Hello World'
  scroller: Scroller = new Scroller()
  @State cat : string = 'All'
  @State typ: string = 'shoe_3'
  @State name: string = 'Formal Office Shoes'
  @State price : string = '₹ 4000'
  private controller: TabsController = new TabsController()
  build() {
    Column({space : 5}){
      //for upper panel of the app
      Flex({direction : FlexDirection.Row,justifyContent:FlexAlign.SpaceBetween}){
        // main menu image in the top left cornor
        Image($r("app.media.icon")).width(40).height(40)
        // user icon on the top right cornor
        Image($r("app.media.gender")).width(40).height(40)
      }.padding({bottom : 10})
      // text that user can see on the app
      Text("Discover our new items").fontSize(22).fontWeight(FontWeight.Bold).padding({bottom :20}).textAlign(TextAlign.Start)
      // for the search bar and the filter page
      Flex({justifyContent:FlexAlign.SpaceBetween}){
        // search bar
        TextArea({placeholder : "Q Search"}).width(250)
        // filter navigate to the filter page
        Navigator({target : 'pages/filterPage',type : NavigationType.Push}) {
          Image($r("app.media.filter")).width(40).height(40)
        }
      }.padding({bottom : 10})

      //Display the upcomg shoes
      Flex({justifyContent: FlexAlign.SpaceAround,alignItems: ItemAlign.Center}){
        // image of the upcoming shoe
        Image($r("app.media.shoe_1")).width(70).height(70)
        //write some text for the shoes
        Column()
        {
          Text("Running Unisex shoes").fontSize(15).fontWeight(FontWeight.Bolder).width(130)
          Text("Coming Soon...").fontSize(15).fontWeight(FontWeight.Bolder).width(130).fontColor(Color.Blue)
        }.width(130)

        Column(){
          //make a toggle for notify or not
          Toggle({type: ToggleType.Switch,isOn: false}).width(40).height(15)
          Text('Notify Me').fontSize(13).fontColor(Color.Gray)
        }
      }.borderRadius(15).borderWidth(3).height(88).padding({bottom: 10})

      //define the categories different types
      Text("Categories").fontSize(20).fontWeight(FontWeight.Bold).textAlign(TextAlign.Start).padding({bottom :10})
      // define a scroller so that many things are in the same window
      Scroll(this.scroller){
        Row({space : 6})
        {
          // to show all the things avilable
          Button('All',{type: ButtonType.Normal,stateEffect : true}).backgroundColor(0xAFEEEE).fontColor(Color.Black).onClick(() => {
            this.cat = 'All'
          }).borderRadius(8)
          // to show all the shoes
          Button('Shoes',{type: ButtonType.Normal,stateEffect : true}).backgroundColor(0xAFEEEE).fontColor(Color.Black).onClick(() => {
            this.cat = 'Shoes'
          }).borderRadius(8)
          // to show all the tablets
          Button('Tablets',{type: ButtonType.Normal,stateEffect : true}).backgroundColor(0xAFEEEE).fontColor(Color.Black).onClick(() => {
            this.cat = 'Tablets'
          }).borderRadius(8)
          // to show the phones
          Button('Phones',{type: ButtonType.Normal,stateEffect : true}).backgroundColor(0xAFEEEE).fontColor(Color.Black).onClick(() => {
            this.cat = 'Phones'
          }).borderRadius(8)
          // to show the clothes
          Button('Clothes',{type: ButtonType.Normal,stateEffect : true}).backgroundColor(0xAFEEEE).fontColor(Color.Black).onClick(() => {
            this.cat = 'Clothes'
          }).borderRadius(8)
          // to show the laptops
          Button('Laptops',{type: ButtonType.Normal,stateEffect : true}).backgroundColor(0xAFEEEE).fontColor(Color.Black).onClick(() => {
            this.cat = 'Laptops'
          }).borderRadius(8)
        }
      }.scrollBar(BarState.On).scrollable(ScrollDirection.Horizontal).padding({bottom :10})

      Flex({justifyContent : FlexAlign.SpaceBetween}){
        //Shoeing the popular things in the category selected
        Text(`Popular ${this.cat}`).fontSize(15).fontWeight(FontWeight.Bolder)
        Row({space:3})
        {
          Text('View All').fontSize(15).fontWeight(FontWeight.Bolder)
          Button('>',{type:ButtonType.Normal,stateEffect : true}).width(15).height(15).padding(0).borderRadius(8)
        }
      }.padding({bottom :10})

      //make a grid to show the all category item of the selected category
      Grid(this.scroller) {
          if (this.cat == 'All' || this.cat == 'Shoes') {
            GridItem() {
              // navigate to details page when we select any object
              Navigator({target : 'pages/detailsPage',type : NavigationType.Push}) {
                Column() {
                  Image($r("app.media.shoe_3")).objectFit(ImageFit.Cover).width(130).height(130);
                  Text("Formal Office Shoes").fontWeight(FontWeight.Bolder).fontSize(12);
                  Text("₹ 4000").fontWeight(FontWeight.Bolder).fontSize(15);
                }
                .alignItems(HorizontalAlign.Start)
                .borderWidth(2)
                .borderRadius(6)
                .width(140);
              }.params({ typ: 'shoe_3',name : 'Formal Office Shoes',price: '₹ 4000' })
            }

            GridItem() {
              Navigator({target : 'pages/detailsPage',type : NavigationType.Push}) {
                Column() {

                  Image($r("app.media.shoe_4")).objectFit(ImageFit.Cover).width(130).height(130);
                  Text("Formal Office Shoes").fontWeight(FontWeight.Bolder).fontSize(12);
                  Text("₹ 2500").fontWeight(FontWeight.Bolder).fontSize(15);
                }
                .alignItems(HorizontalAlign.Start)
                .borderWidth(2)
                .borderRadius(10)
                .width(140);
              }.params({ typ: 'shoe_4',name : 'Formal Office Shoes',price: '₹ 2500' })
            }
          }
          if (this.cat == 'All' || this.cat == 'Tablets') {
            GridItem() {
              Navigator({ target: 'pages/detailsPage', type: NavigationType.Push }) {
                Column() {
                  Image($r("app.media.tab_1")).objectFit(ImageFit.Cover).width(130).height(130);
                  Text("Tablet(8GB RAM)").fontWeight(FontWeight.Bolder).fontSize(12);
                  Text("₹ 14000").fontWeight(FontWeight.Bolder).fontSize(15);
                }
                .alignItems(HorizontalAlign.Start)
                .borderWidth(2)
                .borderRadius(6)
                .width(140);
              }.params({ typ: 'tab_1',name : 'Tablet(8GB RAM)',price: '₹ 14000' })
            }
            GridItem() {
              Navigator({ target: 'pages/detailsPage', type: NavigationType.Push }) {
                Column() {
                  Image($r("app.media.tab_2")).objectFit(ImageFit.Cover).width(130).height(130);
                  Text("Tablet(4GB RAM)").fontWeight(FontWeight.Bolder).fontSize(12);
                  Text("₹ 10000").fontWeight(FontWeight.Bolder).fontSize(15);
                }
                .alignItems(HorizontalAlign.Start)
                .borderWidth(2)
                .borderRadius(10)
                .width(140);
              }.params({ typ: 'tab_2',name : 'Tablet(4GB RAM)',price: '₹ 10000' })
            }
          }

          if (this.cat == 'All' || this.cat == 'Phones') {
            GridItem() {
              Navigator({ target: 'pages/detailsPage', type: NavigationType.Push }) {
                Column() {
                  Image($r("app.media.phone")).objectFit(ImageFit.Cover).width(130).height(130);
                  Text("SmartPhone(8GB RAM)").fontWeight(FontWeight.Bolder).fontSize(12);
                  Text("₹ 24000").fontWeight(FontWeight.Bolder).fontSize(15);
                }
                .alignItems(HorizontalAlign.Start)
                .borderWidth(2)
                .borderRadius(6)
                .width(140);
              }.params({ typ: 'phone',name : 'SmartPhone(8GB RAM)',price: '₹ 24000' })
            }

            GridItem() {
              Navigator({target : 'pages/detailsPage',type : NavigationType.Push}) {
                Column() {

                  Image($r("app.media.phone_2")).objectFit(ImageFit.Cover).width(130).height(130);
                  Text("SmartPhone(6 GB RAM)").fontWeight(FontWeight.Bolder).fontSize(12);
                  Text("₹ 15000").fontWeight(FontWeight.Bolder).fontSize(15);
                }
                .alignItems(HorizontalAlign.Start)
                .borderWidth(2)
                .borderRadius(10)
                .width(140);
              }.params({ typ: 'phone_2',name : 'SmartPhone(6 GB RAM)',price: '₹ 15000' })
            }
          }
          if (this.cat == 'All' || this.cat == 'Clothes') {
            GridItem() {
              Navigator({target : 'pages/detailsPage',type : NavigationType.Push}) {
                Column() {

                  Image($r("app.media.cloth_1")).objectFit(ImageFit.Cover).width(130).height(130);
                  Text("T shirt(L)").fontWeight(FontWeight.Bolder).fontSize(12);
                  Text("₹ 400").fontWeight(FontWeight.Bolder).fontSize(15);
                }
                .alignItems(HorizontalAlign.Start)
                .borderWidth(2)
                .borderRadius(6)
                .width(140);
              }.params({ typ: 'cloth_1',name : 'T shirt(L)',price: '₹ 400' })
            }

            GridItem() {
              Navigator({target : 'pages/detailsPage',type : NavigationType.Push}) {
                Column() {

                  Image($r("app.media.cloth_2")).objectFit(ImageFit.Cover).width(130).height(130);
                  Text("T shirt(XL)").fontWeight(FontWeight.Bolder).fontSize(12);
                  Text("₹ 1500").fontWeight(FontWeight.Bolder).fontSize(15);
                }
                .alignItems(HorizontalAlign.Start)
                .borderWidth(2)
                .borderRadius(10)
                .width(140);
              }.params({ typ: 'cloth_2',name : 'T shirt(XL)',price: '₹ 1500' })
            }

            GridItem() {
              Navigator({target : 'pages/detailsPage',type : NavigationType.Push}) {
                Column() {

                  Image($r("app.media.cloth_3")).objectFit(ImageFit.Cover).width(130).height(130);
                  Text("Jeans").fontWeight(FontWeight.Bolder).fontSize(12);
                  Text("₹ 800").fontWeight(FontWeight.Bolder).fontSize(15);
                }
                .alignItems(HorizontalAlign.Start)
                .borderWidth(2)
                .borderRadius(6)
                .width(140);
              }.params({ typ: 'cloth_3',name : 'Jeans',price: '₹ 800' })
            }

            GridItem() {
              Navigator({target : 'pages/detailsPage',type : NavigationType.Push}) {
                Column() {

                  Image($r("app.media.cloth_4")).objectFit(ImageFit.Cover).width(130).height(130);
                  Text("Denim Jeans").fontWeight(FontWeight.Bolder).fontSize(12);
                  Text("₹ 2500").fontWeight(FontWeight.Bolder).fontSize(15);
                }
                .alignItems(HorizontalAlign.Start)
                .borderWidth(2)
                .borderRadius(10)
                .width(140);
              }.params({ typ: 'cloth_4',name : 'Denim Jeans',price: '₹ 2500' })
            }
          }
          if (this.cat == 'All' || this.cat == 'Laptops') {
            GridItem() {
              Navigator({target : 'pages/detailsPage',type : NavigationType.Push}) {
                Column() {

                  Image($r("app.media.lapi_1")).objectFit(ImageFit.Cover).width(130).height(130);
                  Text("Laptop(8GB RAM)").fontWeight(FontWeight.Bolder).fontSize(12);
                  Text("₹ 64000").fontWeight(FontWeight.Bolder).fontSize(15);
                }
                .alignItems(HorizontalAlign.Start)
                .borderWidth(2)
                .borderRadius(6)
                .width(140);
              }.params({ typ: 'lapi_1',name : 'Laptop(8GB RAM)',price: '₹ 64000' })
            }

            GridItem() {
              Navigator({target : 'pages/detailsPage',type : NavigationType.Push}) {
                Column() {
                  Image($r("app.media.lapi_2")).objectFit(ImageFit.Cover).width(130).height(130);
                  Text("Laptop(4GB RAM)").fontWeight(FontWeight.Bolder).fontSize(12);
                  Text("₹ 45000").fontWeight(FontWeight.Bolder).fontSize(15);

                }
                .alignItems(HorizontalAlign.Start)
                .borderWidth(2)
                .borderRadius(10)
                .width(140);
              }.params({ typ: 'lapi_2',name : 'Laptop(4GB RAM)',price: '₹ 45000' })
            }
          }
      }.columnsTemplate('1fr 1fr')
        .columnsGap(10)
        .height(300)
        .backgroundColor(Color.White)
        .width('90%')
      // down tabs
      Flex({ justifyContent: FlexAlign.SpaceBetween })
      {
        Column()
        {
          //home icon
          Image($r('app.media.home')).width(30).height(30)
          Text('Home').fontSize(13).fontWeight(FontWeight.Bolder)
        }
        Column()
        {
          //category icon
          Image($r('app.media.catgory')).width(30).height(30)
          Text('Categories').fontSize(13).fontWeight(FontWeight.Bolder)
        }
        Column()
        {
          //notification icon
          Image($r('app.media.notify')).width(30).height(30)
          Text('Notification').fontSize(13).fontWeight(FontWeight.Bolder)
        }
        Column()
        {
          //cart icon
          Image($r('app.media.cart')).width(30).height(30)
          Text('My Cart').fontSize(13).fontWeight(FontWeight.Bolder)
        }
      }
    }.margin({top : 25,left : 25,right : 25})
  }
}