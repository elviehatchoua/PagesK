                Container(
                          height: 170,
                         //width: 10,
                        // padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                          margin: const EdgeInsets.only(
                            right: defaultPadding+200, top: 5, left: 3, bottom: 5
                          ) ,
                          decoration: BoxDecoration(
                            
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(defaultPadding),
                            boxShadow: [
                              BoxShadow(
                                color: ColorTheme.disabledColor,
                                blurRadius: 5,
                                spreadRadius: 2),  
                            ]
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.add),
                              Text("faire un"),
                              Text("pret")
                            ],
                          ),
                        )
                ],
              ),
            ),
          
        //celui qui fonctionne bien
/*           Container (
            height: 190,
            color: ColorTheme.scaffoldBackgroundColor,
            margin: EdgeInsets.only(bottom: MediaQueryHeight / 40),
            child: ListView.builder(
              padding: EdgeInsets.only(left: MediaQueryWidth / 30),
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) => Row(
                children: [
                  Container(
                    width: MediaQueryWidth / 1.3,
                    padding: const EdgeInsets.all(defaultPadding),
                    margin: const EdgeInsets.only(
                        right: defaultPadding, top: 5, left: 3, bottom: 5),
                    decoration: BoxDecoration(
                      color: ColorTheme.backgroundColor,
                      borderRadius: BorderRadius.circular(defaultRadius),
                      boxShadow: [
                        BoxShadow(
                            color: ColorTheme.disabledColor,
                            blurRadius: 5,
                            spreadRadius: 2),
                      ],
                    ),
                    child: monthlyBudgetsList.length != null &&
                            monthlyBudgetsList.isNotEmpty
                        ?  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.add),
                              Text("faire un"),
                              Text("pret")
                            ],
                          )
                        : const Center(child: CircularProgressIndicator()),
                  ),
                ],
              ),
            ),
          ), */


          // avec mon jolie bloc

          /*
          * Container(
            height: 190,
            color: Theme.of(context).scaffoldBackgroundColor,
            margin: EdgeInsets.only(bottom: MediaQueryHeight / 40),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>
                [
/*                     Container(
                      width: MediaQueryWidth/3,
                      padding: const EdgeInsets.all(defaultPadding),
                      margin: const EdgeInsets.only(
                          right: defaultPadding, top: 5, left: 3, bottom: 5),
                      decoration: BoxDecoration(
                        color:  Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(defaultRadius),
                        boxShadow: [
                          BoxShadow(
                              color: Theme.of(context).disabledColor,
                              blurRadius: 5,
                              spreadRadius: 2
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Icon(Icons.add_circle, color: Theme.of(context).primaryColor,size: 35,),
                          const Text('créer une', style: TextStyle(fontSize: 15),),
                          const Text('story', style: TextStyle(fontSize: 15)),
                        ],
                      ),
                    ), */
           


                    ///pb with the scrollable row

                    Container(
                      height: 190,
                      color: Theme.of(context).scaffoldBackgroundColor,
                      margin: EdgeInsets.only(bottom: MediaQueryHeight / 40),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>
                          [
                            ListView.builder(
                                itemCount: 3,
                                     //scrollDirection: Axis.horizontal,
                                itemBuilder:  ( BuildContext context, int index) {
                                  return Container(
                                    width: MediaQueryWidth/3,
                                    padding: const EdgeInsets.all(defaultPadding),
                                    margin: const EdgeInsets.only(
                                        right: defaultPadding, top: 5, left: 3, bottom: 5),
                                    decoration: BoxDecoration(
                                      color:  Theme.of(context).scaffoldBackgroundColor,
                                      borderRadius: BorderRadius.circular(defaultRadius),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Theme.of(context).disabledColor,
                                            blurRadius: 5,
                                            spreadRadius: 2
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Icon(Icons.add_circle, color: Theme.of(context).primaryColor,size: 35,),
                                        const Text('créer une', style: TextStyle(fontSize: 15),),
                                        const Text('story', style: TextStyle(fontSize: 15)),
                                      ],
                                    ),
                                  );
                                    }
                            ),
                               
                              
                          ],
                        ),
                      ),            
                    ),


                    child:  Text('Qui peut me faire un pret de 1000Fcfa', style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 10),),

                    child:  Text("Rostow", style: Theme.of(context).textTheme.caption,)