

import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:product_list/api/product_api.dart';
import 'package:product_list/product%20list/product_list.dart';

class Everything extends StatefulWidget {
  const Everything({super.key});

  @override
  State<Everything> createState() => _EverythingState();
}

class _EverythingState extends State<Everything> {
  List<Products> data = [];

  getData()async{
    data = await ProductListService.productListService();
    log("========== Data :${data.length}");
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.orange[800],
            floating: true,
            expandedHeight: 160,
            flexibleSpace: FlexibleSpaceBar(
              background: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20),
                  child: Column(
                    children: [
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 30,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 28.0),
                            child: Text(
                              "All Shop Products",
                              style: TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 40,

                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Search here",
                              style:
                              TextStyle(fontSize: 17, color: Colors.grey),
                            ),
                            Icon(Icons.search_outlined,
                                size: 20, color: Colors.orange[800])
                          ],
                        ),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.filter_list,
                                size: 30,
                                color: Colors.white,
                              ),
                              Text(
                                "Filter",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          Text("Total item : 23",
                              style: TextStyle(color: Colors.white))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: GridView.builder(
              physics: const PageScrollPhysics(),
              shrinkWrap: true,
              itemCount:data.length,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.9),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8,right: 8),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            width: 0.5, color: Colors.grey),
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      children: [ Image.network(
                          "https://cit-ecommerce-codecanyon.bandhantrade.com/${data[index].image}"),
                        Column(
                          children: [
                            Text(
                                "${data[index].nameEn }"),
                            const Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.star,color: Colors.orange,size: 15),
                                Icon(Icons.star,color: Colors.orange,size: 15),
                                Icon(Icons.star_border_outlined,color: Colors.orange,size: 15),
                                Icon(Icons.star_border_outlined,color: Colors.orange,size: 15),
                                Icon(Icons.star_border_outlined,color: Colors.orange,size: 15),
                              ],
                            ),
                            Text(
                                "${data[index].regPrice} Tk"),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )


        ],
      ),
    );
  }
}